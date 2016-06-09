package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PaidCapitalValueController {
    def paidCapitalValueService

    def index() {}
    def save(){
        println ("="+params)
        if(paidCapitalValueService.paidCapitalValueSave(params)){

             redirect(controller: 'home',action: 'index')
        }
    }
}
