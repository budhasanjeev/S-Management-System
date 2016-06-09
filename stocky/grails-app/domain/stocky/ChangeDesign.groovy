package stocky

class ChangeDesign {

    String fileName
    String menuColor
    String textColor
    String hoverColor
    String hoverTextColor
    String footerColor
    String footerTextColor

    ChangeDesign(String footerTextColor, String footerColor, String hoverTextColor, String hoverColor, String textColor, String menuColor, String fileName) {
        this.footerTextColor = footerTextColor
        this.footerColor = footerColor
        this.hoverTextColor = hoverTextColor
        this.hoverColor = hoverColor
        this.textColor = textColor
        this.menuColor = menuColor
        this.fileName = fileName
    }

    static constraints = {
        fileName blank: false
        menuColor blank: false
        textColor blank: false
        hoverColor blank: false
        hoverTextColor blank: false
        footerColor blank: false
        footerTextColor blank: false
    }
}
