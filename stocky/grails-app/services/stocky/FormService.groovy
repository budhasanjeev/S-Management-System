package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class FormService {

    def documentService

   def formUpload(params){

       CommonsMultipartFile  formDocument =  params.myFile
       final String formDocs = formDocument.getOriginalFilename()
       params.formDoc = formDocs

       def form = new Form(params)

        form.date = new Date()

       documentService.formUpload(params)

       if(form.save(flush: true,failOnError: true)){

           return true
       }
       else {
           return false
       }

   }
}
