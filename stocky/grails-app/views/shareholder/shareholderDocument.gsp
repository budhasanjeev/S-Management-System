<%--
  Created by IntelliJ IDEA.
  User: sanjeevbudha
  Date: 6/23/16
  Time: 7:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>
<body>
<div class="container">

    %{--add document model--}%
    <div class="row"></div>

    <g:each in="${documentInstanceList}" var="document">
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


    <g:if test="${documentInstanceList?.size() < 1}">
        <div class="alert alert-info">
            <p>no document found</p>
        </div>
    </g:if>

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