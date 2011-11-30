package coursesearch

import coursesearch.mn.ProfessorOfficeHours
import coursesearch.mn.Teaching

/**
 * The facilitators of learning, the lifeblood of a university, the people who hate grading.
 */
class Professor {

    def redisService

    String name

    /**
     * Has this professor been matched with the faculty data from github.com/austin-college/data?
     * If so -> we will have their photo, title, office location, phone number, and department.
     * If not -> this means they were listed in the course catalog as teaching a class, but not on the austin-college website.
     */
    boolean matched = false

    String photoUrl
    String title
    String department
    String office
    String phone
    String email

    static constraints = {
        photoUrl(nullable: true)
        title(nullable: true)
        department(nullable: true)
        office(nullable: true)
        phone(nullable: true)
        email(nullable: true)
    }

    String toString() { name }

    List<Professor> getColleagues() {

        def ids = (List<Long>) redisService.memoizeDomainIdList(Professor, "professor/${this.id}/colleagues") { def redis ->

            // EXPENSIVE AND HACKY QUERY
            Set<Professor> colleagues = [];
            activeDepartments.each { dept ->
                Course.findAllByDepartment(dept).each { course ->
                    course.instructors.each { instr ->
                        if (!instr.name.contains("STAFF"))
                            colleagues << instr
                    }
                }
            }

            colleagues.remove(this);
            return ((colleagues as List).sort({a, b -> return a.name.compareTo(b.name)}));
        }

        ids.collect { id -> Professor.get(id)}
    }

    List<Department> getActiveDepartments() {
        def depts = (coursesTeaching*.department as Set);
        depts.remove(Department.findByCode("CI"));

        (depts as List).sort({a, b -> return a.name.compareTo(b.name)});
    }

    List<String> getActiveRooms() {
        def rooms = (coursesTeaching*.room as Set);
        rooms.remove("");
        (rooms as List).sort({a, b -> return a.compareTo(b)});
    }

    List<Course> getCoursesForRoom(String room) {
        coursesTeaching.findAll { course -> course.room == room };
    }

    List<Course> getCoursesTeaching() { return Teaching.findAllByProfessor(this)*.course }

    List<MeetingTime> getOfficeHours() { return ProfessorOfficeHours.findAllByProfessor(this)*.meetingTime }
}
