package stocky

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class NewsService {

    def documentService

    def newsSave(params) {

        CommonsMultipartFile file = params.myFile
        String imageName = file.getOriginalFilename()

        params.photo = imageName

        def news = new News(params)

        documentService.newsUpload(params);

        if(news.save(flush: true,failOnError: true)){

            return true
        }else{
            return false
        }

    }
}