
<html>
<head>

    <meta name="layout" content="main"/>
    <title>Stocky</title>

</head>


<body>

<div class="container">

    <g:each in="${userList}">
        <div id="my-row" class="row">
            <div class="col-md-4">
                <img class="user-photo img-circle" src="${createLink(controller:'user', action:'getImage', params: [fileName:userList.userImage])}"/>

            </div>

            <div class="col-md-8" style="text-align: left;">
                <h1>
                    ${userList.firstName.join()}
                    ${userList.lastName.join()}
                </h1>
                 ${userList.email.join()}  <br>
                  ${userList.mobileNumber.join()}
            </div>
        </div>
    </g:each>

</div>


</body>
</html>