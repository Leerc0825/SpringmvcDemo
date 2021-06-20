<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/05/17
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">
<head>
    <title>General</title>
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
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <!-- //font-awesome icons -->
    <!-- news-css -->
    <link rel="stylesheet" href="news-css/news.css" type="text/css" media="all"/>
    <!-- //news-css -->
    <!-- list-css -->
    <link rel="stylesheet" href="list-css/list.css" type="text/css" media="all"/>
    <!-- //list-css -->
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <%--引用分页插件pagination.js--%>
    <script src="/js/pagination.js"></script>
    <link rel="stylesheet" href="/css/pagination.css"/>
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

    <script>
        var typeName = "${param.type}";
        $(function () {
            $("h4[class=latest-text]").text(typeName + "类影片");
            loadFilmListByType(1, 23);
            loadType();

        });

        function loadFilmListByType(index, size) {

            $.get(
                "/admin/film/searchByType",
                {
                    pageNum: index,
                    pageSize: size,
                    type: typeName
                },
                function (data) {
                    var list = data.list;
                    $("#div1").empty();
                    $("#owl-demo").empty();
                    for (var i = 0; i < list.length; i++) {
                        var date = new Date(list[i].releaseDate);
                        $("#div1").append("<div class='col-md-2 w3l-movie-gride-agile'><a href='single.jsp?id=" + list[i].ID + "' class='hvr-shutter-out-horizontal'>\n" +
                            "<img src='/admin/film/download?url=" + list[i].image + " ' title='album-name' alt=' '/>\n" +
                            "<div class='w3l-action-icon'>\n" +
                            "<i class='fa fa-play-circle' aria-hidden='true'></i></div></a><div class='mid-1'>\n" +
                            "<div class='w3l-movie-text'>\n" +
                            "<h6><a href='single.jsp?id=" + list[i].ID + "'>" + list[i].filmName + "</a></h6></div><div class='mid-2'>\n" +
                            "<p>" + date.getFullYear() + "</p><div class='block-stars'><ul class='w3l-ratings'>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star-half-o' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star-o' aria-hidden='true'></i></a></li>\n" +
                            "</ul></div><div class='clearfix'></div></div></div><div class='ribben two'>\n" +
                            "<p>NEW</p></div></div>");
                        $("#owl-demo").append("<div class='item'><div class='w3l-movie-gride-agile w3l-movie-gride-agile1'>\n" +
                            "<a href='single.jsp?id=" + list[i].ID + "' class='hvr-shutter-out-horizontal'><img src='/admin/film/download?url=" + list[i].image + " ' title='album-name' class='img-responsive' alt=' '/>\n" +
                            "<div class='w3l-action-icon'><i class='fa fa-play-circle' aria-hidden='true'></i></div></a><div class='mid-1 agileits_w3layouts_mid_1_home'>\n" +
                            "<div class='w3l-movie-text'><h6><a href='single.jsp?id=" + list[i].ID + "'>" + list[i].filmName + "</a></h6></div><div class='mid-2 agile_mid_2_home'>\n" +
                            "<p>" + date.getFullYear() + "</p><div class='block-stars'><ul class='w3l-ratings'>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star' aria-hidden='true'></i></a></li>\n" +
                            "<li><a href='#'><i class='fa fa-star-half-o' aria-hidden='true'></i></a>\n" +
                            "</li></ul></div><div class='clearfix'></div></div></div><div class='ribben'><p>NEW</p></div></div></div>");
                    }
                    $("#owl-demo").owlCarousel({

                        autoPlay: 3000, //Set AutoPlay to 3 seconds

                        items: 5,
                        itemsDesktop: [640, 5],
                        itemsDesktopSmall: [414, 4]

                    });
                    $("#div1").append("<div class='clearfix'></div>");
                    //分页实现
                    pages = new Pagination({
                        element: '#pages',
                        type: 1,
                        pageIndex: data.pageNum,
                        pageSize: data.pageSize,
                        pageCount: 23,
                        total: data.total,
                        jumper: true,
                        singlePageHide: false,
                        prevText: '上一页',
                        nextText: '下一页',
                        disabled: true,
                        currentChange: function (index) {
                            loadFilmListByType(index, 23);// 调用函数加载数据
                        }
                    });
                },
                "json"
            );
        };

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
    <script>
        $(document).ready(function () {


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
                <li><i class="fa fa-phone" aria-hidden="true"></i> (+86)130 5291 0086</li>
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
                        <li><a href="index.html">首页</a></li>
                        <li><a href="news.html">影讯&amp;购票</a></li>
                        <li><a href="series.html">排行榜</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <b class="caret"></b></a>
                            <ul class="dropdown-menu multi-column columns-3">
                                <li class="active">
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul1">
                                            <!--<li><a href="genres.html">动作</a></li>
                                            <li><a href="genres.html">传记</a></li>
                                            <li><a href="genres.html">犯罪</a></li>
                                            <li><a href="genres.html">家庭</a></li>
                                            <li><a href="horror.html">恐怖</a></li>
                                            <li><a href="genres.html">浪漫</a></li>
                                            <li><a href="genres.html">体育</a></li>
                                            <li><a href="genres.html">战争</a></li>-->
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul2">
                                            <!-- <li><a href="genres.html">冒险</a></li>
                                             <li><a href="comedy.html">喜剧</a></li>
                                             <li><a href="genres.html">纪录片</a></li>
                                             <li><a href="genres.html">奇幻</a></li>
                                             <li><a href="genres.html">惊悚</a></li>-->
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul3">
                                            <!--<li><a href="genres.html">动画</a></li>
                                            <li><a href="genres.html">服装</a></li>
                                            <li><a href="genres.html">剧情</a></li>
                                            <li><a href="genres.html">历史</a></li>
                                            <li><a href="genres.html">音乐</a></li>
                                            <li><a href="genres.html">心理</a></li>-->
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </li>

                        <li><a href="review.html">影评</a></li>

                        <!--<li><a href="short-codes.html">排行榜</a></li>-->
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
<!-- /w3l-medile-movies-grids -->
<div class="general-agileits-w3l">
    <div class="w3l-medile-movies-grids">

        <!-- /movie-browse-agile -->

        <div class="movie-browse-agile">
            <!--/browse-agile-w3ls -->
            <div class="browse-agile-w3ls general-w3ls">
                <div class="tittle-head">
                    <h4 class="latest-text">家庭类影片 </h4>
                    <div class="container">
                        <div class="agileits-single-top">
                            <ol class="breadcrumb">
                                <li><a href="index.html">主页</a></li>
                                <li class="active">分类</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="browse-inner" id="div1">
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m7.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Light B/t Oceans</a></h6>
                                </div>
                                <div class="mid-2">

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
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m8.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">The BFG</a></h6>
                                </div>
                                <div class="mid-2">

                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>


                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m9.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Central Intelligence</a></h6>
                                </div>
                                <div class="mid-2">

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
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m10.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Don't Think Twice</a></h6>
                                </div>
                                <div class="mid-2">

                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>


                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m11.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">X-Men</a></h6>
                                </div>
                                <div class="mid-2">

                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>


                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>
                        <div class="col-md-2 w3l-movie-gride-agile">
                            <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m12.jpg"
                                                                                          title="album-name" alt=" "/>
                                <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Greater</a></h6>
                                </div>
                                <div class="mid-2">

                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>


                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                            <div class="ribben two">
                                <p>NEW</p>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
            <!--//browse-agile-w3ls -->
            <div class="blog-pagenat-wthree">
                <%--                <ul>--%>
                <%--                    <li><a class="frist" href="#">Prev</a></li>--%>
                <%--                    <li><a href="#">1</a></li>--%>
                <%--                    <li><a href="#">2</a></li>--%>
                <%--                    <li><a href="#">3</a></li>--%>
                <%--                    <li><a href="#">4</a></li>--%>
                <%--                    <li><a href="#">5</a></li>--%>
                <%--                    <li><a class="last" href="#">Next</a></li>--%>
                <%--                </ul>--%>
                <div id="pages"></div>
            </div>
        </div>
        <!-- //movie-browse-agile -->
        <!--body wrapper start-->
        <!--body wrapper start-->
        <div class="review-slider">
            <h4 class="latest-text">Movie Reviews</h4>
            <div class="container">
                <div class="w3_agile_banner_bottom_grid">
                    <div id="owl-demo" class="owl-carousel owl-theme">
                        <div class="item">
                            <div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
                                <a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m13.jpg"
                                                                                              title="album-name"
                                                                                              class="img-responsive"
                                                                                              alt=" "/>
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i>
                                    </div>
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
        </div>
    </div>
    <!-- //w3l-medile-movies-grids -->
</div>
<!-- //comedy-w3l-agileits -->
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
<!-- //here ends scrolling icon -->
</body>
</html>
