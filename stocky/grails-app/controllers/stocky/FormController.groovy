package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['permitAll'])
class FormController {
    def formService

    def index() {
        def formList = Form.findAll()
        render (view: '/adminView/form/adminForm', model:[formList:formList])
    }

    def save(){
        CommonsMultipartFile formFile = request.getFile('formDoc')
        params.myFile = formFile

        if(formService.formUpload(params)){

            redirect(controller: 'form',action: 'index')
        }else{
            render " Unsuccessful";
        }
    }

    def getFormImage(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/form/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType:  '*/*'
    }

    def downloadForm(){

        String fileName = params.form

        def file = new File("upload/form/"+fileName)

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
}
