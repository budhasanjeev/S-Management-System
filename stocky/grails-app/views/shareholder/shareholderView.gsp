<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/24/2016
  Time: 8:56 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio</title>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.12.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'lib', file: 'jquery.mousewheel-3.0.6.pack.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'source', file: 'jquery.fancybox.pack.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'source', file: 'jquery.fancybox.css')}">

</head>

<body>

<div class="container">
<g:each in="${userInfo}" var="u">
    <div class="col-md-3" style="border-right: 1px solid #226CB5;" data-spy="affix" data-offset-top="60" data-offset-bottom="200">


        <div class="row profile-pic">

            <img style="width: 60%; height: 60%" src="${createLink(controller:'user', action:'getImage', params: [fileName:u.userImage])}">
        </div>
        <div class="row profile-table">
            <h2>${userInfo.firstName}&nbsp;${userInfo.lastName}</h2>
            <hr/>
            <table>
                <tr>
                    <td><span class="glyphicon glyphicon-home"></span></td>
                    <td><h5>${additional.city},&nbsp;${additional.district}</h5></td>
                </tr>

                <tr>
                    <td><span class="glyphicon glyphicon-earphone"></span></td>
                    <td><h5>${userInfo.mobileNumber}</h5></td>
                </tr>

                <tr>
                    <td><span class="glyphicon glyphicon-phone-alt"></span></td>
                    <td><h5>${userInfo?.landLine?:"N/A"}</h5></td>
                </tr>

                <tr>
                    <td><span class="glyphicon glyphicon-envelope"></span></td>
                    <td><h5>${userInfo?.email}</h5></td>
                </tr>
            </table>
        </div>

    </div>
    </g:each>
    <div class="col-md-8" style="float: right;">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#history" style="color: #000000; background-color: transparent;">Share History</a></li>
            <li><a data-toggle="tab" href="#documents" style="color: #000000; background-color: transparent;">Documents</a></li>
            <li><a data-toggle="tab" href="#shareValues" style="color: #000000; background-color: transparent;">Share Values</a></li>
        </ul>

        <div class="tab-content">
            <div id="history" class="tab-pane fade in active">
                <h3>Share History</h3>
                <table style="width: 100%; text-align: center;" class="table table-bordered share-history-table">
                    <thead style="color: #226CB5;">
                    <tr>
                        <th rowspan="2">Date</th>
                        <th colspan="3">Share</th>
                        <th rowspan="2">Certificate</th>
                    </tr>

                    <tr>

                        <th>Start no.</th>
                        <th>End no.</th>
                        <th>Number</th>
                        <th>Certificate Number</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${share}" var="s">
                        <tr>
                            <td>${s.purchasedDate}</td>
                            <td>${s.shareStart}</td>
                            <td>${s.shareEnd}</td>
                            <td>${s.numberOfShares}</td>
                            <td>${s.shareCertificateNumber}</td>
                            <td><g:link controller="user" action="getCertificate" params="[fileName: s.shareCertificate]" class="fancybox" rel="group"><button>view</button></g:link></td>
                        </tr>

                    </g:each>
                    </tbody>
                </table>
            </div>
            <div id="documents" class="tab-pane fade">
                <h3>Citizenship</h3>
                <div class="row">
                    <div class="col-md-3">
                        <div class="thumbnail gallery-thumbnail" style="height: 100px; width: 160px;">
                            <a href="${createLink(controller:'user', action:'getCitizenShip', params: [fileName:additional.citizenshipPhoto])}" class="fancybox" rel="group">
                                <img style="height: 100%; width: 100%;" src="${createLink(controller:'user', action:'getCitizenShip', params: [fileName:additional.citizenshipPhoto])}">
                            </a>
                        </div>
                    </div>
                </div>

                <h3>Photo of Signature</h3>
                <div class="row">
                    <div class="col-md-3">
                        <div class="thumbnail gallery-thumbnail" style="height: 100px; width: 160px;">
                            <a href="${createLink(controller:'user', action:'getSignature', params: [fileName:additional.signature])}" class="fancybox" rel="group">
                                <img style="height: 100%; width: 100%;" src="${createLink(controller:'user', action:'getSignature', params: [fileName:additional.signature])}"">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="shareValues" class="tab-pane fade">
                <h3>Current Share Values</h3>
                <div class="row" style="margin: 5%;">
                    <div class="col-md-6">
                        <h4>
                            Current Share Value
                        </h4>
                        <div class="value">
                            <h1>${shareValue}</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4>
                            Authorized Capital
                        </h4>
                        <div class="value">
                            <h1>${authorizedCapitalValue}</h1>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin: 5%;">
                    <div class="col-md-6">
                        <h4>Issued Capital
                        </h4>
                        <div class="value">
                            <h1>${issuedCapitalValue}</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4>
                            Paid Up Capital
                        </h4>
                        <div class="value">
                            <h1>${paidCapitalValue}</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    $('#myAffix').affix({
        offset: {
            top: 100,
            bottom: function () {
                return (this.bottom = $('.footer').outerHeight(true))
            }
        }
    });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        $(".fancybox").fancybox();
    });
</script>

</body>
</html>