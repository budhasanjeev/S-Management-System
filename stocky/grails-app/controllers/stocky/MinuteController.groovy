package stocky

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile
@Secured('permitAll')
class MinuteController {

def minuteService;

    def index(){
        def minuteList = Minute.list();
        render(view: '/adminView/minute/addMinute',model: [minutesList:minuteList])
    }

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

    def edit(){
        println params

        def minute =Minute.findById(params.id as Long)
        render(view:'/adminView/minute/edit',model:[minute:minute])

    }

    def update(){

        CommonsMultipartFile minuteFile = request.getFile('minuteDoc')
        params.myFile = minuteFile

        if(minuteService.minuteUpdate(params)){
            redirect(action: 'index')
            flash.message = "Successfully Updated"
        }else{
            flash.message = "Fail to update"
        }

        /*def minute =Minute.findById(params.id as Long)
        minute.properties=params
        minute.save(flush: true, failOnError: true)

        redirect(controller: 'minute', action:'index')*/

    }

}
