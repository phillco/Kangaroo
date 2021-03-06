package kangaroo

import grails.converters.JSON
import kangaroo.data.BackendDataService

class HomeController {

    def dataTablesService

    def index = {
        [tableJson: dataTablesService.getTableCached(Term.currentTerm), departmentsJson: (getDepartmentsMap() as JSON)]
    }

    /**
     * Called via AJAX: returns the table data for the given term in JSON form.
     */
    def getData = {
        render([table: JSON.parse(dataTablesService.getTableCached(Term.findOrCreate(params.term)))] as JSON)
    }

    def getDepartmentsMap() {
        def map = [:]
        Department.list().each { map[it.id] = it.name }
        return map;
    }

    def robots = {
        render(view: "/robots", contentType: "text/plain")
    }
}
