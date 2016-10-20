package stocky
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class ShareholderController {
    def shareholderService;

/*this action saves shareholder*/
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

    /*this action saves additional update*/
    def additionalUpdate(){

        CommonsMultipartFile signature = request.getFile('signature')
        params.myFile = signature

        CommonsMultipartFile citizenShip = request.getFile('citizenShipPhoto')
        params.myFile2 = citizenShip

        String roles = shareholderService.updateAdditionalUser(params)

        redirect(controller:'home', action: 'index')

    }

    /*this action retrieves all entries from User, Share, Shareholder*/
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

    /*this action gets all entries from minute table*/
    def minute(){
        def minuteInstanceList = Minute.findAll()
        render (view: '/shareholder/shareholderMinute',model: [minuteInstanceList:minuteInstanceList])
    }

    /*this action gets all entries from form table*/
    def form(){
        def formInstanceList = Form.findAll()
        render (view: '/shareholder/shareholderForm',model: [formInstanceList:formInstanceList])
    }

    /*this action gets all entries from document table*/
    def document(){
        def documentInstanceList = Document.findAll()

        render(view: '/shareholder/shareholderDocument',model: [documentInstanceList:documentInstanceList ])
    }

    /*this action gets all entries from news table*/
    def news(){
        def newsInstanceList = News.findAll()

        String marqueeList = ""

        if(newsInstanceList.size()>0){
            newsInstanceList.each {
                marqueeList += "${it.title}"+ "  "
            }
        }

        render (view: '/shareholder/shareholderNews',model: [newsInstanceList:newsInstanceList,marqueeList:marqueeList])
    }
}
