dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "coursesearch"
    password = "sz7v8YTVGsV2qvaW"
    loggingSql = false
    validationQuery = "SELECT 1"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:kangarooDevDb"
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:mem:kangarooTestDb"
            driverClassName = "org.hsqldb.jdbcDriver"
            username = "sa"
            password = ""
        }
    }
    production {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/course_search?useUnicode=true&amp;characterEncoding=utf8"
        }
    }
}
