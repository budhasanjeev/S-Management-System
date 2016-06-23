<%--
  Created by IntelliJ IDEA.
  User: sujan Chauhan
  Date: 5/30/2016
  Time: 6:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>
<body>
    <div class="container">
        <div class="row" style="display: inline-table;">
            <button class="btn btn-default pull-left" data-toggle="modal" data-target="#add-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Add Document</button>
        </div>

        %{--add document model--}%
        <div id="add-news-model" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337AB7;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: #ffffff;">Document</h4>
                    </div>
                    <div class="modal-body">

                        <fieldset>
                            <legend>Add Document</legend>

                            <g:form controller="document" action="save" enctype="multipart/form-data" style="width: 81%;"
                                    class="form-horizontal" onsubmit="return (validateDocument())">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" >Title:<span style="color:red;"> </span></label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="title" id="title">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-4" >Date:<span style="color:red;"> </span></label>

                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" name="date" id="date">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-4" >Upload<span style="color:red;"> </span></label>
                                    <div class="col-lg-8">
                                        <input type="file" name="document" id="document">
                                    </div>
                                </div>
                                <div>
                                    <button style="margin-left: 428px" type="submit" class="btn btn-primary" id="save">Add Document</button>
                                </div>
                            </g:form>
                        </fieldset>
                    </div>
                    <div class="modal-footer" style="background-color: #337AB7;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


    <div class="row"></div>

    <g:each in="${docList}" var="document">
        <div class="col-lg-5 highlight minute">
            <div>
                <ul class="onHoverButton">
                    <li>
                        <g:link controller="document" action="edit" params="[document:document.id]"> <button class="btn standard-button" data-toggle="modal" data-target="#editMinute"><span class="glyphicon glyphicon-pencil"></span> Edit</button></g:link>
                        <g:link controller="document" action="delete" params="[document: document.id]"> <button class="btn standard-button"><span class="glyphicon glyphicon-trash"></span> Delete</button></g:link>
                        <g:link controller="document" action="downloadDocument" params="[document:document.document]"> <button class="btn standard-button"><span class="glyphicon glyphicon-download"></span> Download</button></g:link>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 itemCenter" style="height: 100%;">
                <a href= "${createLink(controller:'document', action:'getDocumentImage', params: [fileName:document.document])}">
                    <img style="height: 60px; width: 130px;" src="${createLink(controller:'document', action:'getDocumentImage', params: [fileName:document.document])}/">
                </a>
            </div>
            <div class="col-lg-8">
                <h4>Title: ${document.title}</h4>

                <h5>Date: >${document.date}</h5>
            </div>
        </div>
    </g:each>





    %{--<div id="left-news-content" class="row">--}%

        %{--<g:each in="${docList}" var="document">--}%

            %{--<div class="col-md-7">--}%
                %{--<div class="news-heading">--}%
                    %{--<h1>${document.title}</h1>--}%
                %{--</div>--}%
                %{--<div class="news-para">--}%
                    %{--<p>${document.date}</p>--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<div class="col-sm-5 news-content-image">--}%
                %{--<a href= "${createLink(controller:'document', action:'getDocumentImage', params: [fileName:document.document])}">--}%
                    %{--<img style="height: 180px; width: 230px;" src="${createLink(controller:'document', action:'getFormImage', params: [fileName:document.document])}/">--}%
                %{--</a>--}%
            %{--</div>--}%
        %{--</g:each>--}%
    %{--</div>--}%


</div>
<script>
    function validateDocument(){
        var title = $('#title').val()
        var date = $('#date').val()
        var document = $('#document').val()

        if(title==""){
            alert("Please provide the title of the document")
            return false

        }else if(date==""){
            alert("Please provide the date")
            return false
        }else if(document==""){
            alert("Please attach the document")
            return false
        }
        else {
            return true
        }

    }
</script>


</body>
</html>