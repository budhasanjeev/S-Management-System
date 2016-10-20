package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class IssuedCapitalValueController {

    def issuedCapitalValueService

    def index() {}

    /*this action saves issuedCapital values*/
    def save(){
        if(issuedCapitalValueService.issuedCapitalValueSave(params)){

             redirect(controller: 'home',action: 'index')
        }
        else {
            render "Unsuccessful"
        }
    }
}
