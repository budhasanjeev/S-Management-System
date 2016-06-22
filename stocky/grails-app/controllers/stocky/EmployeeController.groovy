package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")

class EmployeeController {

    def index() {
        def userLists = [];
        def shareholderLists = []

        def userList = UserRole.findAllByRole(Role.findByAuthority("ROLE_SHAREHOLDER"))

        println("+=="+userList)
        userList.each {

            userLists.add(User.findById(it.user.id))

            shareholderLists.add(Shareholder.findByUser(it.user))

        }

        render(view: '/employee/employee-landingpage', model: [userLists:userLists,shareholderLists:shareholderLists])
    }
}