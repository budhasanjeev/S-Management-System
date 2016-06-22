<%--
  Created by IntelliJ IDEA.
  User: Sujan  Chauhan
  Date: 6/10/2016
  Time: 10:36 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Portfolio</title>
</head>

<body>
%{--Edit News--}%
<div class="container">

                <fieldset>
                    <legend>Edit Minutes</legend>

                    <g:form controller="minute" action="update" enctype="multipart/form-data" style="width: 81%;" class="form-horizontal">
                        <input type="hidden" name="minuteId" value="${minute.id}" />
                        <div class="form-group">
                            <label class="control-label col-sm-4" >Title:<span style="color:red;"> *</span></label>

                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="title" id="title" value="${minute.title}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-4" >Date:<span style="color:red;"> *</span></label>

                            <div class="col-sm-8">
                                <input type="date" class="form-control" name="event_date" id="date" value="${minute.event_date}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" >Upload<span style="color:red;"> *</span></label>
                            <div class="col-lg-8">
                                <input type="file" name="minuteDoc" id="minuteDoc" value="${minute.minuteDoc}">
                            </div>
                        </div>
                        <div>
                            <button style="margin-left: 428px" type="submit" class="btn standard-button" id="save">MinuteUpdate</button>
                        </div>
                    </g:form>
                </fieldset>

</div>


</body>
</html>