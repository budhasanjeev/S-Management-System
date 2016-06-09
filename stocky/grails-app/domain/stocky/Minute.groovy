package stocky

class Minute {
    String title
    String event_date
    String minuteDoc

    static constraints = {
         title(nullable: false)
         event_date(nullable: false)
        minuteDoc(nullable: false)
    }
}
