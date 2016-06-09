package stocky



class ImageController {
  private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']
    /*  def uploadImage(){

        def i = request.getFile('image')
        if (!okcontents.contains(i.getContentType())) {
            flash.message = "Image must be one of: ${okcontents}"
            render(view:'add-user')
            return
        }
        CommonsMultipartFile file = params.list("")?.getAt(0)
        user.image = file?.bytes*/
    def imageUploadService;
    def saveImage(){

        String fileUploaded = imageUploadService.uploadFile()
        if( fileUploaded ){


        }

    }


    def index() {}
}
