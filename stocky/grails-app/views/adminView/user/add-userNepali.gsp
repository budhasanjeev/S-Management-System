<%--
  Created by IntelliJ IDEA.
  User: sanjeevbudha
  Date: 4/27/16
  Time: 5:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>
<div align="center" style="margin-bottom:10px" class="container">

    <div style=" margin-bottom: 5px;width: 80%" id="add-user-form" class="form">

        <fieldset>
            <legend>प्रयोगकर्ता थप्नुहोस  <g:link controller="home" action="addUser"><button
                    class="btn btn-success pull-right">English</button></g:link></legend>


            <g:form controller="user" action="save" enctype="multipart/form-data"
                    style="color:black;margin-top:10px;margin-right:60px" id="createUserForm" class="form-horizontal"
                    onsubmit="return (validateForm())">

                <input type="hidden" name="form_type" id="form_type" value="english">

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">नाम:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="firstName" id="fName" onblur="validateFirstName()"
                               required>
                        <span hidden="true" class="error-firstName">कृपया आफ्नो नाम प्रविष्ट गर्नुहोस्</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">थर:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input style="" class="form-control" type="text" name="lastName" id="lName"
                               onblur="validateLastName()" required>
                        <span hidden="true" class="error-lastName">कृपया आफ्नो थर प्रविष्ट गर्नुहोस्</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">प्रयोगकर्ताको नाम:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="username" onblur="checkUserName();" id="userId"
                               required>
                        <span hidden="true"
                              id="error-username">प्रयोगकर्ताको नाम पहिले नै अवस्थित छ वा खाली हुन सक्दैन</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">पासवर्ड:</label>

                    <div class="col-sm-8">
                        <input class="form-control" id="passwords" value="**************" type="password"
                               name="password" disabled>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4 pull-left">इमेल:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" id="emailId" type="text" name="email" onblur="checkMail();"
                               required>
                        <span hidden="true" id="error-email">इमेल ठेगाना पहिले नै अवस्थित छ</span>

                        <div><span hidden="true" id="error-emailFormat">अवैध इमेल ठेगाना</span></div>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">संपर्क:<span style="color:red;">*</span></label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobileNumber" id="mobileNumber"
                               onblur="validateNumber()">
                        <span hidden="true"
                              id="error-mobileNumber">मोबाइल नम्बर खाली हुन सक्दैन वा वर्ण हुन सक्दैन</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">संपर्क:</label>

                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="landLineNumber" id="landLineNumber"
                               onblur="landLine()">
                        <span hidden="true" id="error-landLine">ल्याण्डलाइन नम्बर वर्ण हुन सक्दैन</span>
                    </div>
                </div>

                <div class="form-group col-sm-6">
                    <label class="control-label col-sm-4">भूमिका:<span style="color:red;">*</span></label>

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
                    <label class="control-label col-sm-4">फोटो:</label>
                    <input class="col-sm-8" type="file" name="photo" id="photo" required>
                </div>

            %{--<button type="submit" class="btn btn-primary" id="saveUser" onclick="return createUser();">Create</button>--}%
                <div class="col-sm-8" style="width: 100%;">
                    <button style="float: right;" type="submit" class="btn btn-primary"
                            id="save">सिर्जना गर्नुहोस</button>
                </div>

            </g:form>

        </fieldset>
    </div>
</div>

<script>

    userUrl = new UserUrl();

    function UserUrl() {
        this.validateEmail = "<g:createLink controller="user" action="checkMail"/>"
        this.validateUsername = "<g:createLink controller="user" action="checkUserName"/>"
    }

    function validateFirstName() {
        var firstName = $('#fName').val();

        if (firstName == "") {
//            alert("Please enter the name");
            $('.error-firstName').attr('hidden', false)
            return false;
        } else {
            $('.error-firstName').attr('hidden', true)
            return true;
        }
    }

    function validateLastName() {
        var lastName = $('#lName').val();
        if (lastName == "") {
            //  alert("Please enter the last name");
            $('.error-lastName').attr('hidden', false)
            return false;
        } else {
            $('.error-lastName').attr('hidden', true)
            return true;
        }
    }

    function checkUserName() {
        var username = $("#userId").val();

        if (username) {
            $.ajax({
                type: 'post',
                url: userUrl.validateUsername,
                data: "username=" + username,
                success: function (data) {

                    if (data.messageType == 'success') {
                        $('#error-username').attr('hidden', false);
                        return false;


                    } else {
                        $('#error-username').attr('hidden', true);
                        return true;
                    }
                },
                error: function (err) {
                    alert("Error" + err);
                }

            });
        }

        else if (username === "" || username === undefined) {
            $('#error-username').attr('hidden', false)
            return false;
        }

    }

    function checkMail() {
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
            $('#error-emailFormat').attr('hidden', false)
            return true;
        }
    }

    function validateNumber() {
        var mobileNumber = $("#mobileNumber").val();
        var beta = /^[0-9]+$/;
        //alert(mobileNumber);
        if (mobileNumber == "") {
            // alert("Please enter the number");
            $('#error-mobileNumber').attr('hidden', false);
            return false;
        } else if (!mobileNumber.match(beta)) {
            //  alert("Invalid");
            $('#error-mobileNumber').attr('hidden', false);
            return false;
        } else {
            $('#error-mobileNumber').attr('hidden', true);
            return true;
        }
    }

    function landLine() {
        var landLine = $("#landLineNumber").val();
        var beta = /^[0-9]+$/;
        // alert(landLine);


        if (landLine == "") {
            $('#error-landLine').attr('hidden', true);
            return true;
        } else if (!landLine.match(beta)) {
            // alert("Invalid");
            $('#error-landLine').attr('hidden', false);
            return false;
        } else {
            $('#error-landLine').attr('hidden', true);
            return true;
        }

    }

    function validateForm() {
        if (!validateFirstName()) {
            $('#fName').focus();
            return false;
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


        if (!validateNumber()) {
            $("#mobileNumber").focus();
            return false;

            var mobileNumber = $("#mobileNumber").val();
            var beta = /^[0-9]+$/;

            if (mobileNumber == "") {
                $('#error-mobileNumber').attr('hidden', false);
                $("#mobileNumber").focus();
                return false;
            } else if (!mobileNumber.match(beta)) {
                $('#error-mobileNumber').attr('hidden', false);
                $("#mobileNumber").focus();
                return false;
            } else {
                $('#error-mobileNumber').attr('hidden', true);
            }

        }

        if (!landLine()) {
            var landLine = $("#landLineNumber").val();
            var beta = /^[0-9]+$/;

            if (landLine == "") {
                $('#error-landLine').attr('hidden', true);
                return true;
            } else if (!landLine.match(beta)) {
                // alert("Invalid");
                $('#error-landLine').attr('hidden', false);
                return false;
            } else {
                $('#error-landLine').attr('hidden', true);
                return true;
            }

        }
        return true;
    }

</script>

</body>
</html>