<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/30/2016
  Time: 6:29 PM
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
        <button class="btn btn-default pull-left" data-toggle="modal" data-target="#add-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Add Form</button>
    </div>

    %{--add form model--}%
    <div id="add-news-model" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #337AB7;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="color: #ffffff;">Add Form</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <legend>Add Form</legend>

                        <g:form controller="form" action="save" enctype="multipart/form-data" style="width: 81%;" class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4" >Title:<span style="color:red;"> *</span></label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="title" id="title">
                                </div>
                            </div>

                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-sm-4" >Date:<span style="color:red;"> *</span></label>--}%

                                %{--<div class="col-sm-8">--}%
                                    %{--<input type="date" class="form-control" name="date" id="date">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            <div class="form-group">
                                <label class="control-label col-sm-4" >Upload<span style="color:red;"> *</span></label>
                                <div class="col-lg-8">
                                    <input type="file" name="formDoc" id="formDoc">
                                </div>
                            </div>
                            <div>
                                <button style="margin-left: 428px" type="submit" class="btn btn-primary" id="save">Add Form</button>
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

<div id="left-news-content" class="row">


<g:each in="${formList}" var="f">

    <div class="col-lg-5 highlight" style="height: 160px;">
        <div class="col-md-4">
            <img class="user-photo img-circle" src="${createLink(controller:'form', action:'getFormImage', params: [fileName:f.formDoc])}" alt="Form"/>
        </div>
        <div class="col-md-8">
            <h2>${f.title}</h2>
            <g:link controller="form" action="downloadForm"><button>Download</button></g:link>
        </div>

    </div>

</g:each>

</div>

</div>
</body>
</html>