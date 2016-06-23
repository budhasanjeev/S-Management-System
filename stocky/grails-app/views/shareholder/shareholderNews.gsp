<%--
  Created by IntelliJ IDEA.
  User: sanjeevbudha
  Date: 6/23/16
  Time: 7:59 PM
--%>

<%@ page import="stocky.News" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>

<body>

<div id="flash-news">
    <marquee><p>${marqueeList}</p></marquee>
</div>


<div class="container" style="margin-bottom: 65px;">

    <sec:ifLoggedIn>
        <div class="row" style="display: inline-table;">
            <button class="btn btn-default" data-toggle="modal" data-target="#add-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Add News</button>
        </div> <br/>
    </sec:ifLoggedIn>

%{--add news model--}%
    <g:each in="${newsInstanceList}" var="news">
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
                        <g:link controller="news" action="readNews" params="[newsId:news.id]"><li style="left: 50%;background-color: transparent;top: 7%; z-index: 1000;"><button class="btn news-button" data-toggle="modal" data-target="#read-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Read</button></g:link></li>
                        <g:link controller="news" action="edit" params="[id:news.id]"> <li style="left: 30%; top: 7%; z-index: 1000;"><button class="btn news-button" data-toggle="modal" data-target="#edit-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Edit</button></g:link></li>
                        <g:link controller="news" action="delete" params="[id:news.id]"> <li style="left: 70%; top: 7%; z-index: 1000;"><button class="btn news-button"><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;Delete</button></g:link></li>
                    </ul>
                </div>
                <a href= "${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}">
                    <img style="height: 180px; width: 100%;" src="${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}">
                </a>
            </div>
        </div>
    </g:each>
    <g:if test="${newsInstanceList?.size()<1}">
        <div class="alert alert-info">
            <p>no records found</p>
        </div>
    </g:if>
</div>

<script>
    function readNews(){

    }
</script>
</body>
</html>