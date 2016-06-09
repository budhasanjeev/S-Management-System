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
<div align="center" style="margin-bottom:10px" class="container" >

    <div style=" margin-bottom: 5px; width: 80%;" id="add-user-form" class="form">


        <fieldset>
        <legend>Add New User<g:link controller="user" action="createNepali"><button class="btn btn-success pull-right">नेपाली</button></g:link></legend>
        <g:form controller="user" action="save" enctype="multipart/form-data" style="color:black;margin-top:10px;margin-right:60px" id="createUserForm" class="form-horizontal">

            <input type="hidden" name="form_type" id="form_type" value="english">
            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4">First Name:<span style="color:red;"> *</span></label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" name="firstName" id="fName" required>
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4">Last Name:<span style="color:red;"> *</span></label>

                <div class="col-sm-8">
                    <input style="" class="form-control" type="text" name="lastName" id="lName" required>
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4">Username:<span style="color:red;"> *</span></label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" name="username" onchange="checkUserName();" id="userId" required>
                    <span hidden="true" id="error-username" style="position: absolute; z-index: 10000; background-color: red; color: white;">Username Already Exist</span>
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4" >Password:</label>

                <div class="col-sm-8">
                    <input class="form-control" id="passwords" value="**************" type="password" name="password" disabled>
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4 pull-left" >Email:<span style="color:red;"> *</span></label>

                <div class="col-sm-8">
                    <input class="form-control" id="emailId" type="text" name="email" onchange="checkMail();" required>
                    <span hidden="true" id="error-email">Email Address Already Exist</span>
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4">Mobile:<span style="color:red;"> *</span></label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" name="mobileNumber" id="mobileNumber" >
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label class="control-label col-sm-4">Landline:</label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" name="landLineNumber" id="landLineNumber" >
                </div>
            </div>

            <div class="form-group col-sm-6">
                <label  class="control-label col-sm-4" >Role:<span style="color:red;"> *</span></label>

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
    function UserUrl(){
        this.validateEmail = "<g:createLink controller="user" action="checkMail"/>"
        this.validateUsername = "<g:createLink controller="user" action="checkUserName"/>"
    }

    userUrl = new UserUrl();

    function checkMail() {
        var email = document.getElementById("emailId").value;

        if (email) {
            $.ajax({
                type: 'post',
                url: userUrl.validateEmail,
                data:"email="+email,
                success: function (data) {
                    if(data.messageType=='success'){
                        $('#error-email').attr('hidden',false)
                    }else{
                        $('#error-email').attr('hidden',true)
                    }
                },
                error:function(err){
                    alert("Error"+err);
                }
            });
        }
    }

    function checkUserName(){
        var username = document.getElementById("userId").value

        if (username) {
            $.ajax({
                type: 'post',
                url: userUrl.validateUsername,
                data:"username="+username,
                success: function (data) {
                    if(data.messageType=='success'){
                        $('#error-username').attr('hidden',false)
                    }else{
                        $('#error-username').attr('hidden',true)
                    }
                },
                error:function(err){
                    alert("Error"+err);
                }
            });
        }

    }

</script>
</body>
</html>