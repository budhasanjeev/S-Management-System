package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class DocService {

    def documentService

    /*this action upload document*/
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

    /*this action update document file*/
    def documentUpdate(params){
        CommonsMultipartFile file = params.myFile
        String imageName = file.getOriginalFilename()

        def document = Document.findById(params.id as Long)
        if (!imageName.empty){
            params.document = imageName
            documentService.documentUpload(params)
        }
        else {
            params.document = document.document
        }

        document.properties = params

        if(document.save(flush: true,failOnError: true)){

            return true
        }else{
            return false
        }

    }
}
