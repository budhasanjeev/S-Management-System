package stocky

import grails.converters.JSON
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

    def edit(){
        def document =Document.findById(params.document as Long)
        render(view:'/adminView/document/edit',model:[document:document])
    }

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

    def delete(){
        def document = Document.findById(params.document as Long)
        String documentImage = document.document
        def documentPath = new File("upload/document/"+documentImage)
        documentPath.delete()
        document.delete();

        redirect(action: 'index')
    }
}
