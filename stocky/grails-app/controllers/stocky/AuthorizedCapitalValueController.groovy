package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class AuthorizedCapitalValueController {
    def authorizedCapitalValueService

    def index() {}

    /*Saves the authorized capital value*/
    def save(){

        if(authorizedCapitalValueService.authorizedCapitalValueSave(params)){

            redirect(controller: 'home',action: 'index') /*redirects to home controller*/
        }
        else {
            render " failed" /*renders failed message*/
        }
    }
}
