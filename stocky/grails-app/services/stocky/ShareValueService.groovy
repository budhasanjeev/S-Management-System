package stocky

import grails.transaction.Transactional

@Transactional
class ShareValueService {

    /*this action saves share values*/
    def shareValueSave(params){

        def shareValue = new ShareValue(params)
        shareValue.createdDate = new Date()

        if(shareValue.save(flush: true,failOnError: true)){
            return true
        }
        else{
            return false
        }
    }

}
