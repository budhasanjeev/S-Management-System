<%--
  Created by IntelliJ IDEA.
  User: Sujan  Chauhan
  Date: 4/25/2016
  Time: 5:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Portfolio</title>
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'slideinmenu.css')}">
</head>

<body>
<div align="center" style="margin-bottom:10px; overflow-x: hidden;" class="container" >
        <fieldset>
            <legend>Add Share</legend>
        </fieldset>
    <div class="col-md-6">
        <div style="margin-bottom: 5px;" id="add-shares-form" class="form">
            <g:form id="createUserForm" class="form-horizontal" enctype="multipart/form-data" name="form" controller="share" action="save" onsubmit="return validateForm();">
                <input type="hidden" id="currentShareValue" value="${session.getAttribute("shareValue")}">
                <input type="hidden" id="capitalValue" value="${session.getAttribute("paidCapitalValue")}">
                <div class="form-group">
                    <label class="control-label col-sm-4">ID:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="user_id" id="id" onchange="getName()">
                    </div>

                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4">Shareholder name:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="shareholderName" id="shareholderName">
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-4">Number of shares:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="numberOfShares" id="numberOfShare">
                        <span hidden="true" class="error-numberShare">Please enter numeric characters only</span>
                    </div>
                </div>



                <div class="form-group">
                    <label class="control-label col-sm-4">Share Start No.:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="shareStart" id="Start" onblur="getShareEnd()">
                        <span hidden="true" class="error-start">Please enter numeric characters only</span>
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-4">Share End No.:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="shareEnd" id="End">
                        <span hidden="true" class="error-end">Please enter numeric characters only</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4">Share Amount:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="shareAmount" id="shareAmount">
                        <span hidden="true" class="error-shareAmt">Please enter numeric characters only</span>

                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4">Percent:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="sharePercent" id="percent">
                        <span hidden="true" class="error-sharePercent">Please enter numeric characters only</span>
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-4">Share Certificate no.:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="shareCertificateNumber" id="certificateNum"  onchange="getCertificateNum()">
                        <span hidden="true" class="error-certificateNumber">Please enter numeric characters only</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4">Purchased Date:</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="date" name="purchasedDate" id="purchasedDate">
                    </div>
                </div>



                <div class="form-group">
                    <label class="control-label col-sm-4">Share Certificate:</label>
                    <div class="col-sm-8">
                        <input type="file" name="shareCertificate" id="shareCertificate">
                    </div>
                </div>

                <div class="col-sm-8" style="width: 100%;">
                    <button style="float: right;" type="submit" class="btn btn-primary" id="saveShare">Add </button>
                </div>
            </g:form>
        </div>
    </div>

    <div class="col-md-5">
        <div style="width: 60%" id="userPhoto">
           %{--<img id="up" src="${resource(dir: 'images',file: 'user.png')}">--}%
        </div>
    </div>

</div>


<script>

    function UserUrl() {
        this.validateName = "<g:createLink controller="user" action="getUserInfo" />"
    }

    userUrl = new UserUrl();

    function getName(){
        var id = $("#id").val();    //get the id from the field
        $.ajax({
            type:"post",
            dataType:"text",
            data:"id="+id,
            url:userUrl.validateName,
            success:function(data){
                var text = JSON.parse(data);

                $("#shareholderName").val(text.fullNames);//get shareholder name
                $("#userPhoto").html(text.link)             //get image of shareholder
            }

        });
    }

//validating add share fields
    function validateForm(){

        var numShare  = $('#numberOfShare').val();
        var numStart = $('#Start').val();
        var numEnd = $('#End').val();
        var shareAmount = $('#shareAmount').val();
        var percent = $('#percent').val();

       // var numbers = /^[0-9]+$/;

        var isCheck = true;

        if(isNaN(numShare)){
            $('.error-numberShare').attr('hidden',false)
            isCheck = false;
            }
        else {
            $('.error-numberShare').attr('hidden',true)
        }

      if(isNaN(numStart)){
           $('.error-start').attr('hidden',false)
            isCheck =false;
       }
        else{
          $('.error-start').attr('hidden',true)
      }

        if(isNaN(numEnd)){
            $('.error-end').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-end').attr('hidden',true)
        }

        if(isNaN(shareAmount)){
            $('.error-shareAmt').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-shareAmt').attr('hidden',true)
        }

        if(isNaN(percent)){
            $('.error-sharePercent').attr('hidden',false)
            isCheck = false;
        }
        else{
            $('.error-sharePercent').attr('hidden',true)
        }

        return isCheck

    }

    function getShareEnd(){

        var shareStart = $('#Start').val();
        var numberOfShare = $('#numberOfShare').val();
        var sharevalue = $('#currentShareValue').val();
        var paidCapitalValue = $('#capitalValue').val();
      //  alert(sharevalue);

        shareStart = parseInt(shareStart)
        numberOfShare = parseInt(numberOfShare)

        var totalShareValue = parseInt(sharevalue) * numberOfShare
        var shareEnd = shareStart + numberOfShare - 1;

        $('#End').val(shareEnd);
        $('#shareAmount').val(totalShareValue);
        var shareAmount = $('#shareAmount').val();
        var percent = (parseInt(shareAmount)/parseInt(paidCapitalValue)) * 100;
        alert(percent)
      //  var per = parseInt(percent);
        $('#percent').val(percent);

    }

    function getCertificateNum(){
        var shareCertificateNumber = $('#certificateNum').val()
        var numFormat = /^[0-9]+$/;

        if(shareCertificateNumber==""){
            $('.error-certificateNumber').attr('hidden',false)
            return false

        }
        else if(!shareCertificateNumber.match(numFormat)){
            $('.error-certificateNumber').attr('hidden',false)
            return false
        }
        else{
            $('.error-certificateNumber').attr('hidden',true)
            return true

        }
    }


</script>

</body>
</html>