package stocky

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['permitAll'])
class DocumentController {
    def docService
    def index() {
        def docList = Document.findAll()
        render (view: '/adminView/document/document', model:[docList:docList])
    }

    def save(){
        CommonsMultipartFile document = request.getFile('document')
        params.myFile = document

        if(docService.documentUpload(params)){
            redirect(controller: 'document' , action: 'index')
        }else{
            render "Unsuccessful"
        }
    }

    def getDocumentImage(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/document/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType:  '*/*'
    }
}
