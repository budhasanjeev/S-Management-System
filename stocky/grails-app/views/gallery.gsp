<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 4/20/2016
  Time: 3:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Stocky</title>


    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.12.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'lib', file: 'jquery.mousewheel-3.0.6.pack.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'source', file: 'jquery.fancybox.pack.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'source', file: 'jquery.fancybox.css')}">




</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="thumbnail gallery-thumbnail">
                <a href="${resource(dir: 'images', file: 'deerwalk-logo.png')}" class="fancybox" rel="group">
                    <img src="${resource(dir: 'images', file: 'deerwalk-logo.png')}">
                </a>
            </div>
            <div>
                <p class="caption">Image</p>
            </div>
        </div>

    </div>

</div>


<script type="text/javascript">
    $(document).ready(function(){
        $(".fancybox").fancybox();
    });
</script>
</body>
</html>