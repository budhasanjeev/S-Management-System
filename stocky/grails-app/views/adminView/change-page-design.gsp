<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/9/2016
  Time: 7:33 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    %{--
    <style>
    .try-nav > li > a:hover, .try-nav > li > a:focus {
        text-decoration: none;
        background-color: #ffff00;
        color: red;
    }
    </style>--}%

</head>

<body>

<div class="container">

    <g:form controller="changeDesign" action="save" method="post" enctype="multipart/form-data">
        <div class="row design-row ">
            <div class=" col-md-5 form-group design-option-left">
                <h3>Choose logo</h3>
                <input type="file" name="logo" id="logo" onchange="readURL(this)" required>
            </div>
            <div class="col-md-7 design-option-right">
                <img id="blah" src="${createLink(controller:'changeDesign', action:'getLogo', params: [fileName: session.getAttribute("logo")])}" height="82px" width="255px" alt="your image" />
            </div>
        </div>

        <div class="row design-row">
            <div class=" col-md-5 form-group design-option-left">
                <h3>Change Menu</h3>
                <div class="col-lg-3">
                    <lable class="control-label">Menu Color</lable>
                    <input  type="color" value="${session.getAttribute("menu_color")}" name="menuColor" class="form-control" id = "menuColor" onchange="changeMenuColor()">
                </div>
                <div class="col-lg-3">
                    <lable class="control-label">Text Color</lable>
                    <input type="color" value="${session.getAttribute("text_color")}" name="textColor" class="form-control" id = "menuTextColor" onchange="changeMenuTextColor()">
                </div>
                <div class="col-lg-3">
                    <lable class="control-label">Hover Color</lable>
                    <input type="color" value="${session.getAttribute("hover_color")}" name="hoverColor" class="form-control" id = "menuHoverColor" onchange="changeMenuHoverColor()">
                </div>
                <div class="col-lg-3">
                    <lable class="control-label">Hover-Text</lable>
                    <input type="color" value="${session.getAttribute("hover_text_color")}" name="hoverTextColor" class="form-control" id = "menuHoverTextColor" onchange="changeMenuHoverTextColor()">
                </div>
            </div>

            <div class="col-md-7">
                <div style="height: 6%;"></div>
                <div>
                    <ul class="nav navbar-nav try-nav" id = "menuDestination"  style="width: 100%; background-color: ${session.getAttribute("menu_color")}">
                        <li><a id = "menuTextColorDestination">Home</a></li>
                        <li><a id = "menuTextColorDestination1">Shareholder</a></li>
                        <li><a id = "menuTextColorDestination2">Event</a></li>
                        <li><a id = "menuTextColorDestination3">News</a></li>
                        <li><a id = "menuTextColorDestination4">Gallery</a></li>
                        <li><a id = "menuTextColorDestination5">About</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row design-row">
            <div class=" col-md-5 form-group design-option-left">
                <h3>Footer</h3>
                <div class="col-lg-6">
                    <lable class="control-label">Color</lable>
                    <input  type="color" value="${session.getAttribute("footer_color")}" name="footerColor" class="form-control" id = "footerColor" onchange="changeFooterColor()">
                </div>
                <div class="col-lg-6">
                    <lable class="control-label">Text Color</lable>
                    <input type="color" value="${session.getAttribute("footer_text_color")}" name="footerTextColor" class="form-control" id = "footerTextColor" onchange="changeFooterTextColor()">
                </div>
                <div class="col-md-3" style="margin-top: 5px;">
                    <lable class="control-label">Footer Text</lable>
                </div>
                <div class="col-md-12">
                    <input  type="text" class="form-control col-md-9" value="@Stocky" id = "footerText" %{--onchange="changeFooterText()"--}%>
                </div>
            </div>

            <div class="col-md-7 design-option-right">
                <div style="height: 6%;"></div>
                <div id = "footerColorDestination" style="width: 100%; background-color: ${session.getAttribute("footer_color")};height: 45px; text-align: center;">
                    <p id = "footerTextColorDestination" style="position: relative; height: 30px; color: ${session.getAttribute("footer_text_color")}; line-height: 45px;"><span id = "footerTextDestination">@Stocky</span></p>
                </div>
            </div>
        </div>

        <div class="row">
            <button class="btn standard-button pull-right standard-button">Apply</button>
        </div>
    </g:form>
</div>

<script>
    function changeMenuColor(){
        var a = $('#menuColor').val();
        $(menuDestination).css("background-color",a);
    }

    function changeMenuTextColor(){
        var b = $('#menuTextColor').val();

        $(menuTextColorDestination).css("color",b);
        $(menuTextColorDestination1).css("color",b);
        $(menuTextColorDestination2).css("color",b);
        $(menuTextColorDestination3).css("color",b);
        $(menuTextColorDestination4).css("color",b);
        $(menuTextColorDestination5).css("color",b);
    }

    function changeMenuHoverColor(){
        var a = $('#menuHoverColor').val();
        var b = $('#menuColor').val();
        $(".try-nav li a").hover(function(){
            $(this).css("background-color",a);
        },function(){
            $(this).css("background",b);
        });
    }

    function changeMenuHoverTextColor(){
        var a = $('#menuHoverTextColor').val();
        var b = $('#menuTextColor').val();
        $(".try-nav li a").hover(function(){
            $(this).css("color",a);
        },function(){
            $(this).css("color",b);
        });
    }

    function changeFooterColor(){
        var a = $('#footerColor').val();
        $(footerColorDestination).css("background-color",a);
    }

    function changeFooterTextColor(){
        var a = $('#footerTextColor').val();
        $(footerTextColorDestination).css("color",a);
    }



    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                        .attr('src', e.target.result)
                        .width(255)
                        .height(82);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

</script>


</body>
</html>