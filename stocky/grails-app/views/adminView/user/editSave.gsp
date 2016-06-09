<%--
  Created by IntelliJ IDEA.
  User: Arun Tamang
  Date: 4/28/2016
  Time: 4:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio </title>
</head>

<body>
<div align="center" style="margin-bottom:10px" class="container" >

    <div style=" margin-bottom: 5px" id="add-user-form" class="form">

        <g:form controller="user" action="update" enctype="multipart/form-data" style="color:black;margin-top:10px;margin-right:60px" id="createUserForm" class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-sm-4">First Name:</label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" value="${user.firstName}" name="firstName" id="fName">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-4">Last Name:</label>

                <div class="col-sm-8">
                    <input style="" class="form-control" type="text" value="${user.lastName}" name="lastName" id="lName">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-4">Username:</label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" value="${user.username}" name="username" id="userId">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-4" >Password:</label>

                <div class="col-sm-8">
                    <input class="form-control" id="passwords" value="${user.password}" type="password" name="password">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-4" >Email:</label>

                <div class="col-sm-8">
                    <input class="form-control" id="emailId" value="${user.email}" type="text" name="email">
                </div>
            </div>

           %{-- <div class="form-group">
                <label class="control-label col-sm-4">Contact:</label>

                <div class="col-sm-8">
                    <input class="form-control" type="text" value="${user?.contact}" name="contact" id="contact">
                </div>
            </div>--}%

            <div class="form-group">
                <label  class="control-label col-sm-4" >Role:</label>

                <div class="col-sm-8">
                    <select class="form-control" name="roles">
                        <option value="ROLE_ADMIN">ADMIN</option>
                        <option value="ROLE_STAFF">EMPLOYEE</option>
                        <option value="ROLE_EXECUTIVE">EXECUTIVE</option>
                        <option value="ROLE_SHAREHOLDER">SHAREHOLDER</option>
                    </select>
                </div>

            </div>

            <div class="form-group">
                <label class="control-label col-sm-4">Photo Upload:</label>

                <div class="col-sm-8">
                    <input class="form-control" type="file" name="photo" id="photo">
                </div>
            </div>
            <input type="hidden" value="${user.id}" name="userId"/>

        %{--<button type="submit" class="btn btn-primary" id="saveUser" onclick="return createUser();">Create</button>--}%
            <div class="col-sm-8">
                <button style="margin-left: 428px" type="submit" class="btn btn-primary" id="save">Update</button>
            </div>

        </g:form>
    </div>
</div>

</body>
</html>