package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class AuthorizedCapitalValueController {
    def authorizedCapitalValueService

    def index() {}

    def save(){
        println ("="+params)
        if(authorizedCapitalValueService.authorizedCapitalValueSave(params)){

            redirect(controller: 'home',action: 'index')
        }
        else {
            render " failed"
        }
    }
}
