package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ShareholderService {

    def imageUploadService
    def shareService

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
}