package stocky
class Shareholder {

    String secondContactNo
    String fatherName
    String grandFatherName
    String citizenshipNo
    String citizenShipPhoto
    String citizenshipIssueDistrict
    String signature
    String city
    String district
    String zone
    User user;


    static constraints = {
        signature(nullable: true)
        citizenShipPhoto(nullable: true)
    }
}
