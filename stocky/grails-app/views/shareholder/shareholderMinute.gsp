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

    %{--add news model--}%

    <div class="row"></div>

    <g:each in="${minuteInstanceList}" var="v">
        <div class="col-lg-5 highlight minute">
            <div>
                <ul class="onHoverButton">
                    <li>
                        <g:link controller="minute" action="edit" params="[id:v.id]"><button class="btn standard-button"><span class="glyphicon glyphicon-pencil"></span> Edit</button></g:link>
                        <g:link controller="minute" action="delete" params="[id:v.id]"><button class="btn standard-button"><span class="glyphicon glyphicon-trash"></span> Delete</button></g:link>
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
    <g:if test="${minuteInstanceList?.size()< 1}">
        <div class="alert alert-info">
            <p>no minutes record found</p>
        </div>
    </g:if>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        $(".fancybox").fancybox();
    });

</script>

</body>
</html>