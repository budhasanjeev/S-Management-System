<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/27/2016
  Time: 4:23 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Portfolio</title>
    <meta content="main" name="layout">
</head>
<body>
<div class="container" style="width: 72%;text-align: center;" >
    <div class="row" style="margin-top: 3%; margin-bottom: 2%;">
        <div class="col-md-12">

            <h1 style="display: inline">Shareholder List</h1>
        </div>
    </div>

    <div class="row" style="text-align: center">
        <table class="table table-striped" id="user-table">
            <thead>
            <tr>
                <th style="width: 20%">Photo</th>
                <th>Name</th>
                <th>Address</th>
                <th>Contact</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userLists}" var="u" status="i">
                <tr>
                    <td><img class="shareholder-photo img-circle" src="${createLink(controller:'user', action:'getImage', params: [fileName:u.userImage])}"/></td>
                    <td style="vertical-align: middle;">${u.firstName} &nbsp;${u.lastName}</td>
                    <td style="vertical-align: middle;">${shareholderLists[i].city},&nbsp;${shareholderLists[i].district}</td>
                    <td style="vertical-align: middle;">${u.mobileNumber},&nbsp;${u.landLine}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

<script>
    $('#user-table').dataTable()
</script>
</body>
</html>