<%--
  Created by IntelliJ IDEA.
  User: Arun Tamang
  Date: 6/10/2016
  Time: 4:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>

<div class="container">
    <g:form id="add-user-form" controller="shareholder" action="additionalUpdate" enctype="multipart/form-data">
        <input type="hidden" id="currentShareValue" value="${session.getAttribute("shareValue")}">
        <input type="hidden" id="capitalValue" value="${session.getAttribute("paidCapitalValue")}">
        <input type="hidden" name="user_id" id="user_id" value="${user.id}">
      %{--  <input type="hidden" value="${user.id}" name="userId"/>--}%
        <div class="row">
            <div class="col-md-4">
                <fieldset>
                    <legend>General Info</legend>
                    <div class="form-group">
                        <label for="fatherName">Father Name:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="fatherName" value="${shareholer.fatherName}" id="fatherName" onchange="validateFatherName()">
                        <span hidden="true" class="error-fatherName">Please enter characters only</span>
                    </div>
                    <div class="form-group">
                        <label for="grandFatherName">Grand Father name:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="grandFatherName" value="${shareholer.grandFatherName}" id="grandFatherName" onchange="validateGrandFatherName()">
                        <span hidden="true" class="error-grandFatherName">Please enter character only</span>
                    </div>
                    <div class="form-group">
                        <label for="secondContactNo">Second Contact No.<span style="color:red">*</span></label>
                        <input type="text" class="form-control"  value="${shareholer.secondContactNo}" name="secondContactNo"  id="secondContactNo">
                    </div>
                    <div class="form-group">
                        <label for="secondContactNo">City:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="city" id="city" value="${shareholer.city}" onchange="validateCity()">
                        <span hidden="true" class="error-city">please enter city name</span>
                    </div>
                    <div class="form-group">
                        <label for="zone">Zone:<span style="color:red">*</span></label>

                        <select name="zone" id="zone" class="form-control" value="${shareholer.zone}" onchange="printDistrict(this.value)">
                            <option value="Select a zone">Select a Zone</option>
                            <option value="Bagmati">Bagmati</option>
                            <option value="Bheri">Bheri</option>
                            <option value="Dhawalagari"> Dhawalagari </option>
                            <option value="Gandaki"> Gandaki </option>
                            <option value="Janakpur"> Janakpur </option>
                            <option value="Karnali"> Karnali </option>
                            <option value="Koshi"> Koshi </option>
                            <option value="Lumbini"> Lumbini </option>
                            <option value="Mahakali"> Mahakali </option>
                            <option value="Mechi"> Mechi </option>
                            <option value="Narayani"> Narayani </option>
                            <option value="Rapti"> Rapti </option>
                            <option value="Sagarmatha"> Sagarmatha </option>
                            <option value="Seti"> Seti </option>
                        </select>

                        <span hidden="true" class="error-zone">Please enter the district name</span>
                    </div>
                    <div class="form-group">
                        <label for="secondContactNo">District:<span style="color:red">*</span></label>
                        <select class="form-control" id="districtList" name="district">

                        </select>
                        <span hidden="true" class="error-district">Please enter the district name</span>
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
                        <input type="text" class="form-control" name="numberOfShares" value="${share.numberOfShares}" id="numberOfShares"  onchange="form()">
                        <span hidden="true" class="error-numberShare">Please enter the numeric character only</span>
                    </div>

                    <div class="form-group">
                        <label for="shareStart">Share Start No.:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="shareStart" value="${share.shareStart}" id="shareStart"  onchange="getShareValue()">
                        <span hidden="true" class="error-start">Please enter the numeric character only</span>
                    </div>

                    <div class="form-group">
                        <label for="shareEnd">Share End No.:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="shareEnd" value="${share. shareEnd}" id="shareEnd">
                        <span hidden="true" class="error-end">Please enter the numeric character only</span>
                    </div>


                    <div class="form-group">
                        <label for="shareAmount">Amount:<span style="color:red">*</span></label>
                        <input type="number" class="form-control" value="${share.shareAmount}" name="shareAmount"  id="shareAmount" >
                        <span hidden="true" class="error-shareAmt">Please enter the numeric character only</span>
                    </div>

                    <div class="form-group">
                        <label for="sharePercent">Percent:<span style="color:red">*</span></label>
                        <input type="number" class="form-control" value="${share.sharePercent}" name="sharePercent"  id="sharePercent">
                        <span hidden="true" class="error-sharePercent">Please enter the numeric character only</span>
                    </div>

                    <div class="form-group">
                        <label class="control-label ">Share Certificate no.:</label>
                        <input class="form-control" type="text" name="shareCertificateNumber"  value="${share.shareCertificateNumber}" id="certificateNum"  onchange="validateCertificateNum()">
                        <span hidden="true" class="error-shareCertificateNum">Please enter the numeric character only</span>
                    </div>

                    <div class="form-group">
                        <label for="purchasedDate">Purchased Date:<span style="color:red">*</span></label>
                        <input type="date" class="form-control" name="purchasedDate" alue="${share.purchasedDate}" id="purchasedDate">
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4">Share Certificate:<span style="color:red">*</span></label>
                        <input type="file" name="shareCertificate"  value="${share.shareCertificate}" id="shareCertificate">
                    </div>
                </fieldset>
            </div>

            <div class="col-md-4">
                <fieldset>
                    <legend>Citizenship</legend>
                    <div class="form-group">
                        <label for="citizenshipNo">CitizenShip Number:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="citizenshipNo" id="citizenshipNo" value="${shareholer.citizenshipNo}" onchange="checkCitizenship()">
                        <span hidden="true" class="error-citizenshipNum">Please enter numerical value</span>
                    </div>
                    <div class="form-group">
                        <label for="citizenshipIssueDistrict">Issued-district:<span style="color:red">*</span></label>
                        <input type="text" class="form-control" name="citizenshipIssueDistrict" id="citizenshipIssueDistrict" value="${shareholer.citizenshipIssueDistrict}" onchange="isssuedDistrict()">
                        <span hidden="true" class="error-issuedDistrict">Please enter the district name</span>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Citizenship PhotoCopy:<span style="color:red">*</span></label>
                        <input type="file" name="citizenShipPhoto" value="${shareholer.citizenShipPhoto}" id="citizenship-photo">
                    </div>
                </fieldset>
            </div>
        </div>
        <hr/>
        <button style="color: #ffffff; background-color: #226CB5;" type="submit" class="btn btn-default pull-right">Update</button>
    </g:form>
</div>

</div>

<script>

    function printDistrict(zone){

        var districtSelect='' ;

        if (zone === "Bagmati") {

            districtSelect = '<option value="Bhaktapur"> Bhaktapur </option>'+
            '<option value="Dhading">Dhading </option>'+
            '<option value="Kathmandu">Kathmandu </option>'+
            '<option value="Kavrepalanchowk">Kavrepalanchowk </option>'+
            '<option value="Lalitpur">Lalitpur </option>'+
            '<option value="Nuwakot">Nuwakot </option>'+
            '<option value="Rasuwa">Rasuwa </option>'+
            '<option value="Sindupalchowk">Sindupalchowk </option>';

            $('#districtList').html(districtSelect)

        }

        else if (zone === "Bheri"){
            districtSelect=
                    '<option value= "Banke"> Banke </option>'+
                    '<option value= "Bardiya"> Bardiya </option>'+
                    '<option value= "Dailekh"> Dailekh </option>'+
                    '<option value= "Jajarkot"> Jajarkot </option>'+
                    '<option value= "Surkhet"> Surkhet </option>';

            $('#districtList').html(districtSelect)

        }

        else if (zone == "Dhawalagari"){
            districtSelect=
                    '<option value= "Baglung"> Baglung </option>'+
                    '<option value= "Mustang"> Mustang </option>'+
                    '<option value= "Myagdi"> Myagdi </option>'+
                    '<option value= "Parbat"> Parbat </option>';


            $('#districtList').html(districtSelect)

        }

        else if (zone == "Gandaki"){
            districtSelect=
                    '<option value= "Gorkha"> Gorkha </option>'+
                    '<option value= "Kaski"> Kaski </option>'+
                    '<option value= "Lamjung"> Lamjung </option>'+
                    '<option value= "Manang"> Manang </option>'+
                    '<option value= "Syangja"> Syangja </option>'+
                    '<option value= "Tahanu"> Tanahu </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Janakpur"){
            districtSelect=
                    '<option value= "Dhanusa"> Dhanusa </option>'+
                    '<option value= "Dholkha"> Dholkha </option>'+
                    '<option value= "Mahottari"> Mahottari </option>'+
                    '<option value= "Ramechap"> Ramechap </option>'+
                    '<option value= "Sarlahi"> Sarlahi </option>'+
                    '<option value= "Sindhuli"> Sindhuli </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Karnali"){
            districtSelect=
                    '<option value= "Dolpa"> Dolpa </option>'+
                    '<option value= "Humla"> Humla </option>'+
                    '<option value= "Jumla"> Jumla </option>'+
                    '<option value= "Kalikot"> Kalikot </option>'+
                    '<option value= "Mugu"> Mugu </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Koshi"){
            districtSelect=
                    '<option value= "Bhojpur"> Bhojpur </option>'+
                    '<option value= "Dhankuta"> Dhankuta </option>'+
                    '<option value= "Morang"> Morang </option>'+
                    '<option value= "Sankhuwasabha"> Sankhuwasabha </option>'+
                    '<option value= "Sunsari"> Sunsari </option>'+
                    '<option value= "Terhathum"> Terhathum </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Lumbini"){
            districtSelect=
                    '<option value= "Arghakhanchi"> Arghakhanchi </option>'+
                    '<option value= "Gulmi"> Gulmi </option>'+
                    '<option value= "Kapilvastu"> Kapilvastu </option>'+
                    '<option value= "Nawalparasi"> Nawalparasi </option>'+
                    '<option value= "Palpa"> Palpa </option>'+
                    '<option value= "Rupandehi"> Rupandehi </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Mahakali"){
            districtSelect=
                    '<option value= "Baitadi"> Baitadi </option>'+
                    '<option value= "Dhadeldhura"> Dhadeldhura </option>'+
                    '<option value= "Darchula"> Darchula </option>'+
                    '<option value= "Kanchanpur"> Kanchanpur </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Mechi"){
            districtSelect=
                    '<option value= "Ilam"> Ilam </option>'+
                    '<option value= "Jhapa"> Jhapa </option>'+
                    '<option value= "Panchthar"> Panchthar </option>'+
                    '<option value= "Taplejung"> Taplejung </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Narayani"){
            districtSelect=
                    '<option value= "Bara"> Bara </option>'+
                    '<option value= "Chitwan"> Chitwan </option>'+
                    '<option value= "Makwanpur"> Makwanpur </option>'+
                    '<option value= "Parsa"> Parsa </option>'+
                    '<option value= "Parsa"> Parsa </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Rapti"){
            districtSelect=
                    '<option value= "Dang"> Dang </option>'+
                    '<option value= "Pyuthan"> Pyuthan </option>'+
                    '<option value= "Rolpa"> Rolpa </option>'+
                    '<option value= "Rukum"> Rukum </option>'+
                    '<option value= "Salyan"> Salyan </option>';

            $('#districtList').html(districtSelect)
        }

        else if (zone == "Sagarmatha"){
            districtSelect=
                    '<option value= "Khotang"> Khotang </option>'+
                    '<option value= "Okhaldhunga"> Okhaldhunga </option>'+
                    '<option value= "Saptari"> Saptari </option>'+
                    '<option value= "Siraha"> Siraha </option>'+
                    '<option value= "Solukhumbu"> Solukhumbu </option>'+
                    '<option value= "Udayapur"> Udayapur </option>';

            $('#districtList').html(districtSelect)
        }
        else if (zone == "Seti"){
            districtSelect=
                    '<option value= "Accham"> Accham </option>'+
                    '<option value= "Pyuthan"> Pyuthan </option>'+
                    '<option value= "Bajhang"> Bajhang </option>'+
                    '<option value= "Doti"> Doti </option>'+
                    '<option value= "Kailali"> Kailali </option>';

            $('#districtList').html(districtSelect)
        }






    }

    function validateFatherName() {
        var fatherName = $('#fatherName').val()
        var nameFormat = /^[a-zA-Z\s ]+$/;

        if (fatherName == " " || fatherName == undefined) {
            $('.error-fatherName').attr('hidden', false)
            return false
        } else if (!fatherName.match(nameFormat)) {
            $('.error-fatherName').attr('hidden', false)
            return false

        } else {
            $('.error-fatherName').attr('hidden', true)
            return true
        }
    }

    function validateGrandFatherName() {
        var grandFatherName = $('#grandFatherName').val()
        //  alert(grandFatherName)
        var nameFormat = /^[a-zA-Z\s ]+$/;
        if (grandFatherName == "") {
            $('.error-grandFatherName').attr('hidden', false)
            return false
        } else if (!grandFatherName.match(nameFormat)) {
            $('.error-grandFatherName').attr('hidden', false)
            return false
        } else {
            $('.error-grandFatherName').attr('hidden', true)
            return true
        }
    }

    function validateCity(){
        var city = $('#city').val()
        var nameFormat = /^[a-zA-Z\s ]+$/;
        if (city == "") {
            $('.error-city').attr('hidden', false)
            return false
        } else if (!city.match(nameFormat)) {
            $('.error-city').attr('hidden', false)
            return false
        } else {
            $('.error-city').attr('hidden', true)
            return true
        }
    }

    function validateDistrict() {
        var district = $('#district').val()
        var nameFormat = /^[a-zA-Z\s ]+$/;
        if (district == "") {
            $('.error-district').attr('hidden', false)
            return false
        } else if (!district.match(nameFormat)) {
            $('.error-district').attr('hidden', false)
            return false
        } else {
            $('.error-district').attr('hidden', true)
            return true
        }
    }

    function validateZone(){
        var zone = $('#zone').val()
        var nameFormat = /^[a-zA-Z\s ]+$/;
        if (zone == "") {
            $('.error-zone').attr('hidden', false)
            return false
        } else if (!zone.match(nameFormat)) {
            $('.error-zone').attr('hidden', false)
            return false
        } else {
            $('.error-zone').attr('hidden', true)
            return true
        }
    }

    function form(){
        var numShare  = $('#numberOfShares').val();
        alert(numShare)
        var numStart = $('#shareStart').val();
        alert(numStart)
        var numEnd = $('#shareEnd').val();
        alert(numEnd)
        var shareAmount = $('#shareAmount').val();
        var percent = $('#sharePercent').val();

        var isCheck = true;

        if(isNaN(numShare)){
            $('.error-numberShare').attr('hidden',false)
            isCheck = false;
        }
        else {
            $('.error-numberShare').attr('hidden',true)
        }

        if(isNaN(numStart)){
            $('.error-start').attr('hidden',false)
            isCheck =false;
        }
        else{
            $('.error-start').attr('hidden',true)
        }

        if(isNaN(numEnd)){
            $('.error-end').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-end').attr('hidden',true)
        }

        if(isNaN(shareAmount)){
            $('.error-shareAmt').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-shareAmt').attr('hidden',true)
        }

        if(isNaN(percent)){
            $('.error-sharePercent').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-sharePercent').attr('hidden',true)
        }

        return isCheck

    }

    function getShareValue(){

        var shareStart = $('#shareStart').val();
        var numberOfShare = $('#numberOfShares').val();
        var sharevalue = $('#currentShareValue').val();
        var paidCapitalValue = $('#capitalValue').val();

        shareStart = parseInt(shareStart)
        numberOfShare = parseInt(numberOfShare)

        var totalShareValue = parseInt(sharevalue) * numberOfShare
        var shareEnd = shareStart + numberOfShare - 1;

        $('#shareEnd').val(shareEnd);
        $('#shareAmount').val(totalShareValue);
        var shareAmount = $('#shareAmount').val();
        var percent = (parseInt(shareAmount)/parseInt(paidCapitalValue)) * 100;
        $('#sharePercent').val(percent);

    }

    function checkCitizenship(){
        var citizenShip = $('#citizenshipNo').val()
        var numFormat = /^[0-9]+$/;

        if(citizenShip == ""){
            $('.error-citizenshipNum').attr('hidden',false)
            return false
        }else if(!citizenShip.match(numFormat)){
            $('.error-citizenshipNum').attr('hidden',false)
            return false
        }else{
            $('.error-citizenshipNum').attr('hidden',true)
            return true
        }
    }

    function isssuedDistrict(){

        var issuedDistrict = $('#citizenshipIssueDistrict').val()
        var nameFormat = /^[a-zA-Z\s ]+$/;

        if (issuedDistrict == "") {
            $('.error-issuedDistrict').attr('hidden', false)
            return false
        } else if (!issuedDistrict.match(nameFormat)) {
            $('.error-issuedDistrict').attr('hidden', false)
            return false
        } else {
            $('.error-issuedDistrict').attr('hidden', true)
            return true
        }
    }

    function validateCertificateNum(){
        var certificateNum = $('#certificateNum').val()
        var numFormat = /^[0-9]+$/;

        if(certificateNum==""){
            $('.error-shareCertificateNum').attr('hidden',false)
            return false
        }
        else if(!certificateNum.match(numFormat)){
            $('.error-shareCertificateNum').attr('hidden',false)
            return false
        }
        else{
            $('.error-shareCertificateNum').attr('hidden',true)
            return true

        }

    }

</script>

</body>
</html>