<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 4/24/2016
  Time: 12:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>
<div align="center" style="margin-bottom:10px" class="container">

    <div style=" margin-bottom: 5px; width: 80%;" id="add-user-form" class="form">

        <fieldset>
            <legend>Add New User<g:link controller="user" action="createNepali"><button
                    class="btn btn-success pull-right">नेपाली</button></g:link></legend>
            <g:form controller="user" action="save" enctype="multipart/form-data"
                    style="color:black;margin-top:10px;margin-right:60px" id="createUserForm" class="form-horizontal"
                            onsubmit="return (validateAddUserForm())">

                <input type="hidden" name="form_type" id="form_type" value="english">

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">First Name:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="firstName" onblur="validateAddUser()" id="fName"
                               required>
                        <span hidden="true" class="error-firstName">Name cannot be null or number</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Last Name:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input style="" class="form-control" type="text" name="lastName" onblur="validateLastName()" id="lName" required>
                        <span hidden="true" class="error-lastName">Last name cannot be null or number</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Username:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="username" onblur="checkUserName();" id="userId"
                               required>
                        <span hidden="true" id="error-username" style="position: absolute; z-index: 10000; background-color: red; color: #ffffff;">Username Already Exist or cannot be null</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Password:</label>

                    <div class="col-sm-8">
                        <input class="form-control" id="passwords" value="**************" type="password"
                               name="password" disabled>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4 pull-left">Email:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" id="emailId" type="text" name="email" onblur="checkMail();" required>
                        <span hidden="true" id="error-email">Email Address Already Exist</span>
                        <div> <span hidden="true" id="error-emailFormat">Invalid email address</span></div>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Mobile:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobileNumber" onblur="validateNumber();" id="mobileNumber">
                        <span hidden="true" id="error-mobileNumber">Mobile number cannot be blank or cannot be characters</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Landline:</label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="landLineNumber" onchange="landLine();"  id="landLineNumber">
                        <span hidden="true" id="error-landLine">Landline number cannot be characters</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Role:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <select class="form-control" name="roles" required>
                            <option value="ROLE_ADMIN">ADMIN</option>
                            <option value="ROLE_EMPLOYEE">EMPLOYEE</option>
                            <option value="ROLE_EXECUTIVE">EXECUTIVE</option>
                            <option value="ROLE_SHAREHOLDER">SHAREHOLDER</option>
                        </select>
                    </div>

                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">Photo Upload:</label>
                    <input class="col-sm-8" type="file" name="photo" id="photo">
                </div>

            %{--<button type="submit" class="btn btn-primary" id="saveUser" onclick="return createUser();">Create</button>--}%
                <div class="col-sm-8" style="width: 100%;">
                    <button style="float: right;" type="submit" class="btn btn-primary" id="save">Create</button>
                </div>

            </g:form>
        </fieldset>
    </div>
</div>


<script>
    function UserUrl() {
        this.validateEmail = "<g:createLink controller="user" action="checkMail"/>"
        this.validateUsername = "<g:createLink controller="user" action="checkUserName"/>"
    }

    userUrl = new UserUrl();

    function checkMail() {
        var email = document.getElementById("emailId").value;
        var emailFormat = /^([a-zA-Z0-9_\.\-])+@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        if (email.match(emailFormat)) {
            $.ajax({
                type: 'post',
                url: userUrl.validateEmail,
                data: "email=" + email,
                success: function (data) {
                    if (data.messageType == 'success') {
                        alert("hahaha")
                        $('#error-email').attr('hidden', false)
                        $('#error-emailFormat').attr('hidden',true)

                    } else {
                        $('#error-email').attr('hidden', true)
                        $('#error-emailFormat').attr('hidden',true)
                    }
                },
                error: function (err) {
                    alert("Error" + err);
                }
            });
        }
        else if(!email.match(emailFormat)){
            //  alert("Please enter the valid email address");
            $('#error-email').attr('hidden', true)
            $('#error-emailFormat').attr('hidden',false)
            return false;
        }else{
            // alert("abc: "+email)
            $('#error-emailFormat').attr('hidden',true)
            return true;
        }
    }

    function checkUserName() {
        var username = $("#userId").val();
        //  alert(username)

        if (username) {
            $.ajax({
                type: 'post',
                url: userUrl.validateUsername,
                data: "username=" + username,
                success: function (data) {

                    if (data.messageType == 'success') {
                        $('#error-username').attr('hidden', false)
                    } else {
                        $('#error-username').attr('hidden', true)
                    }
                },
                error: function (err) {
                    alert("Error" + err);
                }

            })
        }

        else if(username === "" || username === undefined){
            $('#error-username').attr('hidden', false)
            return false;
        }

    }

    function validateAddUser() {
        var firstName = $('#fName').val();
        var alpha = /^[a-zA-Z\s ]+$/;
        //alert("1");

        //var isCheck = true;
        if (firstName == "") {
            // alert("Please enter the name");
            $('.error-firstName').attr('hidden', false)
            return false;
        } else if (!firstName.match(alpha)) {
            //alert('Invalid');
            $('.error-firstName').attr('hidden', false)
            return false;
        } else {

            $('.error-firstName').attr('hidden', true)
            return true;
        }
    }

    function  validateLastName(){
        var lastName = $('#lName').val();
        var alpha = /^[a-zA-Z\s ]+$/;
        if(lastName==""){
            //  alert("Please enter the last name");
            $('.error-lastName').attr('hidden', false)
            return false;
        }else if(!lastName.match(alpha)){
            // alert("Invalid");
            $('.error-lastName').attr('hidden', false)
            return false;
        }else{  $('.error-lastName').attr('hidden', true)

            return true;
        }
    }

    function validateNumber(){
        var mobileNumber = $("#mobileNumber").val();
        var beta = /^[0-9]+$/;
        //alert(mobileNumber);
        if(mobileNumber==""){
            // alert("Please enter the number");
            $('#error-mobileNumber').attr('hidden', false);
            return false;
        }else if(!mobileNumber.match(beta)){
            //  alert("Invalid");
            $('#error-mobileNumber').attr('hidden', false);
            return false;
        }else{
            $('#error-mobileNumber').attr('hidden', true);
            return true;
        }
    }

    function landLine(){
        var landLine = $("#landLineNumber").val();
        var beta = /^[0-9]+$/;
        // alert(landLine);


        if(!landLine.match(beta)){
            // alert("Invalid");
            $('#error-landLine').attr('hidden', false);
            return false;
        }else{
            $('#error-landLine').attr('hidden', true);
            return true;
        }
    }

    function validateAddUserForm() {
        if (!validateAddUser()) {
            $('#fName').focus();
            return false
        }

        if (!validateLastName()) {
            $('#lName').focus();
            return false;
        }

        if (true) {
            var username = $("#userId").val();

            if (username) {
                $.ajax({
                    type: 'post',
                    url: userUrl.validateUsername,
                    data: "username=" + username,
                    success: function (data) {

                        if (data.messageType == 'success') {
                            $('#error-username').attr('hidden', false);
                            $("#userId").focus();
                            return false;


                        } else {
                            $('#error-username').attr('hidden', true);
                        }
                    },
                    error: function (err) {
                        alert("Error" + err);
                    }

                });
            }

            else if (username === "" || username === undefined) {
                $('#error-username').attr('hidden', false);
                $("#userId").focus();
                return false;
            }
        }

        if (true) {
            var email = document.getElementById("emailId").value;
            // alert(email);
            var emailFormat = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (email.match(emailFormat)) {
                $('#error-emailFormat').attr('hidden', true)
                $.ajax({
                    type: 'post',
                    url: userUrl.validateEmail,
                    data: "email=" + email,
                    success: function (data) {
                        if (data.messageType == 'success') {
                            $('#error-email').attr('hidden', false);
                            $("#emailId").focus();
                            return false;

                        } else {
                            $('#error-email').attr('hidden', true);
                        }
                    },
                    error: function (err) {
                        alert("Error" + err);
                    }
                });
            }
            else {
                //  alert("Please enter the valid email address");
                $('#error-emailFormat').attr('hidden', false);
                $("#emailId").focus();
                return false;
            }
        }

        if(!validateNumber()){
            $('#mobileNumber').focus();
            return false;
        }

        if(!landLine()){
            $('#landLineNumber').focus();
            return false;
        }
    }
</script>
</body>
</html>