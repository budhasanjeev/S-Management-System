package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class ShareController {

    def shareService;

    /*this action gets all entries of shareValue, paidCapitalValue*/
    def index() {
        def shareValue = ShareValue.list([max: 1,sort: "createdDate",order: "desc"]);
        def paidCapitalValue = PaidCapitalValue.list([max: 1,sort: "createdDate",order: "desc"]);
       // println(paidCapitalValue.paidCapitalvalue)
        session.setAttribute("paidCapitalValue",paidCapitalValue.paidCapitalValue.join())
        session.setAttribute("shareValue",shareValue.shareValue.join())
        render(view: '/adminView/share/add-shares.gsp')
    }

    /*this action saves new entry in share*/
    def save(){

        CommonsMultipartFile shareCertificate = request.getFile('shareCertificate')
        params.myFile1 = shareCertificate

        if (shareService.shareSave(params)){
            redirect(controller: 'home',action: 'index')
        }

    }

}
