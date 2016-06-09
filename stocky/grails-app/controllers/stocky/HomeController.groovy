package stocky

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def springSecurityService

    def index() {
        def changeDesign = ChangeDesign.first();

        session.setAttribute("logo",changeDesign.fileName)
        session.setAttribute("menu_color",changeDesign.menuColor)
        session.setAttribute("text_color",changeDesign.textColor)
        session.setAttribute("hover_color",changeDesign.hoverColor)
        session.setAttribute("hover_text_color",changeDesign.hoverTextColor)
        session.setAttribute("footer_color",changeDesign.footerColor)
        session.setAttribute("footer_text_color",changeDesign.footerTextColor)

        if(springSecurityService.isLoggedIn()){

            if(SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")){

                def shareValue = ShareValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def authorizedCapitalValue = AuthorizedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def issuedCapitalValue = IssuedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def paidCapitalValue = PaidCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);

                def userList = UserRole.findAllByRole(Role.findByAuthority('ROLE_SHAREHOLDER'))
                def userLists=[]

                userList.each{
                    userLists.add(User.findById(it.user.id))
                }
                session.user = springSecurityService.getCurrentUser()
                render(view: '/adminView/admin-landing',model: [role:"SHAREHOLDER",shareValue:shareValue.shareValue.join(),authorizedCapitalValue:authorizedCapitalValue.authorizedCapitalValue.join(),issuedCapitalValue:issuedCapitalValue.issuedCapitalValue.join(),paidCapitalValue:paidCapitalValue.paidCapitalValue.join(),shareholderLists:userLists])
            }
            if (SpringSecurityUtils.ifAllGranted("ROLE_SHAREHOLDER")){

                User currentLoggedInUser = springSecurityService.getCurrentUser();
                def shareValue = Share.findAllByUser(currentLoggedInUser);
                def shareHolder = Shareholder.findByUser(currentLoggedInUser)

                render(view: '/shareholder/shareholderView',model: [shareValue: shareValue,userInfo:currentLoggedInUser,additional:shareHolder])
            }
            if (SpringSecurityUtils.ifAllGranted("ROLE_EMPLOYEE")){

               redirect(controller: 'employee',action: 'index')
            }
        }
        else{

            def config = SpringSecurityUtils.securityConfig
            String view = '/home'
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            session.postUrl = postUrl
            render view: view, model: [postUrl: postUrl,
                                       rememberMeParameter: config.rememberMe.parameter]
        }

    }

    def investors(){
        def userList = UserRole.findAllByRole(Role.findByAuthority('ROLE_SHAREHOLDER'))
        def userLists=[]

        userList.each{
            userLists.add(User.findById(it.user.id))

        }
        render (view: '/landing-page-shareholder',model:[userList:userLists])
    }

    def event(){
        render (view: '/event')
    }

    def form(){
        render (view: '/event')
    }

    def news(){

        def newsList = News.findAll()

        render (view: '/adminView/add-news',model: [newsLists:newsList])
    }

    def gallery(){
        render (view: '/gallery')
    }

    def shareholder(){
        render (view: '/shareholder')
    }

    def addUser(){
        render (view: '/adminView/user/add-user')
    }

    def addNews(){
        render (view: '/adminView/add-news')
    }

    def addMinute(){
        redirect(controller: 'minute',action: 'index')
    }


    def changeDesign(){
        render (view: '/adminView/change-page-design')
    }

}