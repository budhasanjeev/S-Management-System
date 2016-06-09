package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ExecutiveController {

    def index() {
        render (view: '/executive/executiveLandingPage');
    }
}
