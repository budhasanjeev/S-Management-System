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


    }

    def update(){

    }

}
