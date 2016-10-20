package stocky

import grails.transaction.Transactional

@Transactional
class IssuedCapitalValueService {

    /*This action saves issued capital value*/
    def issuedCapitalValueSave(params){
         def issuedCapitalValue= new IssuedCapitalValue(params);

        issuedCapitalValue.createdDate = new Date()

        if(issuedCapitalValue.save(flush: true)){
            return true
        }
        else {
            return false
        }
    }
}
