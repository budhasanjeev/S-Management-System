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
<div class="container" style="width: 700px;">
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

%{--<div id="left-news-content" class="row">--}%


%{--<g:each in="${formList}" var="f">--}%

    %{--<div class="col-lg-5 highlight" style="height: 160px;">--}%
        %{--<div class="col-md-4">--}%
            %{--<img class="user-photo img-circle" src="${createLink(controller:'form', action:'getFormImage', params: [fileName:f.formDoc])}" alt="Form"/>--}%
        %{--</div>--}%
        %{--<div class="col-md-8">--}%
            %{--<h2>${f.title}</h2>--}%
            %{--<g:link controller="form" action="downloadForm"><button>Download</button></g:link>--}%
        %{--</div>--}%

    %{--</div>--}%

%{--</g:each>--}%

%{--</div>--}%

    <div class="row"></div>

        %{--<div class="col-lg-5 highlight minute">
            <div>
                <ul class="onHoverButton">
                    <li>
                        <button class="btn standard-button"><span class="glyphicon glyphicon-download"></span> Download</button>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 itemCenter" style="height: 100%;">
                <img style="height: 60px; width: 130px;" src="${createLink(controller:'form', action:'getFormImage', params: [fileName:f.formDoc])}" alt="Form"/>
            </div>
            <div class="col-lg-8">
                <h3></h3>
            </div>
        </div>--}%

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
            <g:each in="${formList}" var="f">
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