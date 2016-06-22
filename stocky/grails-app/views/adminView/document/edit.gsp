<%--
  Created by IntelliJ IDEA.
  User: Sujan  Chauhan
  Date: 6/21/2016
  Time: 6:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>
<div class="container">

    <fieldset style="text-align: center;">
        <legend>Edit Document</legend>

        <g:form controller="document" action="update" enctype="multipart/form-data"" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" >Title:<span style="color:red;"> </span></label>
                <div class="col-sm-8 ">
                <input type="text" class="form-control" name="title" id="title" value="${document.title}">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" >Date:<span style="color:red;"> </span></label>
                <div class="col-sm-8 ">
                <input type="date" class="form-control" name="date" id="date" value="${document.date}">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" >Upload<span style="color:red;"> </span></label>
                <div class="col-sm-8 ">
                <input type="file" name="document" id="document" value="${document.document}">
                </div>
            </div>
            <button class="btn standard-button pull-right" type="submit" style="margin-right: 200px;">Update</button>
            <input type="hidden" value="${document.id}" name= "id"/>
        </g:form>
    </fieldset>
</div>



</body>
</html>