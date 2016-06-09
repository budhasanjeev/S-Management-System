<%--
  Created by IntelliJ IDEA.
  User: sanjeevbudha
  Date: 4/29/16
  Time: 7:01 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>

<div class="container">
    <g:form id="add-user-form" controller="shareholder" action="saveNepali" enctype="multipart/form-data">
        <input type="hidden" name="user_id" id="user_id" value="${id}">
        <div class="row">
            <div class="col-md-4">
                <fieldset>
                    <legend>सामान्य जानकारी </legend>
                    <div class="form-group">
                        <label for="fatherName">बुबा नाम</label>
                        <input type="text" class="form-control" name="fatherName" id="fatherName">
                    </div>
                    <div class="form-group">
                        <label for="grandFatherName">हजुर बुबाको नाम</label>
                        <input type="text" class="form-control" name="grandFatherName" id="grandFatherName">
                    </div>
                    <div class="form-group">
                        <label for="secondContactNo"> दोश्रो सम्पर्क नम्बर</label>
                        <input type="text" class="form-control" name="secondContactNo" id="secondContactNo">
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">हस्ताक्षर</label>
                        <input type="file" name="signature" id="signature">
                    </div>
                </fieldset>
            </div>

            <div class="col-md-4">
                <fieldset>
                    <legend>हिस्सा </legend>
                    <div class="form-group">
                        <label for="shareholderNumber">नम्बर :</label>
                        <input type="text" class="form-control" name="shareholderNumber" id="shareholderNumber">
                    </div>
                    <div class="form-group">
                        <label for="shareAmount">रकम </label>
                        <input type="number" class="form-control" name="shareAmount" id="shareAmount">
                    </div>
                    <div class="form-group">
                        <label for="percentageOfShare">प्रतिशत </label>
                        <input type="number" class="form-control" name="percentageOfShare" id="percentageOfShare">
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4">हिस्सा प्रमाणपत्र</label>
                        <input type="file" name="share-certificate" id="share-certificate">
                    </div>
                </fieldset>
            </div>

            <div class="col-md-4">
                <fieldset>
                    <legend>नागरिकता </legend>
                    <div class="form-group">
                        <label for="citizenshipNo">नम्बर:</label>
                        <input type="text" class="form-control" name="citizenshipNo" id="citizenshipNo">
                    </div>
                    <div class="form-group">
                        <label for="citizenshipIssueDistrict">जारि गरेको जिल्ला </label>
                        <input type="text" class="form-control" name="citizenshipIssueDistrict" id="citizenshipIssueDistrict">
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">नागरिकताको फोटोकपी </label>
                        <input type="file" name="citizenship-photo" id="citizenship-photo">
                    </div>
                </fieldset>
            </div>
        </div>
        <hr/>
        <button style="color: #ffffff; background-color: #226CB5;" type="submit" class="btn btn-default pull-right">प्रस्तुत</button>
    </g:form>
</div>

</div>
</body>
</html>