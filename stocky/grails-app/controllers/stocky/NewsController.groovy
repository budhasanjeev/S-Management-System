package stocky

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class NewsController {

    def newsService

    def index(){
        def newsList = News.findAll()

        String marqueeList = ""

        if(newsList.size()>0){
            newsList.each {
                marqueeList += "${it.title}"+ "  "
            }
        }


        println("===="+marqueeList)
        render (view: '/adminView/add-news',model: [newsLists:newsList,marqueeList:marqueeList])

    }

    def save(){

        CommonsMultipartFile newsFile = request.getFile('photo')
        params.myFile = newsFile

        if(newsService.newsSave(params)){
            redirect(action: 'index')
            flash.message = "Successfully Saved"
        }else{
            flash.message = "Fail to update"
        }
    }

    def getNewsImage(){
        String fileName = params.fileName
        println fileName;
        File sourceImage = new File("upload/news/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType: '*/*'
    }
}
