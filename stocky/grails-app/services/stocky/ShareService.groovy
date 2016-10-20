package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ShareService {

    def imageUploadService

    /*this action saves share*/
    def shareSave(params){

        CommonsMultipartFile shareCertificate = params.myFile1
        final String shareCertificate_name = shareCertificate.getOriginalFilename().toString()
        params.shareCertificate = shareCertificate_name

        imageUploadService.uploadShareCertificate(params)

        def share = new Share(params)

        User user = User.findById(params.user_id as long)
        share.user = user
        share.shareholderName = user.firstName + " " + user.lastName

        if(share.save(flush: true,failOnError: true)){
            return true
        }
    }

    /*this action updates share*/
    def shareUpdate(params){

        CommonsMultipartFile shareCertificate = params.myFile1
        final String shareCertificate_name = shareCertificate.getOriginalFilename().toString()
        params.shareCertificate = shareCertificate_name

        imageUploadService.uploadShareCertificate(params)

        def share = Share.findById(params.share_id as long)

        User user = User.findById(params.user_id as long)
        share.user = user
        share.shareholderName = user.firstName + " " + user.lastName

        if(share.save(flush: true,failOnError: true)){
            return true
        }
    }

}
