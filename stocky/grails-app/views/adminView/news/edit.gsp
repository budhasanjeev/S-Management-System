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
                    <legend>Edit News</legend>

                    <g:form controller="news" action="update" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="news-title">Title:</label>
                            <input type="text" class="form-control" value="${news.title}" id="news-title" name="title">
                        </div>

                        <div class="form-group">
                            <label for="comment">Content:</label>
                            <textarea class="form-control" rows="5" id="comment" placeholder="" name="content">${news.content}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Photo Upload:</label>
                            <input type="file"  id="photo" name="photo" value="${news.photo}" >
                        </div>

                        <button class="btn standard-button pull-right" type="submit">Update</button>
                        <input type="hidden" value="${news.id}" name= "id"/>
                    </g:form>
                </fieldset>

</div>


</body>
</html>