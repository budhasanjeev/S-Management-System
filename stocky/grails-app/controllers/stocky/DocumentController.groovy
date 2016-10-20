package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['permitAll'])
class DocumentController {
    def docService

    /*this action retrieves all entries in document table*/
    def index() {
        def docList = Document.findAll()
        render (view: '/adminView/document/document', model:[docList:docList])
    }

    /*this action saves news entry in document table*/
    def save(){
        CommonsMultipartFile document = request.getFile('document')
        params.myFile = document

        if(docService.documentUpload(params)){
            redirect(controller: 'document' , action: 'index')
        }else{
            render "Unsuccessful"
        }
    }

    /*this action gets image for document*/
    def getDocumentImage(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/document/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType:  '*/*'
    }

    /*this action retrieves entry from document table with id provided*/
    def edit(){
        def document =Document.findById(params.document as Long)
        render(view:'/adminView/document/edit',model:[document:document])
    }

    /*this action updates entry in document table with id provided*/
    def update(){
        CommonsMultipartFile documentFile = request.getFile('document')
        params.myFile = documentFile

        if(docService.documentUpdate(params)){
            redirect(action: 'index')
            flash.message = "Successfully Updated"
        }else{
            flash.message = "Fail to update"
        }
    }

    /*this action downloads document*/
    def downloadDocument(){
        String fileName = params.document
        println(fileName)


        def file = new File("upload/document/"+fileName)

        if (file.exists()) {
            response.setContentType("application/oc tet-stream")
            response.setHeader("Content-disposition", "filename=${file.name}")
            response.outputStream << file.bytes
            response.getOutputStream().flush();
            response.getOutputStream().close();
            return;
        }else{
            return render(["File is already deleted"] as JSON)
        }
    }

    /*this action deletes entry from document table*/
    def delete(){
        def document = Document.findById(params.document as Long)
        String documentImage = document.document
        def documentPath = new File("upload/document/"+documentImage)
        documentPath.delete()
        document.delete();

        redirect(action: 'index')
    }
}
