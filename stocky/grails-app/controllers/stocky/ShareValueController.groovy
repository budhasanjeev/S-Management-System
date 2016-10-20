package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShareValueController {
def shareValueService
    def index() {}

    /*this action saves new entry into shareValue table*/
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
