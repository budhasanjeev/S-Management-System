package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile



@Transactional
class MinuteService {

    def  imageUploadService

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
}
