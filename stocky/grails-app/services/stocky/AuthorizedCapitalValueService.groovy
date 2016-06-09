package stocky

import grails.transaction.Transactional

@Transactional
class AuthorizedCapitalValueService {

    def authorizedCapitalValueSave(params){

        def authorizedCapitalValue= new AuthorizedCapitalValue(params);

        authorizedCapitalValue.createdDate = new Date()

        if(authorizedCapitalValue.save(flush: true)){
            return true
        }
        else {
             return false
        }
    }
}
