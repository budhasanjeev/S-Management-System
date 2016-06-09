package stocky

import grails.transaction.Transactional
import net.sf.dynamicreports.jasper.builder.export.Exporters
import net.sf.dynamicreports.report.builder.component.ComponentBuilder
import net.sf.dynamicreports.report.builder.style.StyleBuilder
import net.sf.dynamicreports.report.constant.HorizontalAlignment
import net.sf.dynamicreports.report.constant.VerticalAlignment
import net.sf.dynamicreports.report.datasource.DRDataSource
import net.sf.jasperreports.engine.JRDataSource
import static net.sf.dynamicreports.report.builder.DynamicReports.*

@Transactional
class ExecutiveReportService {

    StyleBuilder boldStyle = stl.style().bold();
    StyleBuilder boldCenteredStyle = stl.style(boldStyle).setHorizontalAlignment(HorizontalAlignment.CENTER);
    StyleBuilder titleStyle = stl.style(boldCenteredStyle).setVerticalAlignment(VerticalAlignment.MIDDLE)

    def generateReportI(params){

        report()
                .highlightDetailEvenRows()
                .columns(
                col.column("Id", "id", type.stringType()).setFixedColumns(3),
                col.column("Name", "name", type.stringType()),
                col.column("No. Of Share", "noOfShare", type.stringType()).setFixedColumns(4),
                col.column("Investment", "investment", type.stringType()),
                col.column("From", "from", type.stringType()).setFixedColumns(4),
                col.column("To", "to", type.stringType()),
//                col.column("Share Certificate No.", "shareCertificateNo", type.stringType()),
                col.column("Contact Number.", "contactNo", type.stringType()),
                col.column("Email", "email", type.stringType()),
                col.column("Father Name", "fatherName", type.stringType()),
                col.column("Grand Father Name", "grandFatherName", type.stringType()),
                col.column("Permanent Address", "permanentAddress", type.stringType()),
                col.column("Citizenship Number", "citizenshipNumber", type.stringType())
//                col.column("Additional Investment", "additionalInvestment", type.stringType()
                )
                .columnHeader(cmp.verticalGap(5))
                .setDataSource(dataSourceIndividual(params))
                .title(
                headComponent("Executive Summary Report")
        )
                .toDocx(Exporters.docxExporter("Report/individualReport.docx"));
    }

    def generateReportC(params){
        report()
                .highlightDetailEvenRows()
                .columns(
                col.column("Id", "id", type.stringType()).setFixedColumns(3),
                col.column("Name", "name", type.stringType()),
                col.column("No. Of Share", "noOfShare", type.stringType()).setFixedColumns(4),
                col.column("Investment", "investment", type.stringType()),
//                col.column("Share Certificate No.", "shareCertificateNo", type.stringType()),
                col.column("Contact Number.", "contactNo", type.stringType()),
                col.column("Email", "email", type.stringType()),
                col.column("Father Name", "fatherName", type.stringType()),
                col.column("Grand Father Name", "grandFatherName", type.stringType()),
                col.column("Permanent Address", "permanentAddress", type.stringType()),
                col.column("Citizenship Number", "citizenshipNumber", type.stringType())
//                col.column("Additional Investment", "additionalInvestment", type.stringType()
        )
                .columnHeader(cmp.verticalGap(5))
                .setDataSource(dataSourceConsolidated(params))
                .title(
                headComponent("Executive Summary Report")
        )
                .toPdf(Exporters.pdfExporter("Report/consolidatedReport.pdf"));
    }

    private JRDataSource dataSourceConsolidated(params){

        def shareHolderList = UserRole.findAllByRole(Role.findByAuthority('ROLE_SHAREHOLDER'));

        def shareHolderLists = []
        def additionalInfoLists = []
        def shareInfoLists = []

        shareHolderList.each {
            shareHolderLists.add(User.findById(it.user.id))
            shareInfoLists.add(Share.findAllByUser(it.user))
            additionalInfoLists.add(Shareholder.findByUser(it.user))
        }

        DRDataSource dataS = new DRDataSource("id", "name", "noOfShare","investment",
                "contactNo","email","fatherName","grandFatherName","permanentAddress","citizenshipNumber");

        for(int i =0;i<shareInfoLists.size();i++){
            String name = shareHolderLists[i].firstName+" "+shareHolderLists[i].lastName
            def address = additionalInfoLists[i].city+", "+additionalInfoLists[i].district

            def numOfShares = shareInfoLists[i].numberOfShares
            double numOfShareString = 0

            numOfShares.each{
                numOfShareString+=Double.parseDouble(it)
            }

            def shareAmount = shareInfoLists[i].shareAmount
            double shareAmountString = 0

            shareAmount.each{
                shareAmountString += Double.parseDouble(it)
            }

            dataS.add(
                    shareHolderLists[i].id.toString(),
                    name.toString(),
                    numOfShareString.toString(),
                    shareAmountString.toString(),
                    shareHolderLists[i].mobileNumber.toString(),
                    shareHolderLists[i].email.toString(),
                    additionalInfoLists[i].fatherName.toString(),
                    additionalInfoLists[i].grandFatherName.toString(),
                    address.toString(),
                    additionalInfoLists[i].citizenshipNo.toString()
//                    shareInfoLists[i][maxIndex].shareAmount.toString()
            )
        }
        return dataS;

    }
    private JRDataSource dataSourceIndividual(params){

        def shareHolderList = UserRole.findAllByRole(Role.findByAuthority('ROLE_SHAREHOLDER'));

        def shareHolderLists = []
        def additionalInfoLists = []
        def shareInfoLists = []

        shareHolderList.each {
            shareHolderLists.add(User.findById(it.user.id))
            shareInfoLists.add(Share.findAllByUser(it.user))
            additionalInfoLists.add(Shareholder.findByUser(it.user))
        }

        DRDataSource dataS = new DRDataSource("id", "name", "noOfShare","investment","from","to",
                "contactNo","email","fatherName","grandFatherName","permanentAddress","citizenshipNumber");

        for(int i =0;i<shareInfoLists.size();i++){
            String name = shareHolderLists[i].firstName+" "+shareHolderLists[i].lastName
            def address = additionalInfoLists[i].city+", "+additionalInfoLists[i].district

            def numOfShares = shareInfoLists[i].numberOfShares
            String numOfShareString = ""

            numOfShares.each{
                    numOfShareString+=it+"\n"
                }

            def shareAmount = shareInfoLists[i].shareAmount
            String shareAmountString = ""

            shareAmount.each{
                shareAmountString += it + "\n"
            }

            def shareStart = shareInfoLists[i].shareStart
            String shareStartString = ""
            shareStart.each{
                shareStartString+=it+"\n"
            }

            def shareEnd = shareInfoLists[i].shareEnd
            String shareEndString = ""
            shareEnd.each{
                shareEndString+=it+"\n"
            }

        dataS.add(
                    shareHolderLists[i].id.toString(),
                    name.toString(),
                    numOfShareString.toString(),
                    shareAmountString.toString(),
                    shareStartString.toString(),
                    shareEndString.toString(),
                    shareHolderLists[i].mobileNumber.toString(),
                    shareHolderLists[i].email.toString(),
                    additionalInfoLists[i].fatherName.toString(),
                    additionalInfoLists[i].grandFatherName.toString(),
                    address.toString(),
                    additionalInfoLists[i].citizenshipNo.toString()
//                    shareInfoLists[i][maxIndex].shareAmount.toString()
            )
        }
        return dataS;

    }


    private ComponentBuilder headComponent(String titleName){
        return cmp.horizontalList()
                .add(
                cmp.image("upload/logo/logo.png").setFixedDimension(200, 60).setHorizontalAlignment(HorizontalAlignment.LEFT),
                cmp.text(titleName).setStyle(titleStyle).setHorizontalAlignment(HorizontalAlignment.CENTER),
                cmp.text(new Date()).setStyle(titleStyle).setHorizontalAlignment(HorizontalAlignment.RIGHT))
                .newRow()
                .add(cmp.filler().setStyle(stl.style().setTopBorder(stl.pen2Point())).setFixedHeight(10));
    }


}
