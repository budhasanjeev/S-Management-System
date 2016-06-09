package stocky

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
}
