package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class DocService {

    def documentService
   def documentUpload(params){
       CommonsMultipartFile  documentDoc =  params.myFile
       final String docs = documentDoc.getOriginalFilename()
       params.document = docs

       def document = new Document(params)

       documentService.documentUpload(params)

       if(document.save(flush: true,failOnError: true)){

           return true
       }
       else {
           return false
       }
   }
}
