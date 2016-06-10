<script src="${resource(dir: 'js',file: 'user.js')}" type="text/javascript"></script>

<style>

.nav > li > a:hover, .nav > li > a:focus {
    text-decoration: none;
    background-color: ${session.getAttribute("hover_color")};
    color: ${session.getAttribute("hover_text_color") };
}

.nav > li > a {
    color: ${session.getAttribute("text_color") };
}


.try-nav > li > a:hover, .try-nav > li > a:focus {
    text-decoration: none;
    background-color: ${session.getAttribute("hover_color")};
    color: ${session.getAttribute("hover_text_color") };
}

.try-nav > li > a {
    color: ${session.getAttribute("text_color")};
}

.standard-button{
    background-color:  ${session.getAttribute("menu_color")};
    color:  ${session.getAttribute("text_color")};
}

.standard-button:hover{
    background-color:  ${session.getAttribute("hover_color")};
    color:  ${session.getAttribute("hover_text_color")};
}

.active {
    background-color: ${session.getAttribute("text_color")};
}

nav .active a{
    color: ${session.getAttribute("menu_color")};
}

.try a:hover{
    background-color: ${session.getAttribute("hover_color")};
    color: ${session.getAttribute("hover_text_color")};
}

.btn-primary {
    color: ${session.getAttribute("text_color")};
    background-color: ${session.getAttribute("menu_color")};
    border-color: #2e6da4;
}

.btn-primary:hover {
    color: ${session.getAttribute("hover_text_color")};
    background-color: ${session.getAttribute("hover_color")};
    border-color: #2e6da4;
}

.btn-default {
    color: ${session.getAttribute("menu_color")};
    background-color: ${session.getAttribute("text_color")};
    border-color: #ccc;
}

.btn-default:hover {
    color: ${session.getAttribute("hover_text_color")};
    background-color: ${session.getAttribute("hover_color")};
    border-color: #adadad;
}

.responsive-calendar .day.active a {
    background-color: ${session.getAttribute("menu_color")};;
    color: ${session.getAttribute("text_color")};;
}
.responsive-calendar .day.active a:hover {
    background-color: ${session.getAttribute("hover_color")};
    color: ${session.getAttribute("hover_text_color")};
}

.dropdown-content a {
    color: ${session.getAttribute("menu_color")};
}

</style>

<header class="container-fluid">

    <img id="logo-img" src="${createLink(controller:'changeDesign', action:'getLogo', params: [fileName: session.getAttribute("logo")])}">
<ul style="list-style: none; float: right; padding-top: 2%; position: relative; margin-right: 2%;">
    <sec:ifNotLoggedIn>
        <li style="float: left; margin-right: 20px; cursor: pointer;"><a data-toggle="modal" data-target="#login">Login</a> </li>
    </sec:ifNotLoggedIn>
    <g:if test="${sec.loggedInUserInfo(field: 'username')}">
        <li style="float: left; margin-right: 20px; cursor: pointer;">
            <g:link controller="logout" action="index">Logout</g:link>
        </li>
    </g:if>
<!--<li style="float: left;"><a href="#">Activate account</a> </li>-->
</ul>

<!-- Modal login -->
<div class="modal modal-fullscreen fade login-model" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="background-color: #1F69B3;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-confirm" style="border: none; margin-top: 85px;">
                <a title="Close" data-dismiss="modal"><span class="glyphicon glyphicon-remove icon-arrow-right pull-right" style="color:gold; bottom: 0px;"></span></a>
            </div>
            <div class="modal-body">
                <div style="width: 800px; padding: 20px; background-color: #eaf6f5;" class="container login-highlight">
                    <div id="login-model" class="row">
                        <div class="col-sm-6 itemCenter" style="height: 315px;">
                            <img height="145px;" style="float: right;" src="${createLink(controller:'changeDesign', action:'getLogo', params: [fileName: session.getAttribute("logo")])}">
                        </div>


                        <div class="col-sm-6 itemCenter"  style="height: 315px;">

                            <form style="float: left; position: relative; width: 100%" class="form-signin" id="loginForm" onsubmit="return validateLogin();">
                                <div class="alert alert-danger" hidden="true" id="invalid-login">
                                    <p><span class="glyphicon glyphicon-alert"/>Invalid username and/or password</p>
                                </div>

                                <h2 style="color: #226CB5;" class="form-signin-heading">Login</h2>
                                <label for="username" class="sr-only">User Name</label>
                                <input type="text" id="username" name="j_username" class="form-control" placeholder="User Name" required="">
                                <label for="inputPassword" class="sr-only">Password</label>
                                <input type="password" id="inputPassword" name="j_password" class="form-control" placeholder="Password" required="" style="margin-top: 4%;">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="remember-me" name="_spring_security_remember_me"> <span style="color: #226CB5;">Remember me</span>
                                    </label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


%{--password model--}%

<div id="changePassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #337AB7;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color: #ffffff;">Change Password</h4>
            </div>
            <div class="modal-body">
                <g:form controller="user" action="changePassword">
                    <input type="hidden" value="${session.user}" name="userId">
                    <div style="height: 260px;">
                        <div class="form-group">
                            <label >Current Password: </label>
                            <input type="password" class="form-control" name="oldPassword">
                        </div>

                        <div class="form-group">
                            <label >New Password: </label>
                            <input type="password" class="form-control" name="newPassword">
                        </div>

                        <div class="form-group">
                            <label>Conform Password: </label>
                            <input type="password" class="form-control">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-default standard-button" style="float: right;" type="submit">Change</button>
                        </div>
                    </div>
                </g:form>

            </div>
            <div class="modal-footer" style="background-color: #337AB7;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

</header>

<nav class="navbar navbar-dark bg-primary" style="border: none; background-color: ${session.getAttribute("menu_color")}">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="menu">
            <sec:ifNotLoggedIn>
                <ul class="nav navbar-nav">
                    <li><g:link controller="home" action="index">Home</g:link></li>
                    <li><g:link controller="home" action="investors">Shareholder</g:link></li>
                    <li><g:link controller="home" action="event">Event</g:link></li>
                    <li><g:link controller="home" action="news">News</g:link></li>
                    <li><g:link controller="home" action="gallery">Gallery</g:link></li>
                    <li><a href="..\stocky-login\stocky-login-about.html">About</a></li>
                </ul>
            </sec:ifNotLoggedIn>


            <sec.ifLoggedIn>

                <sec:ifAllGranted roles="ROLE_ADMIN ">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="home" action="index">Home</g:link></li>
                        <li><g:link controller="home" action="addUser">Add User</g:link></li>
                        <li><g:link controller="news" action="index">News</g:link></li>
                        <li><g:link controller="minute" action="index">Minutes</g:link></li>
                        <li><g:link controller="form" action="index">Form</g:link></li>
                        <li><g:link controller="document" action="index">Documents</g:link></li>
                        <li><g:link controller="share" action="index">Add Share</g:link></li>
                    </ul>

                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown try">
                            <a href="#" class="dropbtn">H!  ${sec.loggedInUserInfo(field: 'username').capitalize()}</a>
                            <div class="dropdown-content" style="z-index: 2000;">
                                <g:link controller="home" action="changeDesign">Edit Page Design</g:link>
                                <a data-toggle="modal" data-target="#changePassword" href="#">Change Password</a>
                            </div>
                        </li>
                    </ul>
                </sec:ifAllGranted>

                <sec:ifAnyGranted roles="ROLE_SHAREHOLDER">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="home" action="index">Home</g:link></li>
                        <li><g:link controller="home" action="news">News</g:link></li>
                        <li><g:link controller="shareholder" action="minute">Minutes</g:link></li>
                        <li><g:link controller="shareholder" action="form">Form</g:link></li>
                        <li><g:link controller="home" action="addDocuments">Documents</g:link></li>
                    </ul>

                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown try">
                            <a href="#" class="dropbtn">H!  ${sec.loggedInUserInfo(field: 'username').capitalize()}</a>
                            <div class="dropdown-content" style="z-index: 2000;">
                                <a data-toggle="modal" data-target="#changePassword" href="#">Change Password</a>
                            </div>
                        </li>
                    </ul>
                </sec:ifAnyGranted>

                <sec:ifAnyGranted roles="ROLE_EMPLOYEE">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="employee" action="index">Home</g:link></li>
                    </ul>

                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown try">
                            <a href="#" class="dropbtn">H!  ${sec.loggedInUserInfo(field: 'username').capitalize()}</a>
                            <div class="dropdown-content" style="z-index: 2000;">
                                <a data-toggle="modal" data-target="#changePassword" href="#">Change Password</a>
                            </div>
                        </li>
                    </ul>
                </sec:ifAnyGranted>

                <sec:ifAnyGranted roles="ROLE_EXECUTIVE">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="executive" action="index">Graphs</g:link></li>
                    </ul>

                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown try">
                            <a href="#" class="dropbtn">H!  ${sec.loggedInUserInfo(field: 'username').capitalize()}</a>
                            <div class="dropdown-content" style="z-index: 2000;">
                                <a data-toggle="modal" data-target="#changePassword" href="#">Change Password</a>
                            </div>
                        </li>
                    </ul>
                </sec:ifAnyGranted>
            </sec.ifLoggedIn>


        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>



<script type="text/javascript">

    function validateLogin(){

        var data = $("#loginForm").serialize()+"&ajax="+true;
        var dataUrl = "${session.postUrl}";

        $.ajax({
            url:dataUrl,
            type:"POST",
            data:data,
            success: function (data) {
                $.each(data,function(key,val){

                    if(key=='success'){
                        window.location.reload()
                    }
                    else if(key=='error'){
                        $('#invalid-login').removeAttr('hidden')
                    }
                })
            },
            error:function(err){
                console.log("error"+err)
            }

        });
        return false;
    }

    function UserUrl(){
        this.saveUserUrl = "<g:createLink controller="user" action="save"/>"
        this.deleteUserUrl = "<g:createLink controller="user" action="delete"/>"
        this.editUserUrl = "<g:createLink controller="user" action="edit"/>"
        this.updateUserUrl = "<g:createLink controller="user" action="update"/>"
        this.getUserUrl = "<g:createLink controller="user" action="index"/>"

    }

    userUrl = new UserUrl();

    $('#login').on('shown.bs.modal', function() {
        $('#username').focus();
    });

</script>
