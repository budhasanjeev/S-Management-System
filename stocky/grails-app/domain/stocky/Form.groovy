package stocky

class Form {
    String title
    String date
    String formDoc

    static constraints = {
        title(nullable: false)
        date(nullable: false)
        formDoc(nullable: false)
    }
}
