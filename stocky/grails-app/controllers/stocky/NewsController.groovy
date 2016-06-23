package stocky

import grails.converters.JSON
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

        render (view: '/adminView/news/add-news',model: [newsLists:newsList,marqueeList:marqueeList])

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
        File sourceImage = new File("upload/news/"+fileName)

        def inputStream = new FileInputStream(sourceImage)
        render file: inputStream, contentType: '*/*'
    }

    def edit(){
        def news =News.findById(params.id as Long)
        render(view:'/adminView/news/edit',model:[news:news])


    }

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

    def readNews(){

        def news =News.findById(params.newsId as long)
        render(view:'/adminView/news/readNews',model:[newsInstance:news])
    }

    def delete()
    {
        def newsInstance = News.findById(params.id as long)

        def photo = newsInstance.photo
        def content = newsInstance.content


        def photoPath = new File("upload/photo"+photo)
        def contentPath = new File("upload/content"+content)

        photoPath.delete()
        contentPath.delete()
        newsInstance.delete()

        redirect(action: 'index')


    }
}
