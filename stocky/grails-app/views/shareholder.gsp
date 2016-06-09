<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 4/20/2016
  Time: 6:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Stocky</title>
</head>
<body>

<div></div>

<div class="container">

    <g:each in="${userList}" var="ulist" status="i">
        <div id="user-info-row" class="row">
        <div class="col-sm-4">
            <img class="user-photo" src="${resource(dir: 'images',file: 'deerwalk-logo.png')}">
        </div>
        <div class="col-md-4">
            <table class="user-info">
                <tr>
                    <td>Name<span style="float: right; margin-right: 10%; position: relative">:</span></td>
                    <td>${ulist.firstName}&nbsp;${ulist.lastName}</td>
                </tr>
                <tr>
                    <td>Mobile Number<span style="float: right; margin-right: 10%; position: relative">:</span></td>
                    <td>${ulist.mobileNumber}</td>
                </tr>
                <tr>
                    <td>Email<span style="float: right; margin-right: 10%; position: relative">:</span></td>
                    <td>${ulist.email}</td>
                </tr>
            </table>
        </div>
        <div class="col-md-4 ">
            <ul style="list-style: none; float: left;">
                <li style="display: inline-block;"><button class="user-info-button" id="user-email" type="button">Email</button></li>
                <li style="display: inline-block;"><g:link action="editSave" controller="user" id="${ulist.id}"> <button class="user-info-button" id="user-edit" type="button">Edit</button></g:link ></li>
                <li style="display: inline-block;"><g:link action="delete" controller="user" id="${ulist.id}"><button class="user-info-button" id="user-delete" type="button" >Delete</button></g:link ></li>
            </ul>
        </div>
        </div>
    </g:each>

</div>

</body>
</html>