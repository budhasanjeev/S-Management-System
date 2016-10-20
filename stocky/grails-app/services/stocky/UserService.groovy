package stocky

import grails.transaction.Transactional
import liquibase.util.file.FilenameUtils
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class UserService  {

    def mailService
    def imageUploadService

    /*this action saves user*/
    def userSave(params){

        params.password = "#Dwit123!"
        CommonsMultipartFile image = params.myFile
//        final String name = image.getOriginalFilename()
        final String ext = FilenameUtils.getExtension(image.getOriginalFilename())
        String fileName = params.username + '.' + ext
        params.userImage = fileName

        def user = new User(params)

        imageUploadService.uploadProfilePicture(params)

        if(user.save(flush: true,failOnError: true)){

            def role = Role.findByAuthority(params.roles)

           if (UserRole.create(user,role,true)) {
               /* mailService.sendMail{
                    to params.email
                    subject " Account Created Successfully"
                    body "Hello "+params.firstName +", \nYou have been registered to DWIT Portfolio Management. \nYour user credentials are as follows \n UserName: " +params.username + "\n Password: #Dwit123!" + "\n Thank You for getting associated with DWIT \n Regards,DWIT Administration"
                }*/
                return user

            }
        }
        else {
            return false
        }
    }

    /*This action deletes user*/
    def deleteUser(params){

        def photoList=[]
        def user = User.findById(params.user_id as long)
        def userRole = UserRole.findByUser(user)
        def role =userRole.role.authority

        def shareholder = Shareholder.findByUser(user)
        def  share = Share.findByUser(user)

        photoList.add(role)
        photoList.add(user?.userImage)
        photoList.add(shareholder?.citizenshipPhoto)
        photoList.add(share?.shareCertificate)
        photoList.add(shareholder?.signature)

        imageUploadService.deleteFile(photoList)

        shareholder?.delete(flush: true)
        share?.delete(flush: true)
        userRole?.delete(flush: true)
        user?.delete(flush: true)

        return role
    }

    /*This action updates user*/
    def updateUser(params){

        def user =  User.get(params.userId as long)
        user.properties=params
        user.save(flush: true,failOnError: true)
        def role = UserRole.findByUser(user).role.authority
        return role
    }

    /*This action saves user from nepali form*/
    def userSaveNepali(params) {

        params.password = "#Dwit123!"
        CommonsMultipartFile image = params.myFile
        final String name = image.getOriginalFilename()

        params.userImage = name

        def user = new User(params)

        imageUploadService.uploadProfilePicture(params)
        if (user.save(flush: true, failOnError: true)) {

            def role = Role.findByAuthority(params.roles)

            if (UserRole.create(user, role, true))

                return user
        } else {
            return false
        }

    }

    /*This action lists user with id provided*/
    def listUsers(params){

        String role = params.id

        def userList = UserRole.findAllByRole(Role.findByAuthority(role))//UserRole list with specific role//ADMIN
        def userLists=[]
        userList.each{
            userLists.add(User.findById(it.user.id))
        }

        return userLists
    }

}
