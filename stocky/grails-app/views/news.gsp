<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 4/25/2016
  Time: 3:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.12.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'lib', file: 'jquery.mousewheel-3.0.6.pack.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'source', file: 'jquery.fancybox.pack.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'source', file: 'jquery.fancybox.css')}">

</head>

<body>

<div id="flash-news">
    <marquee><p>${marqueeList}</p></marquee>
</div>


<div class="container" style="margin-bottom: 65px;">
    <g:each in="${newsLists}" var="news">
        <div id="left-news-content" class="row" style="padding: 5px;">
            <div class="col-md-7">
                <div class="news-heading">
                    <h1>${news.title}</h1>
                </div>
                <div class="news-para">
                    <p>${news.content}</p>
                </div>
            </div>
            <div class="col-sm-5 news-content-image">
                <div>
                    <ul>
                        <li style="left: 60%; top: 7%; z-index: 1000;"><button class="btn news-button standard-button" data-toggle="modal" data-target="#edit-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Read</button></li>
                    </ul>
                </div>
                <a href= "${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}" class="fancybox" rel="group">
                    <img style="height: 180px; width: 100%;" src="${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}">
                </a>
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