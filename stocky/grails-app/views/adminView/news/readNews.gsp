<%--
  Created by IntelliJ IDEA.
  User: Sujan  Chauhan
  Date: 6/10/2016
  Time: 11:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Portfolio</title>
</head>

<body>
<div class="container">
    <h1> ${newsInstance?.title}</h1>
    <div class="row">
        <div class="col-md-4">
            <img style="height: 380px; width: 100%;" src="${createLink(controller:'news', action:'getNewsImage', params: [fileName:newsInstance.photo])}">
        </div>
        <div class="col-md-8">
            ${newsInstance?.content}
        </div>
    </div>
</div>
</body>
</html>