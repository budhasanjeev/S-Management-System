

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>

    <link rel="stylesheet" href="${resource(dir: 'css',file: 'slideinmenu.css')}">
</head>


<body>

%{--mail model--}%
<div id="mailModel" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #337AB7;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color: #ffffff;">Email</h4>
            </div>
            <div class="modal-body">

                <g:form controller="mail" action="sendMail" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>To:</label>
                        <input type="text" class="form-control" id="to" name="to">
                    </div>

                    <div class="form-group">
                        <label>Subject:</label>
                        <input type="text" class="form-control" id="subject" name="subject">
                    </div>

                    <div class="form-group">
                        <label>Body</label>
                        <textarea class="form-control" rows="5" id="content" name="content"></textarea>
                    </div>

                    <button class="btn btn-default" type="submit">Send</button>
                </g:form>
            </div>
            <div class="modal-footer" style="background-color: #337AB7;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>




<div class="container" style="overflow-x: hidden;">
    %{--<div  style="display: inline-flex;">--}%
    <div class="col-md-8 highlight" style="padding: 2%;">
        <div class="row" style="margin-top: 3%; margin-bottom: 2%;">
            <div class="col-md-6">
                <div class="col-md-3" style="display: inline-table;">
                    <h2 style="display: table-cell; vertical-align: middle">${shareholderLists?.size()}</h2>
                </div>
                <div class="col-md-9">
                    <div class="navbar-menu dropdown" style="display: inline-block;">

                        <div class="btn-group">
                            <button class="btn select-btn" style="background-color: ${session.getAttribute("menu_color")}; color: ${session.getAttribute("text_color")}">${role}</button>
                            <button class="btn select-btn dropdown-toggle" data-toggle="dropdown" style="background-color: ${session.getAttribute("menu_color")};">
                                %{--<button class="btn select-btn" style="background-color: #226CB5; color: #ffffff;">${role}</button>
                            <button class="btn select-btn dropdown-toggle" data-toggle="dropdown" style="background-color: #226CB5;">--}%
                                <span class="caret" style="color: ${session.getAttribute("text_color")}"></span>

                            </button>
                            <ul class="dropdown-menu select-dropdown" role="menu" aria-labelledby="dropdownMenu">
                                <li><g:link controller="user" action="filterUser" id="ROLE_SHAREHOLDER" tabindex="-1">Shareholder</g:link></li>
                                <li><g:link controller="user" action="filterUser" id="ROLE_EXECUTIVE" tabindex="-1">Executive</g:link></li>
                                <li><g:link controller="user" action="filterUser" id="ROLE_EMPLOYEE" tabindex="-1">Employee</g:link></li>
                                <li><g:link controller="user" action="filterUser" id="ROLE_ADMIN" tabindex="-1">Admin</g:link></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <table class="table table-striped" id="user-table">
                <thead>
                <tr>
                    <th style="width: 20%">Photo</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${shareholderLists}" var="s">
                    <tr>
                        <td>
                            <g:if test="${s.userImage}">

                         <g:link controller="shareholder" action="index" params="[user_id: s.id]"><img class="user-photo img-circle" src="${createLink(controller:'user', action:'getImage', params: [fileName:s.userImage])}"/></g:link>
                            </g:if>
                            <g:else>
                                <img class="user-photo img-circle" src="${resource(dir: 'images',file: 'deerwalk-logo.png')}">
                            </g:else>
                        </td>
                        <td style="vertical-align: middle;">${s.firstName} ${s.lastName}</td>
                        <td style="vertical-align: middle;">${s.mobileNumber}</td>
                        <td style="vertical-align: middle;">
                            <input type="hidden" value="${s.email}" id="${s.id}">
                            <span style="color: #337AB7;" class="glyphicon glyphicon-envelope" onclick="javascript:getIndModelMail(${s.id})"></span>
                            <g:link controller="user" action="editSave" params="[user_id:s.id]"><i class="glyphicon glyphicon-pencil"></i> </g:link>
                            <g:link controller="user" action="delete" params="[user_id:s.id]"><i class="glyphicon glyphicon-trash"></i></g:link>
                         </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-md-1"></div>

    <div class="col-md-3">
        <div class="row slideinmenu">
            <nav>
                <ul class="list-unstyled main-menu">
                    <!--Include your navigation here-->
                    <li class="text-right"><a href="#" id="nav-close" style="color: #000000; background-color: #ffffff; width: 50px;">X</a></li>
                    <!--shareholder menu -->
                    <li><a href="#" title="Enter Share Value" data-toggle="popover" data-placement="left" data-container="body" type="button" data-html="true" >Update Share Value</a></li>
                    <div id="popover-content" class="hide" style="text-align: center;" >
                        <g:form class="form-inline" style="width: 100%;" controller="shareValue" action="save">
                            <div class="form-group">
                                <input type="text" placeholder="Sharevalue" class="form-control" name="shareValue" id="shareValue" style="margin: 5px;" required="true">
                                <button type="submit" class="btn btn-primary" style="float: right;">Update</button>
                            </div>
                        </g:form>
                    </div>

                    <li><a href="#" title="Authorized Capital" data-toggle="popover1" data-placement="left" data-container="body" type="button" data-html="true" >Authorized Capital</a></li>
                    <div id="popover-content1" class="hide" style="text-align: center;" >
                        <g:form class="form-inline" role="form" style="width: 100%;" controller="authorizedCapitalValue" action="save">
                            <div class="form-group">
                                <input type="text" placeholder="authorized-capital" class="form-control" name="authorizedCapitalValue" id="authorizedCapitalValue" style="margin: 5px;" required="true">
                                <button type="submit" class="btn btn-primary" style="float: right;">Update</button>
                            </div>
                        </g:form>
                    </div>
                    <li><a href="#" title="Issued Capital" data-toggle="popover2" data-placement="left" data-container="body" type="button" data-html="true" >Issued Capital</a></li>
                    <div id="popover-content2" class="hide" style="text-align: center;" >
                        <g:form class="form-inline" role="form" style="width: 100%;" controller="issuedCapitalValue" action="save">
                            <div class="form-group">
                                <input type="text" placeholder="Issued Capital" class="form-control" name="issuedCapitalValue" id="issuedCapitalvalue" style="margin: 5px;" required="true">
                                <button type="submit" class="btn btn-primary" style="float: right;">Update</button>
                            </div>
                        </g:form>
                    </div>
                    <li><a href="#" title="PaidCapital" data-toggle="popover3" data-placement="left" data-container="body" type="button" data-html="true" >Paid up Capital</a></li>
                    <div id="popover-content3" class="hide" style="text-align: center;" >
                        <g:form class="form-inline" role="form" style="width: 100%;" controller="paidCapitalValue" action="save">
                            <div class="form-group">
                                <input type="text" placeholder="Paid Up Capital" class="form-control" name="paidCapitalValue" id="paidCapitalValue" style="margin: 5px;" required="true">
                                <button type="submit" class="btn btn-primary" style="float: right;">Update</button>
                            </div>
                        </g:form>
                    </div>
                    <li><g:link controller="report" action="executiveSummary" params="[reportType:'individual']">Executive Summery</g:link></li>
                    <li><a><span onclick="javascript:getGroupModelMail()">Email All</span></a></li>
                </ul>
            </nav>
            <button class="btn select-btn nav-expander fixed standard-button" style="margin-top: 7%;" id="nav-expander">
                MENU &nbsp;<i class="fa fa-bars fa-lg white"></i>
            </button>
        </div>

        <div class="row" style="text-align: center; margin-bottom: 10%; margin-top: 5%;">
            <h3>
                Current Share Value
            </h3>
            <div class="value">
                    <h1><g:formatNumber number="${shareValue?:00}" format="#,##,##,###.00"/></h1>
            </div>
        </div>


        <div class="row" style="text-align: center; margin-bottom: 10%; margin-top: 5%;">
            <h3>
               Authorized Capital
            </h3>
            <div class="value">
                <h1><g:formatNumber number="${authorizedCapitalValue?:00}" format="#,##,##,###.00"/></h1>
            </div>
        </div>

        <div class="row" style="text-align: center; margin-bottom: 10%; margin-top: 5%;">
            <h3>Issued Capital
            </h3>
            <div class="value">
                <h1><g:formatNumber number="${issuedCapitalValue?:00}" format="#,##,##,###.00"/></h1>
            </div>
        </div>

        <div class="row" style="text-align: center; margin-bottom: 10%; margin-top: 13%;">
            <h3>
                Paid Up Capital
            </h3>
            <div class="value">
                <h1><g:formatNumber number="${paidCapitalValue?:00}" format="#,##,##,###.00"/></h1>
            </div>
        </div>
    </div>
</div>
%{--</div>--}%

<!-- Javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script>window.jQuery || document.write('<script src="${resource(dir: 'js', file: 'jquery-1.12.0.min.js')}"><\/script>')</script>
<script src="${resource(dir: 'js', file: 'jquery.navgoco.js')}"></script>

<script>
    function getIndModelMail(id)
    {
        var userEmail = document.getElementById(id).value
        $('#mailModel').modal('show');

        $('#to').attr("value",userEmail)

    }
    function getGroupModelMail(id)
    {
        var userEmail= "_protfolio@deerwalk.edu.np"
        $('#mailModel').modal('show');

        $('#to').attr("value",userEmail)

    }
    $(document).ready(function(){

        // close popover

        $('#user-table').dataTable({
            "lengthMenu":[[6,12,24,-1],[6,12,24,"All"]]
        })
        /***** Dismiss all popovers by clicking outside, don't dismiss if clicking inside the popover content  **************/

        $('html').on('click', function(e) {
            if (typeof $(e.target).data('original-title') == 'undefined' &&
                    !$(e.target).parents().is('.popover.in')) {
                $('[data-original-title]').popover('hide');
            }
        });

        //Navigation Menu Slider
        $('#nav-expander').on('click',function(e){
            e.preventDefault();
            $('body').toggleClass('nav-expanded');
        });
        $('#nav-close').on('click',function(e){
            e.preventDefault();
            $('body').removeClass('nav-expanded');
        });


        // Initialize navgoco with default options
        $(".main-menu").navgoco({
            caret: '<span class="caret"></span>',
            accordion: false,
            openClass: 'open',
            save: true,
            cookie: {
                name: 'navgoco',
                expires: false,
                path: '/'
            },
            slide: {
                duration: 300,
                easing: 'swing'
            }
        });


//    });
//    $(document).ready(function(){
        $('[data-toggle="popover"]').popover({
            html: true,
            content: function() {
                return $('#popover-content').html();
            }
        });

        $('[data-toggle="popover1"]').popover({
            html: true,
            content: function() {
                return $('#popover-content1').html();
            }
        });

        $('[data-toggle="popover2"]').popover({
            html: true,
            content: function() {
                return $('#popover-content2').html();
            }
        });
        $('[data-toggle="popover3"]').popover({
            html: true,
            content: function() {
                return $('#popover-content3').html();
            }
        });


        $(function(){

            $(".select-dropdown li a").click(function(){

                $(".select-btn:first-child").text($(this).text());
                $(".select-btn:first-child").val($(this).text());

            });
        });
    });


    function validateShare(){
        alert("hello Anju");

        var shareValue = $('#shareV').serialize();
        alert(shareValue)
        return false;
    }
</script>
</body>
</html>