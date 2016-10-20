package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured(['permitAll'])
class FormController {
    def formService

    /*this action gets all entries from Form table*/
    def index() {
        def formList = Form.findAll()
        render (view: '/adminView/form/adminForm', model:[formList:formList])
    }

    /*this action saves new entry into the Form table*/
    def save(){
        CommonsMultipartFile formFile = request.getFile('formDoc')
        params.myFile = formFile

        if(formService.formUpload(params)){

            redirect(controller: 'form',action: 'index')
        }else{
            render " Unsuccessful";
        }
    }

    /*this action get form image from form folder with fileName provided*/
    def getFormImage(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/form/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType:  '*/*'
    }

    /*this action downloads form*/
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
