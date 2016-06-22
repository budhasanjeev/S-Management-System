<%--
  Created by IntelliJ IDEA.
  User: Prabina
  Date: 5/4/2016
  Time: 7:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
    <script src="${resource(dir: 'js',file: 'app-script.js')}" type="text/javascript"></script>


    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.12.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'lib', file: 'jquery.mousewheel-3.0.6.pack.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'source', file: 'jquery.fancybox.pack.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'source', file: 'jquery.fancybox.css')}">


</head>

<body>
<div class="container">
    <div class="row" style="display: inline-table;">
        <button class="btn btn-default pull-left" data-toggle="modal" data-target="#addMinute"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Add Minute</button>
    </div>

    %{--add news model--}%
    <div id="addMinute" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: ${session.getAttribute("menu_color")}">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="color: #ffffff;">Minute</h4>
                </div>
                <div class="modal-body">

                    <fieldset>
                        <legend>Add Minute</legend>

                        <g:form controller="minute" action="save" enctype="multipart/form-data" style="width: 81%;" class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4" >Title:<span style="color:red;"> *</span></label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="title" id="title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4" >Date:<span style="color:red;"> *</span></label>

                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="event_date" id="date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4" >Upload<span style="color:red;"> *</span></label>
                                <div class="col-lg-8">
                                    <input type="file" name="minuteDoc" id="minuteDoc">
                                </div>
                            </div>
                            <div>
                                <button style="margin-left: 428px" type="submit" class="btn standard-button" id="save">Add Minute</button>
                            </div>
                        </g:form>
                    </fieldset>
                </div>
                <div class="modal-footer" style="background-color: ${session.getAttribute("menu_color")}">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row"></div>

<g:each in="${minutesList}" var="v">
        <div class="col-lg-5 highlight minute">
            <div>
                <ul class="onHoverButton">
                    <li>
                        <g:link controller="minute" action="edit" params="[id:v.id]"><button class="btn standard-button"><span class="glyphicon glyphicon-pencil"></span> Edit</button></g:link>
                        <button class="btn standard-button"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                    </li>
                </ul>
            </div>
            <div class="col-md-4 itemCenter" style="height: 100%;">
                <a href= "${createLink(controller:'user', action:'getMinute', params: [fileName:v.minuteDoc])}" class="fancybox" rel="group">
                    <img style="height: 60px; width: 130px;" src="${createLink(controller:'user', action:'getMinute', params: [fileName:v.minuteDoc])}">
                </a>
            </div>
            <div class="col-lg-8">
                <input type="hidden" value="${v.id}" id="v_${v.id}">
                <h4 id="title_${v.id}" >Title: ${v.title}</h4>
                <h5 id="date_${v.event_date}">Date: ${v.event_date}</h5>
            </div>
        </div>
</g:each>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        $(".fancybox").fancybox();
    });

</script>

</body>
</html>