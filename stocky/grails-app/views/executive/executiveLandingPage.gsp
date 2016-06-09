<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 6/8/2016
  Time: 6:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
</head>
<body>
<div class="container">
    <div class="row graph">
        <fieldset>
            <legend>Top 10 Shareholders</legend>
            <img height="300px" width="400px" src="${resource(dir: 'images', file: 'pie.png')}" alt=""/>
        </fieldset>        
    </div>
    <div class="row graph">
        <div class="col-md-6">
            <fieldset>
                <legend>Share Value</legend>
                <img height="300px" width="400px" src="${resource(dir: 'images', file: 'line.png')}" alt=""/>
            </fieldset>
        </div>
        <div class="col-md-6">
            <fieldset>
                <legend>Authorized Capital</legend>
                <img height="300px" width="400px" src="${resource(dir: 'images', file: 'bar.png')}" alt=""/>
            </fieldset>
        </div>
    </div>
    <div class="row graph">
        <div class="col-md-6">
            <fieldset>
                <legend>Paid Up Capital</legend>
                <img height="300px" width="400px" src="${resource(dir: 'images', file: 'bar.png')}" alt=""/>
            </fieldset>
        </div>
        <div class="col-md-6">
            <fieldset>
                <legend>Issued Capital</legend>
                <img height="300px" width="400px" src="${resource(dir: 'images', file: 'line.png')}" alt=""/>
            </fieldset>
        </div>
    </div>
</div>
</body>
</html>