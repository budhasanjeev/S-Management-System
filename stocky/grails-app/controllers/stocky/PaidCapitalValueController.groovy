package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PaidCapitalValueController {
    def paidCapitalValueService

    def index() {}

    /*this action saves new entry into paidUpCapital table*/
    def save(){

        if(paidCapitalValueService.paidCapitalValueSave(params)){

             redirect(controller: 'home',action: 'index')
        }
    }
}
