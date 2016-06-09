package stocky

import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class MailController {
    def mailService

    def index() { }

    def sendMail(){
        println(params)

        mailService.sendMail {
            to params.to
            subject params.subject
            body params.content
        }
        redirect(controller: 'home', action: 'index')

    }
}

