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
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <title>Portfolio</title>
</head>

<body>
%{--<g:each in="${shareholderList}" var="slist" status="i">--}%
<div class="container">
    <div class="row graph">
        <fieldset>
            <div id="pie-chart-container"
                 style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
        </fieldset>
    </div>

    <div class="row graph">
        <div class="col-md-6">
            <fieldset>
                <div id="share-value-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            </fieldset>
        </div>

        <div class="col-md-6">
            <fieldset>
                <div id="authorized-capital-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            </fieldset>
        </div>
    </div>

    <div class="row graph">
        <div class="col-md-6">
            <fieldset>
                <div id="paid-up-capital-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            </fieldset>
        </div>

        <div class="col-md-6">
            <fieldset>
                <div id="issued-capital-container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
            </fieldset>
        </div>
    </div>
</div>
%{--</g:each>--}%

<script>

    $(function () {
        getShareholdersList();
        getShareValueList();
        getAuthorizedCapitalList();
        getPaidUpCapitalList();
        getIssuedCapitalList();

    });

    function getShareholdersList() {
        $.ajax({
            type: "post",
            dataType: "text",
            url: "<g:createLink controller="executive" action="getTopTenShareholders" />",
            success: function (data) {
                var shareholderList = JSON.parse(data);

                datas = [];
                for (var i = 0; i < shareholderList.shareList.length; i++) {
                    datas.push({
                        name: shareholderList.shareList[i].shareholderName,
                        y: parseInt(shareholderList.shareList[i].numberOfShares)
                    });
                }


                valuesT = [{
                    name: 'Shareholders',
                    colorByPoint: true,
                    data: datas
                }];

                $('#pie-chart-container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'Top Ten Shareholders'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: valuesT
                });
            }

        });
    }

    function getShareValueList() {
        $.ajax({
            type: "post",
            dataType: "text",
            url: "<g:createLink controller="executive" action="getShareValueList" />",
            success: function (data) {
                var shareValueList = JSON.parse(data);
                shareDatas = [];

                for (var i = 0; i < shareValueList.shareVal.length; i++) {
                    shareDatas[i] = parseInt(shareValueList.shareVal[i].shareValue);
                }

//                console.log(datas)

                shareValuesT = [{
                    name: 'Share',
                    data: shareDatas
                }];

//                console.log(valuesT)

                $('#share-value-container').highcharts({
                    title: {
                        text: 'Share Value',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: ['Share']
                    },
                    yAxis: {
                        title: {
                            text: 'Share Value Change'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: shareValuesT
                });
            }

        });
    }

    function getAuthorizedCapitalList(){
        $.ajax({
            type: "post",
            dataType: "text",
            url: "<g:createLink controller="executive" action="getAuthorizedCapitalList" />",
            success: function (data) {
                var authValueList = JSON.parse(data);
                authDatas = [];

                for (var i = 0; i < authValueList.authVal.length; i++) {
                    authDatas[i] = parseInt(authValueList.authVal[i].authorizedCapitalValue);
                }

                authValuesT = [{
                    name: 'Authorized Capital',
                    data: authDatas
                }];

//                console.log(valuesT)

                $('#authorized-capital-container').highcharts({
                    title: {
                        text: 'Authorized Capital Value',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: ['Authorized Capital']
                    },
                    yAxis: {
                        title: {
                            text: 'Authorized Capital Value Change'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#90ED7D'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: authValuesT
                });
            }

        });
    }

    function getPaidUpCapitalList(){
        $.ajax({
            type: "post",
            dataType: "text",
            url: "<g:createLink controller="executive" action="getPaidUpCapitalList" />",
            success: function (data) {
                var paidValueList = JSON.parse(data);
                paidValueDatas = [];

                for (var i = 0; i < paidValueList.paidVal.length; i++) {
                    paidValueDatas[i] = parseInt(paidValueList.paidVal[i].paidCapitalValue);
                }

                paidValuesT = [{
                    name: 'Paid Up Capital',
                    data: paidValueDatas
                }];

//                console.log(valuesT)

                $('#paid-up-capital-container').highcharts({
                    title: {
                        text: 'Paid Up Capital',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: ['Paid Up Capital']
                    },
                    yAxis: {
                        title: {
                            text: 'Paid Up Capital Value Change'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#90ED7D'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: paidValuesT
                });
            }

        });
    }

    function getIssuedCapitalList(){
        $.ajax({
            type: "post",
            dataType: "text",
            url: "<g:createLink controller="executive" action="getIssuedCapitalList" />",
            success: function (data) {
                var issuedCapitalValueList = JSON.parse(data);
                issuedCapitalValueDatas = [];

                for (var i = 0; i < issuedCapitalValueList.issuedVal.length; i++) {
                    issuedCapitalValueDatas[i] = parseInt(issuedCapitalValueList.issuedVal[i].issuedCapitalValue);
                }

                issuedCapitalValuesT = [{
                    name: 'Issued Capital',
                    data: issuedCapitalValueDatas
                }];

//                console.log(valuesT)

                $('#issued-capital-container').highcharts({
                    title: {
                        text: 'Issued Capital',
                        x: -20 //center
                    },
                    xAxis: {
                        categories: ['Paid Up Capital']
                    },
                    yAxis: {
                        title: {
                            text: 'Paid Up Capital Value Change'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#90ED7D'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ''
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: issuedCapitalValuesT
                });
            }

        });
    }


</script>
</body>
</html>