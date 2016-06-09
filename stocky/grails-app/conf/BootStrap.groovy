import org.apache.ivy.util.FileUtil
import stocky.ChangeDesign
import stocky.Role
import stocky.User
import stocky.UserRole

class BootStrap {
    def springSecurityService

    def init = { servletContext ->

        def user = User.findById(1)?:new User(username:'amrit',password:'amrit',firstName:'Amrit',mobileNumber:'9843723189',landLine:'01-4488612',lastName:' Silwal',email:'amrit.silwl@deerwalk.edu.np',userImage:null).save(flush: true)
        def changeDesign = ChangeDesign.findById(1)?:new ChangeDesign(fileName:'logo.png',menuColor:'#226CB5',textColor:'#ffffff',hoverColor:'#0E683B',hoverTextColor:'#ffffff',footerColor:'#226CB5',footerTextColor:'#fff').save(flush: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN')?:new Role(authority:'ROLE_ADMIN').save(flush: true)
        def staffRole = Role.findByAuthority('ROLE_EMPLOYEE')?:new Role(authority:'ROLE_EMPLOYEE').save(flush: true)
        def shareholderRole = Role.findByAuthority('ROLE_SHAREHOLDER')?:new Role(authority:'ROLE_SHAREHOLDER').save(flush: true)
        def executiveRole = Role.findByAuthority('ROLE_EXECUTIVE')?:new Role(authority:'ROLE_EXECUTIVE').save(flush: true)

        UserRole.create(user,adminRole,true)

        new File("upload").mkdir()
        new File("upload/citizenShip").mkdir()
        new File("upload/profilePicture").mkdir()
        new File("upload/signature").mkdir()
        new File("upload/shareCertificate").mkdir()
        new File("upload/minuteDoc").mkdir()
        new File("upload/document").mkdir()
        new File("upload/news").mkdir()
        new File("upload/logo").mkdir()
        new File("upload/form").mkdir()
        new File("report").mkdir()
    }

    def destroy = {
    }
}
