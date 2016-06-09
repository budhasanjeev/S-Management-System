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
</head>

<body>
<div class="container">
    %{--add news model--}%

    <div class="row"></div>

    <g:each in="${1..10}">
        <div class="col-lg-5 highlight" >
            <div class="col-md-4" style="display: inline-table;">
                <img  style="height: 60px; width: 130px; margin-top: 12px; display: table-cell; vertical-align: middle;" src="${resource(dir: 'images', file: 'user.png')}">
            </div>
            <div class="col-lg-7" style="display: inline-table;">
                <div style="display: table-cell; vertical-align: middle;">
                    <h3>Title</h3>
                    <h5>5/26/2016</h5>
                </div>
            </div>
        </div>
    </g:each>
</div>
</body>
</html>