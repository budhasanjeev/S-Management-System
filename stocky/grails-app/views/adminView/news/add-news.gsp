<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 4/25/2016
  Time: 3:42 PM
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
       <div id="add-news-model" class="modal fade" role="dialog">
           <div class="modal-dialog">

               <!-- Modal content-->
               <div class="modal-content">
                   <div class="modal-header" style="background-color: #337AB7;">
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                       <h4 class="modal-title" style="color: #ffffff;">Add News</h4>
                   </div>
                   <div class="modal-body">

                       <g:form controller="news" action="save" enctype="multipart/form-data">
                           <div class="form-group">
                               <label for="news-title">Title:</label>
                               <input type="text" class="form-control" id="news-title" name="title">
                           </div>

                           <div class="form-group">
                               <label for="comment">Content:</label>
                               <textarea class="form-control" rows="5" id="comment" name="content"></textarea>
                           </div>

                           <div class="form-group">
                               <label>Photo Upload:</label>
                               <input type="file" name="photo" id="photo">
                           </div>

                           <button class="btn btn-default" type="submit">Save</button>
                       </g:form>
                   </div>
                   <div class="modal-footer" style="background-color: #337AB7;">
                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   </div>
               </div>

           </div>
       </div>

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
                              <g:link controller="news" action="readNews" params="[id:news.id]"><li style="left: 60%; top: 7%; z-index: 1000;"><button class="btn news-button" data-toggle="modal" data-target="#read-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Read</button></g:link></li>
                               <g:link controller="news" action="edit" params="[id:news.id]"> <li style="left: 80%; top: 7%; z-index: 1000;"><button class="btn news-button" data-toggle="modal" data-target="#edit-news-model"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Edit</button></g:link></li>
                           </ul>
                       </div>
                       <a href= "${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}">
                           <img style="height: 180px; width: 100%;" src="${createLink(controller:'news', action:'getNewsImage', params: [fileName:news.photo])}">
                       </a>
                   </div>
           </div>
       </g:each>
    </div>

<script>
    function readNews(){

    }
</script>
</body>
</html>