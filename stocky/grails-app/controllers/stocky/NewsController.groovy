package stocky

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured('permitAll')
class NewsController {

    def newsService

    /*this action retrieves all entries of news */
    def index(){
        def newsList = News.findAll()

        String marqueeList = ""

        if(newsList.size()>0){
            newsList.each {
                marqueeList += "${it.title}"+ "  "
            }
        }

        render (view: '/adminView/news/add-news',model: [newsLists:newsList,marqueeList:marqueeList])

    }

    /*this action saves new news entry*/
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

    /*this action gets image for news form news folder*/
    def getNewsImage(){
        String fileName = params.fileName
        File sourceImage = new File("upload/news/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType: '*/*'
    }

    /*this action gets entry from news table with id provided*/
    def edit(){
        def news =News.findById(params.id as Long)
        render(view:'/adminView/news/edit',model:[news:news])

    }

    /*this action updates entry into table with id provided*/
    def update(){

        CommonsMultipartFile newsFile = request.getFile('photo')
        params.myFile = newsFile

        if(newsService.newsUpdate(params)){
            redirect(action: 'index')
            flash.message = "Successfully Updated"
        }else{
            flash.message = "Fail to update"
        }
    }

    /*this action retrieves news provided with id*/
    def readNews(){

        def news =News.findById(params.newsId as long)
        render(view:'/adminView/news/readNews',model:[newsInstance:news])
    }

    /*this action deletes*/
    def delete()
    {
        def newsInstance = News.findById(params.id as long)

        def photo = newsInstance.photo
        def content = newsInstance.content


        def photoPath = new File("upload/photo"+photo)

        photoPath.delete()
        newsInstance.delete()

        redirect(action: 'index')

    }
}
