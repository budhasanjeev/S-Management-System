package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class ExecutiveController {

    def executiveLandingPage() {

    }

    /*this action selects top ten shareholder entries*/
    def getTopTenShareholders(){
        def shareList = Share.executeQuery('from Share s order by s.numberOfShares desc', [max:10])
        return render ([shareList:shareList] as JSON)
    }

    /*this action get share value entries from ShareValue table*/
    def getShareValueList(){
        def shareValue = ShareValue.findAll();
        return render ([shareVal:shareValue] as JSON)
    }

    /*this action get authorizedCapital values*/
    def getAuthorizedCapitalList(){
        def authorizedCapitalValue = AuthorizedCapitalValue.findAll();
        return render ([authVal:authorizedCapitalValue] as JSON)
    }

    /*this action get paidUpCapital values*/
    def getPaidUpCapitalList(){
        def paidUpCapital = PaidCapitalValue.findAll();
        return render ([paidVal:paidUpCapital] as JSON)
    }

    /*this action get issuedCapital values*/
    def getIssuedCapitalList(){
        def issuedCapital = IssuedCapitalValue.findAll();
        return render ([issuedVal:issuedCapital] as JSON)
    }

}
