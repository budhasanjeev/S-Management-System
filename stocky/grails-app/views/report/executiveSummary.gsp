<%--
  Created by IntelliJ IDEA.
  User: Pratik
  Date: 5/13/2016
  Time: 6:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Portfolio </title>

    <style>
        .shareholder-photo{
            height: 30px;
        }
    </style>
</head>


<body>
<div class="container" style="width: 96%">

    <div class="row">
        <div class="col-md-4">
            <h3 style="display: inline-block; margin-bottom: 0px;">Executive Summary</h3>
        </div>
        <div class="col-md-4">
            <div class="btn-group">
                <button class="btn select-btn" style="background-color: #226CB5; color: #ffffff;">${tableTypes?.capitalize()}</button>
                <button class="btn select-btn dropdown-toggle" data-toggle="dropdown" style="background-color: #226CB5;">
                    <span class="caret" style="color: #ffffff"></span>
                </button>
                <ul class="dropdown-menu select-dropdown" role="menu" aria-labelledby="dropdownMenu">
                    <li><g:link controller="report" action="executiveSummary" params="[reportType:'consolidated']" tabindex="-1">Consolidated</g:link></li>
                    <li><g:link controller="report" action="executiveSummary" params="[reportType:'individual']" tabindex="-1">Individual</g:link></li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <button style="margin: 11px;" class="btn btn-default pull-right" id="generateReport">Generate Report</button>
        </div>
    </div>


    <hr/>
    <div style="overflow-x: scroll; width: 100%;">
        <input type="hidden" value="${tableTypes}" id="form-type">
        <g:render template="${tableTypes}"/>
    </div>
</div>

%{--generate-report model--}%
<div id="filterForm" class="modal fade" role="dialog" style="width: 90%;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #337AB7;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color: #ffffff;">Generate Report</h4>
            </div>
            <div class="modal-body">
                <g:form controller="report" action="generateAll">
                    %{--<div class="col-sm-6">
                        <fieldset>
                            <legend>Choose fields</legend>
                        </fieldset>
                        <input type="checkbox" name="promoterName">Promoter's Name<br/>
                        <input type="checkbox" name="noShare">No. of Share<br/>
                        <input type="checkbox" name="investment">Investment<br/>
                        <input type="checkbox" name="from">From<br/>
                        <input type="checkbox" name="to">To<br/>
                        <input type="checkbox" name="shareCertificate">Share Certificate No.<br/>
                        <input type="checkbox" name="contactNo">Contact No.<br/>
                        <input type="checkbox" name="email">Email<br/>
                        <input type="checkbox" name="fatherName">Father's Name<br/>
                        <input type="checkbox" name="grandFatherName">Grand Father's Name<br/>
                        <input type="checkbox" name="permanentAddress">Permanent Address<br/>
                        <input type="checkbox" name="citizenshipNo">Citizenship No.<br/>
                        <input type="checkbox" name="additionalInvestment">Additional Investment<br/>
                        <select name="rType">
                            <option value="consolidated">consolidated</option>
                            <option value="individual">individual</option>
                        </select>
                    </div>--}%
                    <input type="hidden" id="rType" name="rType">
                    <div>
                        <table class="table table-striped" id="user-table">
                            <thead>
                            <tr>
                                <td>
                                    <input type="checkbox" onclick="selectAll(this)">
                                </td>
                                <td colspan="2">
                                    Select All
                                </td>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${userLists}" var="u" status="i">
                                <tr>
                                    <td><input type="checkbox" name="shareholder-name" value="${u.id}"></td>
                                    <td>${u.firstName}&nbsp;${u.lastName}</td>
                                    <td><img class="shareholder-photo img-circle" src="${createLink(controller:'user', action:'getImage', params: [fileName:u.userImage])}"/></td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <button class="btn standard-button" type="submit">Generate</button>
                </g:form>
            </div>
            <div class="modal-footer" style="background-color: #337AB7;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<script>
    $('#executive-table').dataTable();

    $('#generateReport').click(function(){
        $('#filterForm').modal();
        var data = $('#form-type')
        $('#rType').attr('value',data)
    })

    function selectAll(source) {
        checkboxes = document.getElementsByName('shareholder-name');
        for(var i=0, n=checkboxes.length;i<n;i++) {
            checkboxes[i].checked = source.checked;
        }
    }
</script>
</body>
</html>