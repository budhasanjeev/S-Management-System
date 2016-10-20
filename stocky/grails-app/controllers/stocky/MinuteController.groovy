package stocky

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile
@Secured('permitAll')
class MinuteController {

def minuteService;

    /*this action retrieves all entries form minute table*/
    def index(){
        def minuteList = Minute.list();
        render(view: '/adminView/minute/addMinute',model: [minutesList:minuteList])
    }

    /*this action saves new entry into minute table*/
    def save(){

        CommonsMultipartFile minuteFile = request.getFile('minuteDoc')
        params.myFile = minuteFile

        if(minuteService.minuteUpload(params)){
          //  render (view: 'addMinute',model: [minute:minute])

            redirect(controller: 'minute',action: 'index')
        }else{
            render " Unsuccessful";
        }

    }

    /*this action get entry from minute table with id provided for editing*/
    def edit(){
        println params

        def minute =Minute.findById(params.id as Long)
        render(view:'/adminView/minute/edit',model:[minute:minute])

    }

    /*this action updates entry in minute table*/
    def update(){

        CommonsMultipartFile minuteFile = request.getFile('minuteDoc')
        params.myFile = minuteFile

        if(minuteService.minuteUpdate(params)){
            redirect(action: 'index')
            flash.message = "Successfully Updated"
        }else{
            flash.message = "Fail to update"
        }
    }

    /*this action deletes minute entry*/
    def delete()
    {
        def minuteInstance = Minute.findById(params.id as long)

        def minuteDoc = minuteInstance.minuteDoc
        println("="+minuteDoc)

        def minutePath = new File("upload/minuteDoc"+minuteDoc)

        minutePath.delete()
        minuteInstance.delete()

        redirect(action: 'index')


    }
}
