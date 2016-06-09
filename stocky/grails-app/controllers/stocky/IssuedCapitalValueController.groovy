package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class IssuedCapitalValueController {

    def issuedCapitalValueService
    def index() {}

    def save(){
        println ("="+params)
        if(issuedCapitalValueService.issuedCapitalValueSave(params)){

             redirect(controller: 'home',action: 'index')
        }
        else {
            render "Unsuccessful"
        }
    }
}
