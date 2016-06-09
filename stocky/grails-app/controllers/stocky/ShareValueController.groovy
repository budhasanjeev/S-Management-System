package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShareValueController {
def shareValueService
    def index() {}

    def save(){
        println ("="+params)

        if(shareValueService.shareValueSave(params)){
            flash.message = "Successfully Created"
            redirect(controller: 'home',action: 'index')
        } else {
            flash.message = "Failed to Update value";
        }
    }
}
