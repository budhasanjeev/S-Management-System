package stocky

import grails.transaction.Transactional

@Transactional
class PaidCapitalValueService {

    def paidCapitalValueSave(params){
        def paidCapitalValue= new PaidCapitalValue(params);

         paidCapitalValue.createdDate = new Date()

        if(paidCapitalValue.save(flush: true)){
            return true
        }
        else {
            return false
        }
    }
}
