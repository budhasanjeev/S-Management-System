package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class ChangeLogoService {

    def imageUploadService

    /*this action saves change design*/
    def changeSave(params){

        CommonsMultipartFile image = params.myFile
        final String name = image.getOriginalFilename()

        params.fileName = name

        def changeDesign = new ChangeDesign()

        changeDesign.properties = params

        imageUploadService.uploadLogo(params)

        if(ChangeDesign.first()){
            updateChangeDesign(changeDesign)
            return null
        }else{
            if (changeDesign.save()){
                return changeDesign
            }
        }
    }

    /*this action updates change in design*/
    def updateChangeDesign(def result){
        def changeDesign = ChangeDesign.first()
        changeDesign.properties = result
        changeDesign.save()
    }

}
