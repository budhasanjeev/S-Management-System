package stocky

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def springSecurityService

    def index() {
        def changeDesign = ChangeDesign.first(); /*gets latest design entries*/

        /*saves design parameters in session object*/
        session.setAttribute("logo",changeDesign.fileName)
        session.setAttribute("menu_color",changeDesign.menuColor)
        session.setAttribute("text_color",changeDesign.textColor)
        session.setAttribute("hover_color",changeDesign.hoverColor)
        session.setAttribute("hover_text_color",changeDesign.hoverTextColor)
        session.setAttribute("footer_color",changeDesign.footerColor)
        session.setAttribute("footer_text_color",changeDesign.footerTextColor)

        /*checks for authorization parameters after successful login*/
        if(springSecurityService.isLoggedIn()){

            /*user has Admin role*/
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
            /*user with shareholder role*/
            if (SpringSecurityUtils.ifAllGranted("ROLE_SHAREHOLDER")){

                User currentLoggedInUser = springSecurityService.getCurrentUser();
                def shareValue = ShareValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def share = Share.findAllByUser(currentLoggedInUser);
                def shareHolder = Shareholder.findByUser(currentLoggedInUser)
                def issuedCapitalValue = IssuedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def authorizedCapitalValue = AuthorizedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
                def paidCapitalValue = PaidCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);

                render(view: '/shareholder/shareholderView',model: [share:share,authorizedCapitalValue:authorizedCapitalValue.authorizedCapitalValue.join(),issuedCapitalValue:issuedCapitalValue.issuedCapitalValue.join(),paidCapitalValue:paidCapitalValue.paidCapitalValue.join(),shareValue: shareValue.shareValue.join(),userInfo:currentLoggedInUser,additional:shareHolder])
            }
            /*user with employee role*/
            if (SpringSecurityUtils.ifAllGranted("ROLE_EMPLOYEE")){

                redirect(controller: 'employee',action: 'index')
            }
            /*user with executive role*/
            if (SpringSecurityUtils.ifAllGranted("ROLE_EXECUTIVE")){

                redirect(controller: 'executive',action: 'executiveLandingPage')
            }
        }
            /* if user is not logged in*/
        else{

            def config = SpringSecurityUtils.securityConfig
            String view = '/home'
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            session.postUrl = postUrl
            render view: view, model: [postUrl: postUrl,
                                       rememberMeParameter: config.rememberMe.parameter]
        }

    }

   /*
    def investors(){
        def userList = UserRole.findAllByRole(Role.findByAuthority('ROLE_SHAREHOLDER'))
        def userLists=[]

        userList.each{
            userLists.add(User.findById(it.user.id))

        }
        render (view: '/landing-page-shareholder',model:[userList:userLists])
    }*/

    /*rendering event*/
    def event(){
        render (view: '/event')
    }

    /*rendering form*/
    def form(){
        render (view: '/event')
    }

    /*rendering news feed*/
    def news(){

        def newsList = News.findAll()

        render (view: '/news',model: [newsLists:newsList])
    }

    /*rendering gallery*/
    def gallery(){
        render (view: '/gallery')
    }

    /*rendering shareholders*/
    def shareholder(){
        render (view: '/shareholder')
    }


    /*def addUser(){
        render (view: '/adminView/user/add-user')
    }

    def addNews(){
        render (view: '/adminView/news/add-news')
    }

    def addMinute(){
        redirect(controller: 'minute',action: 'index')
    }


    def changeDesign(){
        render (view: '/adminView/change-page-design')
    }*/

}
