package stocky


import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured("permitAll")
class ChangeDesignController {

    def changeLogoService

    def index() {

    }

    /*this action saves the change in design parameters*/
    def save(){
        ChangeDesign changeDesign

        CommonsMultipartFile image = request.getFile('logo')
        params.myFile = image

        changeDesign = changeLogoService.changeSave(params)

        if(changeDesign==null){
            redirect(controller: 'home',action: 'index')
        }else{
            redirect(controller: 'home',action: 'index')
        }
    }

    /*this action gets Logo*/
    def getLogo(){
        String fileName = params.fileName
        File sourceImage = new File("upload/logo/"+fileName)
        if(sourceImage.exists()){
            def inputStream = new FileInputStream(sourceImage)
            render file: inputStream, contentType: '*/*'
        }else{
            sourceImage = new File(${resource(dir: 'images',file: 'logo.png')})
            def inputStream = new FileInputStream(sourceImage)
            render file: inputStream, contentType: '*/*'
        }

    }
}
