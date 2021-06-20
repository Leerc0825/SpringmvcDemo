<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/05/17
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Single</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/medile.css" rel='stylesheet' type='text/css'/>
    <link href="css/single.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/contactstyle.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/faqstyle.css" type="text/css" media="all"/>
    <!-- news-css -->
    <link rel="stylesheet" href="news-css/news.css" type="text/css" media="all"/>
    <!-- //news-css -->
    <!-- list-css -->
    <link rel="stylesheet" href="list-css/list.css" type="text/css" media="all"/>
    <!-- //list-css -->
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <!-- //font-awesome icons -->
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <!-- //js -->
    <!---<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>--->
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/owl.carousel.js"></script>
    <%--引用分页插件pagination.js--%>
    <script src="/js/pagination.js"></script>
    <link rel="stylesheet" href="/css/pagination.css"/>
    <script>
        $(document).ready(function () {
            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds

                items: 5,
                itemsDesktop: [640, 5],
                itemsDesktopSmall: [414, 4]

            });

        });
    </script>
    <script src="js/simplePlayer.js"></script>
    <script>
        $("document").ready(function () {
            $("#video").simplePlayer();
        });
    </script>

</head>

<body>
<!-- header -->
<div class="header">
    <div class="container">
        <div class="w3layouts_logo">
            <a href="index.html"><h1>One<span>Movies</span></h1></a>
        </div>
        <div class="w3_search">
            <form action="#" method="post">
                <input type="text" name="Search" placeholder="Search" required="">
                <input type="submit" value="Go">
            </form>
        </div>
        <div class="w3l_sign_in_register">
            <ul>
                <li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 123 345 653</li>
                <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //header -->
<!-- bootstrap-pop-up -->
<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                Sign In & Sign Up
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <div class="w3_login_module">
                        <div class="module form-module">
                            <div class="toggle"><i class="fa fa-times fa-pencil"></i>
                                <div class="tooltip">Click Me</div>
                            </div>
                            <div class="form">
                                <h3>Login to your account</h3>
                                <form action="#" method="post">
                                    <input type="text" name="Username" placeholder="Username" required="">
                                    <input type="password" name="Password" placeholder="Password" required="">
                                    <input type="submit" value="Login">
                                </form>
                            </div>
                            <div class="form">
                                <h3>Create an account</h3>
                                <form action="#" method="post">
                                    <input type="text" name="Username" placeholder="Username" required="">
                                    <input type="password" name="Password" placeholder="Password" required="">
                                    <input type="email" name="Email" placeholder="Email Address" required="">
                                    <input type="text" name="Phone" placeholder="Phone Number" required="">
                                    <input type="submit" value="Register">
                                </form>
                            </div>
                            <div class="cta"><a href="#">Forgot your password?</a></div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<script>
    $('.toggle').click(function () {
        // Switches the Icon
        $(this).children('i').toggleClass('fa-pencil');
        // Switches the forms
        $('.form').animate({
            height: "toggle",
            'padding-top': 'toggle',
            'padding-bottom': 'toggle',
            opacity: "toggle"
        }, "slow");
    });
    var rand = parseInt(Math.random() * (10));
    var id = ${param.id};
    $(function () {
        loadData();
        loadComment();
        loadScore();
        loadType();
    })

    function loadScore() {
        $.get("/comment/searchScore?filmId=" + id,
            function (data) {
                var five = Math.round(data.five * 1000) / 10;
                var four = Math.round(data.four * 1000) / 10;
                var three = Math.round(data.three * 1000) / 10;
                var two = Math.round(data.two * 1000) / 10;
                var one = Math.round(data.one * 1000) / 10;
                var avgScore = Math.round(data.avgScore * 10) / 10
                $("#avgScore").text(avgScore);
                $("#commentCount").text(data.comment);
                $("#five").text(five + "%");
                $("#four").text(four + "%");
                $("#three").text(three + "%");
                $("#two").text(two + "%");
                $("#one").text(one + "%");
                showStar($("div.pingfen i"),avgScore);
            },
            "json"
        );

    }

    function submitComment() {
        $.get(
            "/comment/addComment",
            {
                "userId": rand,
                "filmId": id,
                "content": $("#text1").val(),
                "score": $("[name=score]").val(),
            },
            function (data) {
                alert(data.msg);
            }
        );
        // window.location.href = "/user/single.jsp?id=" + id;
    }

    function loadData() {

        $.get(
            "/admin/film/searchById",
            {"id": id},
            function (data) {
                $("#filmName").text(data.filmName);
                $("#director").text(data.director);
                $("#screenwriter").text(data.screenwriter);
                $("#actor").text(data.actor);
                $("#type").text(data.type);
                $("#country").text(data.country);
                $("#language").text(data.language);
                var year = new Date(data.releaseDate).getFullYear();
                $("#releaseDate").text(year + "年");
                $("#filmLength").text(data.filmLength + "分钟");
                var img = "/admin/film/download?url=" + data.image;
                $("#image").attr("src", img);
            },
            "json"
        );
    }

    function loadComment(index, size) {

        $.get(
            "/comment/searchByFimId",
            {
                "filmId": id,
                "pageNum": index,
                "pageSize": size
            },
            function (data) {
                var list = data.list;
                $("#media-div").empty();
                $("#media-div").append("<div class='media' style='display: none'></div>");

                for (var i = 0; i < list.length; i++) {
                    $("#media-div").append("<div class='media'><h5>" + list[i].user.nickname + "</h5><div class='media-left'>" +
                        "<a href='#'><img src='images/user.jpg' title='One movies' alt=' '/></a></div>" +
                        "<div class='media-body'><p>" + list[i].content + "</p>" +
                        "<span>View all posts by :<a href='#'> Admin </a></span>\</div></div>")
                }
                //分页实现
                pages = new Pagination({
                    element: '#pages',
                    type: 1,
                    pageIndex: data.pageNum,
                    pageSize: data.pageSize,
                    pageCount: 5,
                    total: data.total,
                    jumper: true,
                    singlePageHide: false,
                    prevText: '上一页',
                    nextText: '下一页',
                    disabled: true,
                    currentChange: function (index) {
                        loadComment(index, 5);// 调用函数加载数据
                        loadType();
                        loadScore();
                    }
                });

            },
            "json"
        );
    }

    function loadType() {
        // alert("go")
        $.get(
            "/category/search",
            function (data) {
                var list = data.list;
                var $ul1 = $("#ul1");
                var $ul2 = $("#ul2");
                var $ul3 = $("#ul3");
                $ul1.empty();
                $ul2.empty();
                $ul3.empty();
                for (var i = 0; i < list.length; i++) {
                    if (i % 3 == 0) {
                        $ul1.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                    } else if (i % 3 == 1) {
                        $ul2.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                    } else {
                        $ul3.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                    }

                }
                $("type_li").append($ul1);
                $("type_li").append($ul2);
                $("type_li").append($ul3);
            },
            "json"
        );
    };
</script>
<!-- //bootstrap-pop-up -->
<!-- nav -->
<div class="movies_nav">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header navbar-left">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <nav>
                    <ul class="nav navbar-nav">
                        <li class="w3_home_act"><a href="index.html">首页</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <b class="caret"></b></a>
                            <ul class="dropdown-menu multi-column columns-3">
                                <li>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul1">
                                            <li><a href="genres.html">Action</a></li>
                                            <li><a href="genres.html">Biography</a></li>
                                            <li><a href="genres.html">Crime</a></li>
                                            <li><a href="genres.html">Family</a></li>
                                            <li><a href="horror.html">Horror</a></li>
                                            <li><a href="genres.html">Romance</a></li>
                                            <li><a href="genres.html">Sports</a></li>
                                            <li><a href="genres.html">War</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul2">
                                            <li><a href="genres.html">Adventure</a></li>
                                            <li><a href="comedy.html">Comedy</a></li>
                                            <li><a href="genres.html">Documentary</a></li>
                                            <li><a href="genres.html">Fantasy</a></li>
                                            <li><a href="genres.html">Thriller</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul3">
                                            <li><a href="genres.html">Animation</a></li>
                                            <li><a href="genres.html">Costume</a></li>
                                            <li><a href="genres.html">Drama</a></li>
                                            <li><a href="genres.html">History</a></li>
                                            <li><a href="genres.html">Musical</a></li>
                                            <li><a href="genres.html">Psychological</a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </li>
                        <li><a href="series.html">排行榜</a></li>
                        <li><a href="news.html">影讯&购票</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">国家/地区 <b class="caret"></b></a>
                            <ul class="dropdown-menu multi-column columns-3">
                                <li>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown">
                                            <li><a href="genres.html">Asia</a></li>
                                            <li><a href="genres.html">France</a></li>
                                            <li><a href="genres.html">Taiwan</a></li>
                                            <li><a href="genres.html">United States</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown">
                                            <li><a href="genres.html">China</a></li>
                                            <li><a href="genres.html">HongCong</a></li>
                                            <li><a href="genres.html">Japan</a></li>
                                            <li><a href="genres.html">Thailand</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown">
                                            <li><a href="genres.html">Euro</a></li>
                                            <li><a href="genres.html">India</a></li>
                                            <li><a href="genres.html">Korea</a></li>
                                            <li><a href="genres.html">United Kingdom</a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </li>
                        <li><a href="short-codes.html">Short Codes</a></li>
                        <li><a href="list.jsp">电影列表</a></li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
</div>
<!-- //nav -->
<div class="general_social_icons">
    <nav class="social">
        <ul>
            <li class="w3_twitter"><a href="#">Twitter <i class="fa fa-twitter"></i></a></li>
            <li class="w3_facebook"><a href="#">Facebook <i class="fa fa-facebook"></i></a></li>
            <li class="w3_dribbble"><a href="#">Dribbble <i class="fa fa-dribbble"></i></a></li>
            <li class="w3_g_plus"><a href="#">Google+ <i class="fa fa-google-plus"></i></a></li>
        </ul>
    </nav>
</div>
<!-- single -->
<div class="single-page-agile-main">
    <div class="container">
        <!-- /w3l-medile-movies-grids -->
        <div class="agileits-single-top">
            <ol class="breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li class="active">Single</li>
            </ol>
        </div>
        <div class="single-page-agile-info">
            <!-- /movie-browse-agile -->
            <div class="show-top-grids-w3lagile">
                <div class="col-sm-8 single-left">
                    <div class="song" id="div1">
                        <div class="song-info">
                            <h3 id="filmName">姜子牙</h3>
                        </div>
                        <div class="video-grid-single-page-agileits">
                            <div data-video="dLmKio67pVQ" id="video"><img alt=""
                                                                          class="img-responsive" id="image"/></div>
                            <div id="info">
								<span>
									<span class="pl">导演</span>：
									<span class="attrs" id="director"
                                          style='display:inline-block; width: 200px;height:20px;vertical-align: middle;overflow: hidden'>史蒂夫</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">编剧</span>：
									<span class="attrs" id="screenwriter"
                                          style='display:inline-block; width: 200px;height:20px;vertical-align: middle;overflow: hidden'>傻蛋</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">主演</span>：
									<span class="attrs" id="actor"
                                          style='display:inline-block; width: 200px;height:20px;vertical-align: middle;overflow: hidden'>雷神/小辣椒/黑寡妇</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">类型</span>：
									<span class="attrs" id="type">喜剧</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">制片国家</span>：
									<span class="attrs" id="country">美国</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">语言</span>：
									<span class="attrs" id="language">英文</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">上映日期</span>：
									<span class="attrs" id="releaseDate">2020年</span>
								</span>
                                <br/>
                                <span>
									<span class="pl">片长</span>：
									<span class="attrs" id="filmLength">111分钟</span>
								</span>
                            </div>
                            <div class="rating_wrap clearbox" rel="v:rating">
                                <div class="clearfix">
                                    <div class="rating_logo ll">网友评分</div>
                                </div>
                                <div class="rating_self clearfix" typeof="v:Rating">
                                    <strong class="ll rating_num" property="v:average" id="avgScore">8</strong>
                                    <span property="v:best" content="10.0"></span>
                                    <div class="rating_right ">
                                        <div class="block-stars pingfen">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="rating_sum">
                                            <a href="collections" class="rating_people">
                                                <span property="v:votes" id="commentCount">10402</span>人评价
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="ratings-on-weight">

                                    <div class="item">

								        <span class="stars5 starstop" title="力荐">
								            5星
								        </span>
                                        <!--<div class="power" style="width:4px"></div>-->
                                        <span class="rating_per" id="five">3.3%</span>
                                        <br>
                                    </div>
                                    <div class="item">

								        <span class="stars4 starstop" title="推荐">
								            4星
								        </span>
                                        <!--<div class="power" style="width:15px"></div>-->
                                        <span class="rating_per" id="four">12.0%</span>
                                        <br>
                                    </div>
                                    <div class="item">

								        <span class="stars3 starstop" title="还行">
								            3星
								        </span>
                                        <!--<div class="power" style="width:64px"></div>-->
                                        <span class="rating_per" id="three">49.6%</span>
                                        <br>
                                    </div>
                                    <div class="item">

								        <span class="stars2 starstop" title="较差">
								            2星
								        </span>
                                        <!--<div class="power" style="width:37px"></div>-->
                                        <span class="rating_per" id="two">29.4%</span>
                                        <br>
                                    </div>
                                    <div class="item">

								        <span class="stars1 starstop" title="很差">
								            1星
								        </span>
                                        <!--<div class="power" style="width:7px"></div>-->
                                        <span class="rating_per" id="one">5.6%</span>
                                        <br>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="film_brief" style="clear: both;"></div>
                    <div id="interest_sect_level" class="clearfix">


                    </div>
                    <div class="clearfix"></div>

                    <div class="all-comments">
                        <div class="ll j a_stars">
                            <span>打分:</span>
                            <div class="block-stars dafen">
                                <ul class="w3l-ratings">
                                    <li><a href="javascript:;"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="javascript:;"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="javascript:;"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="javascript:;"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="javascript:;"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                                <input type="hidden" name="score">
                            </div>
                        </div>
                        <div class="all-comments-info">
                            <div class="agile-info-wthree-box">
                                <form>
                                    <textarea placeholder="填写评论" required="" id="text1"></textarea>
                                    <input type="button" onclick="submitComment()" value="提交">
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                        <div class="media-grids" id="media-div">
                            <div class="media" style="display: none">
                            </div>
                            <div class="media">
                                <h5>MARK JOHNSON</h5>
                                <div class="media-left">
                                    <a href="#">
                                        <img src="images/user.jpg" title="One movies" alt=" "/>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium
                                        hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
                                    <span>View all posts by :<a href="#"> Admin </a></span>
                                </div>
                            </div>
                            <div class="media">
                                <h5>MARK JOHNSON</h5>
                                <div class="media-left">
                                    <a href="#">
                                        <img src="images/user.jpg" title="One movies" alt=" "/>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium
                                        hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
                                    <span>View all posts by :<a href="#"> Admin </a></span>
                                </div>
                            </div>
                            <div class="media">
                                <h5>MARK JOHNSON</h5>
                                <div class="media-left">
                                    <a href="#">
                                        <img src="images/user.jpg" title="One movies" alt=" "/>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium
                                        hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
                                    <span>View all posts by :<a href="#"> Admin </a></span>
                                </div>
                            </div>
                            <div class="media">
                                <h5>MARK JOHNSON</h5>
                                <div class="media-left">
                                    <a href="#">
                                        <img src="images/user.jpg" title="One movies" alt=" "/>
                                    </a>
                                </div>
                                <div class="media-body">
                                    <p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium
                                        hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
                                    <span>View all posts by :<a href="#"> Admin </a></span>
                                </div>
                            </div>

                        </div>
                        <div id="pages"></div>
                    </div>
                </div>
                <div class="col-md-4 single-right">
                    <h3>Up Next</h3>
                    <div class="single-grid-right" id="div-next">
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m1.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m2.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m3.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m4.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m5.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/c5.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author"><a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m6.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author">By <a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="single-right-grids">
                            <div class="col-md-4 single-right-grid-left">
                                <a href="single.html"><img src="images/m15.jpg" alt=""/></a>
                            </div>
                            <div class="col-md-8 single-right-grid-right">
                                <a href="single.html" class="title"> Nullam interdum metus</a>
                                <p class="author">By <a href="#" class="author">John Maniya</a></p>
                                <p class="views">2,114,200 views</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </div>


                <div class="clearfix"></div>
            </div>
            <!-- //movie-browse-agile -->
            <!--body wrapper start-->
            <div class="w3_agile_banner_bottom_grid">
                <div id="owl-demo" class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m13.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Citizen Soldier</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m11.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">X-Men</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m12.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Greater</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m7.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Light B/t Oceans</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m8.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">The BFG</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m9.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Central Intelligence</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m10.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Don't Think Twice</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m17.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Peter</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m15.jpg"
                                                                                          title="album-name"
                                                                                          class="img-responsive"
                                                                                          alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">God’s Compass</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--body wrapper end-->


        </div>
        <!-- //w3l-latest-movies-grids -->
    </div>
</div>
<!-- //w3l-medile-movies-grids -->

<!-- footer -->
<div class="footer">
    <div class="container">
        <div class="w3ls_footer_grid">
            <div class="col-md-6 w3ls_footer_grid_left">
                <div class="w3ls_footer_grid_left1">
                    <h2>Subscribe to us</h2>
                    <div class="w3ls_footer_grid_left1_pos">
                        <form action="#" method="post">
                            <input type="email" name="email" placeholder="Your email..." required="">
                            <input type="submit" value="Send">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 w3ls_footer_grid_right">
                <a href="index.html"><h2>One<span>Movies</span></h2></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-5 w3ls_footer_grid1_left">
            <p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/"
                                                                                        target="_blank" title="模板之家">模板之家</a>
                - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>
        <div class="col-md-7 w3ls_footer_grid1_right">
            <ul>
                <li>
                    <a href="genres.html">Movies</a>
                </li>
                <li>
                    <a href="faq.html">FAQ</a>
                </li>
                <li>
                    <a href="horror.html">Action</a>
                </li>
                <li>
                    <a href="genres.html">Adventure</a>
                </li>
                <li>
                    <a href="comedy.html">Comedy</a>
                </li>
                <li>
                    <a href="icons.html">Icons</a>
                </li>
                <li>
                    <a href="contact.html">Contact Us</a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });
</script>
<!-- //Bootstrap Core JavaScript -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<script src="/user/js/star.js"></script>
<!-- //here ends scrolling icon -->
</body>
</html>
