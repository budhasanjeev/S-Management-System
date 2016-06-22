package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ExecutiveController {

    def executiveLandingPage() {

    }

    def getTopTenShareholders(){
        def shareList = Share.executeQuery('from Share s order by s.numberOfShares desc', [max:10])
        return render ([shareList:shareList] as JSON)
    }

    def getShareValueList(){
        def shareValue = ShareValue.findAll();
        return render ([shareVal:shareValue] as JSON)
    }

    def getAuthorizedCapitalList(){
        def authorizedCapitalValue = AuthorizedCapitalValue.findAll();
        return render ([authVal:authorizedCapitalValue] as JSON)
    }

    def getPaidUpCapitalList(){
        def paidUpCapital = PaidCapitalValue.findAll();
        return render ([paidVal:paidUpCapital] as JSON)
    }

    def getIssuedCapitalList(){
        def issuedCapital = IssuedCapitalValue.findAll();
        return render ([issuedVal:issuedCapital] as JSON)
    }

}
