package stocky
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class ShareholderController {
    def shareholderService;


    def save() {

        CommonsMultipartFile signature = request.getFile('signature')
        params.myFile = signature

        CommonsMultipartFile shareCertificate = request.getFile('shareCertificate')
        params.myFile1 = shareCertificate

        CommonsMultipartFile citizenShip = request.getFile('citizenShipPhoto')
        params.myFile2 = citizenShip

        if (shareholderService.shareholderSave(params)){
            redirect(controller: 'home',action: 'index')
        }else{
            render "Unsuccessful";
        }
    }

    def additionalUpdate(){

        CommonsMultipartFile signature = request.getFile('signature')
        params.myFile = signature

        CommonsMultipartFile shareCertificate = request.getFile('shareCertificate')
        params.myFile1 = shareCertificate

        CommonsMultipartFile citizenShip = request.getFile('citizenShipPhoto')
        params.myFile2 = citizenShip

        String roles = shareholderService.updateAdditionalUser(params)
/*
        redirect(action: 'filterUser',params: [id:roles])*/
        redirect(controller:'home', action: 'index')

    }

    def index() {

        def user = User.findById(params.user_id as long)

        def share = Share.findAllByUser(user)

        def shareholder = Shareholder.findByUser(user)

        if(shareholder){
            render (view: '/adminView/shareholder/shareholder-profile',model: [user:user,sharevalue:share,shareholder:shareholder])
        }
        else
            redirect(controller: 'home',action: 'index')

    }

    def minute(){
        render (view: '/adminView/minute/addMinute.gsp')
    }

    def form(){
        println('adsfd');
        render (view: 'shareholderForm.gsp')
    }

}
