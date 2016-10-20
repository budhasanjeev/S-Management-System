package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ShareholderService {

    def imageUploadService
    def shareService

    /*this action save shareholder value*/
    def shareholderSave(params) {
        /*getting signature image name*/

        CommonsMultipartFile signature = params.myFile
        final String signature_name = signature.getOriginalFilename()
        params.signature = signature_name

        /*getting shareCertificate image name*/
        CommonsMultipartFile shareCertificate = params.myFile1
        final String shareCertificate_name = shareCertificate.getOriginalFilename()
        params.shareCertificate = shareCertificate_name

        /*getting citizenShip image name*/
        CommonsMultipartFile citizenShip = params.myFile2
        final String citizenPhoto_name = citizenShip.getOriginalFilename()
        params.citizenShipPhoto = citizenPhoto_name

        def shareholder = new Shareholder(params)

        imageUploadService.uploadSignature(params)
        imageUploadService.uploadShareCertificate(params)
        imageUploadService.uploadCitizenShip(params)

        def user = User.findById(params.user_id as long)
        shareholder.user = user;

        if(shareholder.save(flush: true,failOnError: true) && shareService.shareSave(params)){

            return true
        }
        else {
            return false
        }
    }

    /*this action saves additional value for user*/
    def updateAdditionalUser(params){

        CommonsMultipartFile signature = params.myFile
        final String signature_name = signature.getOriginalFilename()
        params.signature = signature_name

        /*getting citizenShip image name*/
        CommonsMultipartFile citizenShip = params.myFile2
        final String citizenPhoto_name = citizenShip.getOriginalFilename()
        params.citizenshipPhoto = citizenPhoto_name

        def user = User.findById(params.user_id as long)
        def shareholderInstance = Shareholder.findByUser(user)

        if(signature_name.empty){
            params.signature = shareholderInstance.signature
        }else{
            imageUploadService.uploadSignature(params)
        }

        if(citizenPhoto_name.empty){
           params.citizenshipPhoto = shareholderInstance.citizenshipPhoto
        }else {
            imageUploadService.uploadCitizenShip(params)
        }

        shareholderInstance.properties = params
        shareholderInstance.user = user;

        shareholderInstance.save(flush: true,failOnError: true)

        def role = UserRole.findByUser(user).role.authority
        return role


    }
}