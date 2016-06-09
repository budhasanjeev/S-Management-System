package stocky

import grails.transaction.Transactional
import liquibase.util.file.FilenameUtils
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ImageUploadService {
    /* def user = User.findById(params.user_id as long)*/

    def uploadProfilePicture(params) {

        CommonsMultipartFile image = params.myFile
        def fos = new FileOutputStream(new File("upload/profilePicture/" + params.userImage))

        image.getBytes().each {
            fos.write(it)
        }

        fos.flush()
        fos.close()
    }

    def uploadSignature(params){
        CommonsMultipartFile signature = params.myFile
        final String signature_name = signature.getOriginalFilename()
        def fos= new FileOutputStream(new File("upload/signature/"+signature_name))
        signature.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
    }

    def uploadShareCertificate(params){
        CommonsMultipartFile shareCertificate = params.myFile1
        final String shareCertificate_name = shareCertificate.getOriginalFilename()
        def fos= new FileOutputStream(new File("upload/shareCertificate/"+shareCertificate_name))
        shareCertificate.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
    }

    def uploadCitizenShip(params){
        CommonsMultipartFile citizenShip = params.myFile2
        final String citizenPhoto_name = citizenShip.getOriginalFilename()
        def fos= new FileOutputStream(new File("upload/citizenShip/"+citizenPhoto_name))
        citizenShip.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
    }

    def uploadMinuteDoc(params){
        CommonsMultipartFile minuteDoc = params.myFile
        final String minute_doc = minuteDoc.getOriginalFilename()
        def fos= new FileOutputStream(new File("upload/minuteDoc/"+minute_doc))
        minuteDoc.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
    }

    def uploadLogo(params) {
        CommonsMultipartFile image = params.myFile
        final String name = image.getOriginalFilename()
        def fos= new FileOutputStream(new File("upload/logo/"+name))
        image.getBytes().each{ fos.write(it) }
        fos.flush()
        fos.close()
    }

    def deleteFile(photoList){
        if (photoList[0].equals("ROLE_ADMIN") || photoList[0].equals("ROLE_EXECUTIVE")){
            def userImage = new File("upload/profilePicture/"+photoList[1])
            userImage.delete()
        }
        else {

            def userImage = new File("upload/profilePicture/"+photoList[1])
            userImage?.delete()


            def citizenShipPhoto = new File("upload/citizenShip/"+ photoList[2])
            citizenShipPhoto?.delete()


            def shareCertificate = new File("upload/shareCertificate/"+photoList[3])
            shareCertificate?.delete()


            def signature  = new File("upload/signature/"+photoList[4])
            signature?.delete()
        }
    }
}
