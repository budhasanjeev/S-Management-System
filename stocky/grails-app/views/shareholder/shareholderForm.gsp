<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/26/2016
  Time: 4:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Portfolio</title>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="container" style="width: 700px;">
    <table class="table table-hover table-bordered">
        <thead>
        <tr >
            <th colspan="2" style="text-align: center;">
                <h3>Form</h3>
            </th>
        </tr>
        <tr>
            <th style="text-align: center"><h4>Title of the form</h4></th>
            <th style="text-align: center"><h4>Action</h4></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${formInstanceList}" var="f">
            <tr>
                <td style="text-align: center">${f.title.toUpperCase()}</td>
                <td style="text-align: center"><g:link controller="form" action="downloadForm" params="[form:f.formDoc]"><button class="btn btn-default"><span class="glyphicon glyphicon-download"></span> Download</button></g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

</div>
</body>
</html>