<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>


<div class="container">
    <g:form id="add-user-form" controller="shareholder" action="save" enctype="multipart/form-data">
        <input type="hidden" name="user_id" id="user_id" value="${id}">
        <div class="row">
            <div class="col-md-4">
                <fieldset>
                    <legend>General Info</legend>
                        <div class="form-group">
                            <label for="fatherName">Father Name:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="fatherName" id="fatherName">
                        </div>
                        <div class="form-group">
                            <label for="grandFatherName">Grand Father name:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="grandFatherName" id="grandFatherName">
                        </div>
                        <div class="form-group">
                            <label for="secondContactNo">Second Contact No.<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="secondContactNo" id="secondContactNo">
                        </div>
                        <div class="form-group">
                            <label for="secondContactNo">City:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="city" id="city">
                        </div>
                        <div class="form-group">
                            <label for="secondContactNo">Zone:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="zone" id="zone">
                        </div>
                         <div class="form-group">
                            <label for="secondContactNo">District:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="district" id="district">
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-4">Signature</label>
                            <input type="file" name="signature" id="signature">
                        </div>
                </fieldset>
            </div>

            <div class="col-md-4">
                <fieldset>
                    <legend>Share</legend>
                        <div class="form-group">
                            <label for="numberOfShares">Number of shares:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="numberOfShares" id="numberOfShares">
                        </div>

                        <div class="form-group">
                            <label for="shareStart">Share Start No.:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="shareStart" id="shareStart">
                        </div>

                        <div class="form-group">
                            <label for="shareEnd">Share End No.:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="shareEnd" id="shareEnd">
                        </div>


                        <div class="form-group">
                            <label for="shareAmount">Amount:<span style="color:red">*</span></label>
                            <input type="number" class="form-control" name="shareAmount" id="shareAmount" >
                        </div>

                        <div class="form-group">
                            <label for="sharePercent">Percent:<span style="color:red">*</span></label>
                            <input type="number" class="form-control" name="sharePercent" id="sharePercent">
                        </div>
                        <div class="form-group">
                            <label for="purchasedDate">Purchased Date:<span style="color:red">*</span></label>
                            <input type="date" class="form-control" name="purchasedDate" id="purchasedDate">
                        </div>

                        <div class="form-group">
                                <label class="control-label col-sm-4">Share Certificate:<span style="color:red">*</span></label>
                                <input type="file" name="shareCertificate" id="shareCertificate">
                        </div>
                </fieldset>
            </div>

            <div class="col-md-4">
                <fieldset>
                    <legend>Citizenship</legend>
                        <div class="form-group">
                            <label for="citizenshipNo">CitizenShip Number:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="citizenshipNo" id="citizenshipNo">
                        </div>
                        <div class="form-group">
                            <label for="citizenshipIssueDistrict">Issued-district:<span style="color:red">*</span></label>
                            <input type="text" class="form-control" name="citizenshipIssueDistrict" id="citizenshipIssueDistrict">
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Citizenship PhotoCopy:<span style="color:red">*</span></label>
                            <input type="file" name="citizenShipPhoto" id="citizenship-photo">
                        </div>
                </fieldset>
            </div>
        </div>
        <hr/>
        <button style="color: #ffffff; background-color: #226CB5;" type="submit" class="btn btn-default pull-right">Submit</button>
    </g:form>
</div>

</div>
</body>
</html>