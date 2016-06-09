<html>
<head>
    <meta name="layout" content="main"/>
    <title>Stocky</title>
</head>

<body>

<div class="container">
    <!-- Responsive calendar - START -->

    <div id="my-row" class="row">
        <div  class="col-md-2"></div>
        <div class="col-md-8"><div class="responsive-calendar">
            <div class="controls">
                <a class="pull-left" data-go="prev"><div class="btn btn-primary">Prev</div></a>
                <h4><span data-head-year></span> <span data-head-month></span><span data-head-date></span></h4>
                <a class="pull-right" data-go="next"><div class="btn btn-primary">Next</div></a>
            </div><hr/>
            <div class="day-headers">
                <div class="day header">Mon</div>
                <div class="day header">Tue</div>
                <div class="day header">Wed</div>
                <div class="day header">Thu</div>
                <div class="day header">Fri</div>
                <div class="day header">Sat</div>
                <div class="day header">Sun</div>
            </div>
            <div class="days" data-group="days">

            </div>
        </div>
            <!-- Responsive calendar - END -->
            <script type="text/javascript">
                $(document).ready(function () {
                    $(".responsive-calendar").responsiveCalendar({

                        events: {
                            "2016-04-30": {"number": 2, "url": "#thirty"},
                            "2016-04-26": {"number": 1, "url": "#twintysix"},
                            "2016-05-03": {"number": 1, "url": "#three"},
                            "2013-06-12": {}
                        }
                    });
                });
            </script>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div id="my-row" class="row">
        <div id="thirty" class="col-md-4">
            <h3>Event of April 30</h3>
            <p>Meeting with this this this</p>
        </div>
        <div style="border-right: 1px solid #000000; border-left: 1px solid #000000;" id="twintysix" class="col-md-4">
            <h3>Event of April 26</h3>
            <p>Meeting with this this this</p>
        </div>
        <div id="three" class="col-md-4">
            <h3>Event of May 3</h3>
            <p>Meeting with this this this</p>
        </div>
    </div>
</div>

<script src="${resource(dir: 'calender',file: 'jquery.js')}"></script>
<script src="${resource(dir: 'calender',file: 'responsive-calendar.js')}"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".responsive-calendar").responsiveCalendar({

//
            events: {
                "2016-04-30": {"number": 2, "url": "stocky-login-events.html"},
                "2016-04-26": {"number": 1, "url": "stocky-login-events.html"},
                "2016-05-03": {"number": 1, "url": "stocky-login-events.html"},
                "2013-06-12": {}
            }

        });
    });
</script>

</body>
</html>