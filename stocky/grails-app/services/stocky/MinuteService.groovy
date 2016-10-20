package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile



@Transactional
class MinuteService {

    def imageUploadService
    def minuteService

    /*this action upload minute*/
    def minuteUpload(params)
    {
        // uploading minute doc
        CommonsMultipartFile  minuteDocx =  params.myFile
        final String minuteDocs = minuteDocx.getOriginalFilename()
        params.minuteDoc = minuteDocs

        def minutes = new Minute(params)

        imageUploadService.uploadMinuteDoc(params)

        if(minutes.save(flush: true,failOnError: true)){

            return true
        }
        else {
            return false
        }
    }

    /*this action update minute*/
    def minuteUpdate(params){

        println("=="+params)
        CommonsMultipartFile file = params.myFile
        String minuteDoc = file.getOriginalFilename()

        def minute = Minute.findById(params.minuteId as long)
        if (!minuteDoc.empty){
            params.minuteDoc = minuteDoc
            minuteService.minuteUpload(params)
        }
        else {
            params.minuteDoc = minute.minuteDoc
        }

        minute.properties = params

        if(minute.save(flush: true,failOnError: true)){

            return true
        }else{
            return false
        }

    }


}
