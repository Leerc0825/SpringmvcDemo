<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/05/18
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
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
    <link rel="stylesheet" href="css/faqstyle.css" type="text/css" media="all"/>
    <link href="css/medile.css" rel='stylesheet' type='text/css'/>
    <link href="css/single.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/contactstyle.css" type="text/css" media="all"/>
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
    <script>
        var typeName = "${param.type}";

        $(function () {
            loadType();
            loadFilmByType();
        });

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
                    $("#myTab").empty();
                    $("#myTab").append("<li role='presentation' class='active' id='main'>" +
                        "<a href='list.jsp?type ='>全部</a></li>");
                    for (var i = 0; i < list.length; i++) {
                        if (i % 3 == 0) {
                            $ul1.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                        } else if (i % 3 == 1) {
                            $ul2.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                        } else {
                            $ul3.append("<li><a href='genres.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                        }
                        if (typeName == list[i].name) {
                            $("#myTab").append("<li role='presentation' class='active'>" +
                                "<a href='list.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                            $("#main").removeAttr("class", "active");
                        } else {
                            $("#myTab").append("<li role='presentation'>" +
                                "<a href='list.jsp?type=" + list[i].name + "' >" + list[i].name + "</a></li>");
                        }
                    }
                    $("type_li").append($ul1);
                    $("type_li").append($ul2);
                    $("type_li").append($ul3);
                },
                "json"
            );
        };

        function loadFilmByType() {
            $.get(
                "/admin/film/searchByType",
                {"type": typeName},
                function (data) {
                    var list = data.list;

                    var avg =
                    $("#span-sum").text(list.length);
                    $("#film-tbody").empty();
                    for (var i = 0; i < list.length; i++) {
                        var date = new Date(list[i].releaseDate);
                        var avg = Math.round(list[i].avg * 10) / 10;
                        $("#film-tbody").append("<tr><td style='text-align: center'>" + (i + 1) + "</td><td class='w3-list-img' style='text-align: center'>" +
                            "<a href='single.jsp?id=" + list[i].ID + "'><img src='/admin/film/download?url=" + list[i].image + "' alt=''/>" +
                            "<span>" + list[i].filmName + "</span></a></td><td style='text-align: center'>" + date.getFullYear() + "</td><td style='text-align: center'>HD</td>" +
                            "<td class='w3-list-info' style='text-align: center'><a href='genres.html'>" + list[i].country + "</a></td><td class='w3-list-info' style='text-align: center'>\n" +
                            "<a href='comedy.html'>" + list[i].type + "</a></td><td style='text-align: center'>" + avg + "</td></tr>")
                    }
                }
            );
        }


    </script>
    <!-- start-smoth-scrolling -->
    <!-- tables -->
    <link rel="stylesheet" type="text/css" href="list-css/table-style.css"/>
    <link rel="stylesheet" type="text/css" href="list-css/basictable.css"/>
    <script type="text/javascript" src="list-js/jquery.basictable.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').basictable();

            $('#table-breakpoint').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint1').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint2').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint3').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint4').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint5').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint6').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint7').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint8').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint9').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint10').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint11').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint12').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint13').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint14').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint15').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint16').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint17').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint18').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint19').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint20').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint21').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint22').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint23').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint24').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint25').basictable({
                breakpoint: 768
            });
            $('#table-breakpoint26').basictable({
                breakpoint: 768
            });
        });
    </script>
    <!-- //tables -->
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
                                <li>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul1">

                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul2">

                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <ul class="multi-column-dropdown" id="ul3">

                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </li>

                        <li><a href="review.html">影评</a></li>

                        <!--<li><a href="short-codes.html">排行榜</a></li>-->
                        <li class="active"><a href="list.jsp">电影列表</a></li>
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
<!-- faq-banner -->
<div class="faq">
    <h4 class="latest-text w3_faq_latest_text w3_latest_text">选电影</h4>
    <div class="container">
        <div class="agileits-news-top">
            <ol class="breadcrumb">
                <li><a href="index.html">主页</a></li>
                <li class="active">电影列表</li>
            </ol>
        </div>
        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
            <ul id="myTab" class="nav nav-tabs" role="tablist">

            </ul>
            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span id="span-sum"></span></h4>
                        </div>
                        <table id="table-breakpoint" style="text-align: center">
                            <thead style="text-align: center">
                            <tr>
                                <th style="text-align: center">编号.</th>
                                <th style="text-align: center">电影名称</th>
                                <th style="text-align: center">上映年份</th>
                                <th style="text-align: center">清晰度</th>
                                <th style="text-align: center">国家</th>
                                <th style="text-align: center">分类</th>
                                <th style="text-align: center">打分</th>
                            </tr>
                            </thead>
                            <tbody id="film-tbody" style="text-align: center">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="a" aria-labelledby="a-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint1" style="text-align: center">
                            <thead>
                            <tr>
                                <th style="text-align:center">编号.</th>
                                <th style="text-align:center">电影名称</th>
                                <th style="text-align:center">上映年份</th>
                                <th style="text-align:center">清晰度</th>
                                <th style="text-align:center">国家</th>
                                <th style="text-align:center">分类</th>
                                <th style="text-align:center">打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt="" /> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="b" aria-labelledby="b-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>12</span></h4>
                        </div>
                        <table id="table-breakpoint2">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="c" aria-labelledby="c-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>15</span></h4>
                        </div>
                        <table id="table-breakpoint3">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="d" aria-labelledby="d-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>16</span></h4>
                        </div>
                        <table id="table-breakpoint4">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="e" aria-labelledby="e-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>9</span></h4>
                        </div>
                        <table id="table-breakpoint5">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="f" aria-labelledby="f-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>14</span></h4>
                        </div>
                        <table id="table-breakpoint6">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="g" aria-labelledby="g-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>25</span></h4>
                        </div>
                        <table id="table-breakpoint7">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="h" aria-labelledby="h-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint8">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="i" aria-labelledby="i-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>12</span></h4>
                        </div>
                        <table id="table-breakpoint9">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.htmlgenres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="j" aria-labelledby="j-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>15</span></h4>
                        </div>
                        <table id="table-breakpoint10">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="k" aria-labelledby="k-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>16</span></h4>
                        </div>
                        <table id="table-breakpoint11">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="l" aria-labelledby="l-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>14</span></h4>
                        </div>
                        <table id="table-breakpoint12">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="m" aria-labelledby="m-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>25</span></h4>
                        </div>
                        <table id="table-breakpoint13">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>18</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>19</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>20</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>21</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>22</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="n" aria-labelledby="n-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint14">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="o" aria-labelledby="o-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>12</span></h4>
                        </div>
                        <table id="table-breakpoint15">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="p" aria-labelledby="p-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>16</span></h4>
                        </div>
                        <table id="table-breakpoint16">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="q" aria-labelledby="q-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>09</span></h4>
                        </div>
                        <table id="table-breakpoint17">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="r" aria-labelledby="r-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>14</span></h4>
                        </div>
                        <table id="table-breakpoint18">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="s" aria-labelledby="s-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint19">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="t" aria-labelledby="t-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint20">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="u" aria-labelledby="u-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>12</span></h4>
                        </div>
                        <table id="table-breakpoint21">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="v" aria-labelledby="v-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>16</span></h4>
                        </div>
                        <table id="table-breakpoint22">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="w" aria-labelledby="w-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>09</span></h4>
                        </div>
                        <table id="table-breakpoint23">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="x" aria-labelledby="x-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>14</span></h4>
                        </div>
                        <table id="table-breakpoint24">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="y" aria-labelledby="y-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>17</span></h4>
                        </div>
                        <table id="table-breakpoint25">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>17</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="z" aria-labelledby="z-tab">
                    <div class="agile-news-table">
                        <div class="w3ls-news-result">
                            <h4>查询到 : <span>12</span></h4>
                        </div>
                        <table id="table-breakpoint26">
                            <thead>
                            <tr>
                                <th>编号.</th>
                                <th>电影名称</th>
                                <th>上映年份</th>
                                <th>清晰度</th>
                                <th>国家</th>
                                <th>分类</th>
                                <th>打分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n2.jpg" alt=""/> <span>001 Southside with you</span></a>
                                </td>
                                <td>2011</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">韩国</a></td>
                                <td class="w3-list-info"><a href="genres.html">戏剧</a></td>
                                <td>7.5</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n11.jpg" alt=""/> <span>12 Bad Moms</span></a>
                                </td>
                                <td>2010</td>
                                <td>SD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>6.5</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n3.jpg" alt=""/> <span>2 Sausage Party</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n4.jpg" alt=""/> <span>2.0 Morgan</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">美国</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n5.jpg" alt=""/>
                                    <span>24</span></a></td>
                                <td>2016</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">印度</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, 戏剧</a></td>
                                <td>9.0</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n6.jpg" alt=""/> <span>001 The Secret Life of Pets</span></a>
                                </td>
                                <td>2012</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">欧洲,法国</a></td>
                                <td class="w3-list-info"><a href="genres.html">惊悚, Crime, 戏剧</a></td>
                                <td>8.2</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n7.jpg" alt=""/> <span>12 Hell or High Water</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">中国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧</a></td>
                                <td>8.9</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n8.jpg" alt=""/> <span>2 Central Intelligence</span></a>
                                </td>
                                <td>2010</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n9.jpg" alt=""/> <span>3 The Jungle Book</span></a>
                                </td>
                                <td>2014</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">日本</a></td>
                                <td class="w3-list-info"><a href="genres.html">动作</a></td>
                                <td>7.1</td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n10.jpg" alt=""/> <span>01 Independence Day</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td class="w3-list-img"><a href="single.html"><img src="images/n1.jpg" alt=""/> <span>01 Ben-Hur</span></a>
                                </td>
                                <td>2013</td>
                                <td>HD</td>
                                <td class="w3-list-info"><a href="genres.html">英国</a></td>
                                <td class="w3-list-info"><a href="genres.html">喜剧, 戏剧</a></td>
                                <td>7.0</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //faq-banner -->
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
                    <a href="horror.html">动作</a>
                </li>
                <li>
                    <a href="genres.html">Adventure</a>
                </li>
                <li>
                    <a href="comedy.html">喜剧</a>
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
