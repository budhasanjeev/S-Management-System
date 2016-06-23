package stocky
class Shareholder {

    String shareholderId
    String secondContactNo
    String fatherName
    String grandFatherName
    String citizenshipNo
    String citizenshipPhoto
    String citizenshipIssueDistrict
    String signature
    String city
    String district
    String zone
    User user;


    static constraints = {
        signature(nullable: true)
        citizenshipPhoto(nullable: true)
    }
}
