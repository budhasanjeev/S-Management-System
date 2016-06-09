<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Stocky</title>

	</head>
	<body>
    <div class="container">
        <div id="my-row" class="row">
            <div id="slider" class="col-sm-8">
                <div id="wowslider-container0">
                    <div class="ws_images"><ul>
                        <li><img src="${resource(dir: 'data0/images',file: 'Baburam.png')}" alt="Baburam Bhattrai" title="Baburam Bhattrai" id="wows0_0"/></li>
                        <li><img src="${resource(dir: 'data0/images',file: 'blooddonation.jpg')}" alt="Blood Donation Program" title="Blood Donation Program" id="wows0_1"/></li>
                        <li><img src="${resource(dir: 'data0/images',file: 'group.jpg')}" alt="Group Photo" title="Group Photo" id="wows0_2"/></li>
                        <li><img src="${resource(dir: 'data0/images',file: 'JeffG.jpg')}" alt="Jeff" title="Jeff" id="wows0_3"/></li>
                        <li><img src="${resource(dir: 'data0/images',file: 'RudraP.jpg')}" alt="Rudra Pandey" title="Rudra Pandey" id="wows0_4"/></li>
                    </ul></div>
                    <div class="ws_bullets"><div>
                        <a href="#"><span>1</span></a>
                        <a href="#" ><span><2</span></a>
                        <a href="#" >3</span></a>
                        <a href="#" title="Jeff"><span>4</span></a>
                        <a href="#" title="Rudra Pandey"><span>5</span></a>
                    </div></div><div class="ws_script" style="position:absolute;left:-99%"></div>
                    <div class="ws_shadow"></div>
                </div>
            </div>
            <div class="col-sm-4">
                <!-- Responsive calendar - START -->
                <div class="responsive-calendar">
                    <div class="controls">
                        <a class="pull-left" data-go="prev"><div class="btn btn-primary">Prev</div></a>
                        <h4><span data-head-year></span> <span data-head-month></span></h4>
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
            </div>

        </div>

        <div id="my-row" class="row">

            <div class="col-md-6" id="recent-news">
                <div class="row"  style="border-bottom: 1px solid blue;">
                    <h1><a href="#news">Recent News</a></h1>
                </div>
                <div class="col-md-4">
                    <div class="home-news-heading">
                        <h3><a href="#news"><strong>Company decides to go public</strong></a></h3>
                    </div>
                    <div class="home-news-para">
                        <p>Each word in English belongs to one of the eight categories called parts of speech. If you know some English words, then you are already familiar with the parts of speech. However, learners sometimes find it difficult to figure out what part of speech a particular word is. In this lesson, we will teach you the basic rules. To start with read the paragraph given below.
                        Read more at http://www.englishpractice.com/learning/parts-speech-simplified/#x33BSYR75XPCSfRt.99</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="home-news-heading">
                        <h3><a href="#news"><strong>Stock falls</strong></a></h3>
                    </div>
                    <div class="home-news-para">
                        <p>Each word in English belongs to one of the eight categories called parts of speech. If you know some English words, then you are already familiar with the parts of speech. However, learners sometimes find it difficult to figure out what part of speech a particular word is. In this lesson, we will teach you the basic rules. To start with read the paragraph given below.
                        Read more at http://www.englishpractice.com/learning/parts-speech-simplified/#x33BSYR75XPCSfRt.99</p>                    </div>
                </div>

                <div class="col-md-4">
                    <div class="home-news-heading">
                        <h3><a href="#news"><strong>Annual report conducted</strong></a></h3>
                    </div>
                    <div class="home-news-para">
                        <p>Each word in English belongs to one of the eight categories called parts of speech. If you know some English words, then you are already familiar with the parts of speech. However, learners sometimes find it difficult to figure out what part of speech a particular word is. In this lesson, we will teach you the basic rules. To start with read the paragraph given below.
                        Read more at http://www.englishpractice.com/learning/parts-speech-simplified/#x33BSYR75XPCSfRt.99</p>                    </div>
                </div>
            </div>

            <div class="col-sm-1">

            </div>

            <div class="col-md-5" id="events">

                <div class="row"  style="border-bottom: 1px solid blue;">
                    <h1><a href="#events">Upcoming Events</a></h1>
                </div>
                <table class = "table table-striped">
                    <thead>
                    <a href="#events">
                        <tr>
                            <th>Date</th>
                            <th>Event</th>
                        </tr>
                    </a>
                    </thead>

                    <tbody>
                    <tr>
                        <td>2016/07/2</td>
                        <td>Meeting</td>
                    </tr>

                    <tr>
                        <td>2016/07/2</td>
                        <td>Meeting</td>
                    </tr>
                    <tr>
                        <td>2016/07/2</td>
                        <td>Meeting</td>
                    </tr>

                    <tr>
                        <td>2016/07/2</td>
                        <td>Meeting</td>
                    </tr>

                    <tr>
                        <td>2016/07/2</td>
                        <td>Meeting</td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </div>


    </div>

    <script type="text/javascript" src="${resource(dir: 'engine0',file: 'wowslider.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'engine0',file: 'script.js')}"></script>

    </body>
</html>
