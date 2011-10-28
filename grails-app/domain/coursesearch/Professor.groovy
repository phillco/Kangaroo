package coursesearch

import coursesearch.mn.Teaching

class Professor {

    static hasMany = [officeHours: MeetingTime]

    def redisService

    String name

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
}
