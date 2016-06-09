package stocky

class Share {
    String shareholderName
    String numberOfShares
    String shareStart
    String shareEnd
    String shareAmount
    String sharePercent
    String shareCertificate
    String shareCertificateNumber
    String purchasedDate
    User user

    static constraints = {
        shareCertificate(nullable: true)

    }
}
