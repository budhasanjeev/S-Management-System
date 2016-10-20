package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class UserController {

    def userService
    def springSecurityService

    /*this action gets user entry with id provided*/
    def editSave(){
        String user_id = params.user_id
        def user = User.findById(params.user_id as long)
        render view: '/adminView/user/editSave', model:[user:user]
    }

    /*this action retrieves all entries from User*/
    def index() {

        def listUsers = User.list();
        render(view: '/shareholder',model: [userList :listUsers])
    }

    /*this action saves user*/
    def save() {
        User user

        if (params.form_type=='english'){
            CommonsMultipartFile image = request.getFile('photo')
            params.myFile = image
            user = userService.userSave(params)

            if(UserRole.findByUser(user).role.authority == 'ROLE_SHAREHOLDER' || UserRole.findByUser(user).role.authority == 'ROLE_EXECUTIVE'){
                render (view: '/adminView/user/additionalInfo',model: [id:user.id])
            }else {
                redirect(controller:'home', action: 'index')
            }

        }
        else if (params.form_type=='nepali'){

            user = userService.userSaveNepali(params)

            if(UserRole.findByUser(user).role.authority == 'ROLE_SHAREHOLDER' || UserRole.findByUser(user).role.authority == 'ROLE_EXECUTIVE'){
                render (view: '/adminView/user/additionalInfoNepali',model: [id:user.id])
            }else {
                redirect(action: 'index')
            }
        }

    }

    /*this action retrieves user entry with id provided*/
    def edit(){

        def user = User.findById(params.id as long)

        return render(user as JSON)

    }

    /*this action updates user */
    def update(){

        def role = params.roles

        def user= User.findById(params.userId as long)

        def shareholder =Shareholder.findByUser(user)

        def share = Share.findByUser(user)

        userService.updateUser(params)

        if(role == 'ROLE_SHAREHOLDER' || role == 'ROLE_EXECUTIVE'){
            render(view:'/adminView/user/additionalInfoUpdate', model: [user:user,shareholder:shareholder,share:share])
        }
        else{
            String roles = userService.updateUser(params)

            redirect(action: 'filterUser',params: [id:roles])
        }

    }

    /*this action deletes user*/
    def delete(){

        def role = userService.deleteUser(params)
        if(role){
            redirect(action: 'filterUser',params: [id:role])
        }
        else {
            render "UnSuccessful"
        }
    }

    /*this action checks email for duplicate*/
    def checkMail(){

        def userList = User.list()

        println(params.email)

        userList.each {
            String email = "${it.email}"
            if (email.equals(params.email)){
                return render ([messageType:"success"] as JSON)
            }
        }
        return render ([messageType:"fail"] as JSON)
    }

    /*this action checks username for duplicate*/
    def checkUserName(){

        def userList = User.list()
        println(params.username)

        userList.each{

            String username = "${it.username}"
            if(username.equals(params.username)){
                return render ([messageType:"success"] as JSON)
            }
        }

        return render ([messageType:"fail"] as JSON)

    }

    /*this action gets user Information (full name, link, render)*/
    def getUserInfo(){

        def user = User.findById(params.id as long);
        String fullName = user?.firstName +" "+user?.lastName
        String link ="<img height='400px' class='Photo img-thumnail' src='${createLink(controller: 'user', action: 'getImage', params: [fileName: '"'+user?.userImage+'"'])}'/>"
        return render ([fullNames:fullName,link:link] as JSON)

    }

    /*this actions filters user*/
    def filterUser(){

        def userLists = userService.listUsers(params)
        def shareValue  = ShareValue.list([max: 1,sort: "createdDate",order: "desc"]);
        def authorizedCapitalValue  =AuthorizedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
        def paidCapitalValue  =PaidCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
        def issuedCapitalValue  =IssuedCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);

        String role = params.id
        role = role.split("_")[1]
        render view: '/adminView/admin-landing' ,model: [shareholderLists:userLists,shareValue:shareValue.shareValue.join(),authorizedCapitalValue:authorizedCapitalValue.authorizedCapitalValue.join(),paidCapitalValue:paidCapitalValue.paidCapitalValue.join(),issuedCapitalValue:issuedCapitalValue.issuedCapitalValue.join(),role:role]

    }

    /*this action retrieves image*/
    def getImage(){
        String fileName = params.fileName
        File sourceImage = new File("upload/profilePicture/"+fileName.replaceAll('"',""))

        if(sourceImage.exists()){

        }else{
            sourceImage = new File("upload/profilePicture/user.png")
        }
        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType: '*/*'

    }

    /*this action gets minute*/
    def getMinute(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/minuteDoc/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType: '*/*'

    }

    /*this action gets citizenship*/
    def getCitizenShip(){
        String fileName = params.fileName
        File sourceImage = new File("upload/citizenShip/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream,contentType: '*/*'
    }


    /*this action gets signature*/
    def getSignature(){
        String fileName = params.fileName
        File sourceImage = new File("upload/signature/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream,contentType: '*/*'
    }

    /*this action renders nepali form*/
    def createNepali(){
        render(view: '/adminView/user/add-userNepali')
    }

    /*this action displays documents*/
    def displayDocument(){
        render (view: 'admin-landing.gsp',model: [id:user.id])
    }

    /*this action gets certificate*/
    def getCertificate(){
        String fileName = params.fileName
        File sourceImage = new File("upload/shareCertificate/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream,contentType: '*/*'
    }

    /*this action saves password*/
    def changePassword(){
       // println params

        User user = springSecurityService.currentUser
        if(springSecurityService.passwordEncoder.isPasswordValid(user.password, params.oldPassword, null)){

            user.password = params?.newPassword
            user.passwordExpired = false

            redirect(controller: 'home', action: 'index')
        }
    }
}
