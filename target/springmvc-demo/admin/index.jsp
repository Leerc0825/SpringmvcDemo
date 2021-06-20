<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理中心-${applicationScope.bbsinfo.name}</title>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="/admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>后台管理中心</h1>
    </div>
    <div class="head-l">
        <span>欢迎 ${sessionScope.indexuser.loginname}</span>&nbsp;&nbsp;
        <a class="button button-little bg-green" href="/user/film/index.jsp"><span class="icon-home"></span> 前台首页</a>
        &nbsp;&nbsp;
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-film"></span>信息维护</h2>
    <ul style="display:block">
        <li><a href="/admin/film/index.jsp" target="right"><span class="icon-caret-right"></span>影片管理</a></li>
        <li><a href="/admin/comment/index.jsp" target="right"><span class="icon-caret-right"></span>评论管理</a></li>
        <li><a href="/admin/film/updateoradd.jsp" target="right"><span class="icon-caret-right"></span>影人管理</a>
        </li>
        <%-- <li><a href="/admin/info/index.do" target="right"><span class="icon-caret-right"></span>榜单设置</a></li> --%>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>基本设置</h2>
    <ul>
        <li><a href="/admin/link/index.jsp" target="right"><span class="icon-caret-right"></span>友情链接</a></li>
        <li><a href="/admin/bankuai/index.jsp" target="right"><span class="icon-caret-right"></span>板块管理</a></li>
        <li><a href="/admin/info/index.jsp" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
        <li><a href="/admin/banner/index.jsp" target="right"><span class="icon-caret-right"></span>轮播图设置</a></li>
        <li><a href="/admin/type/index.jsp" target="right"><span class="icon-caret-right"></span>分类设置</a></li>
    </ul>

    <h2><span class="icon-user"></span>用户管理</h2>
    <ul>
        <li><a href="/admin/user/index.jsp" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
        <!--     <li><a href="book.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>   -->
    </ul>
</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="/" target="right" class="icon-home"> 首页</a></li>
    <li><a href="#" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="/admin/film/index.jsp" name="right" width="100%"
            height="100%"></iframe>
</div>
</body>
</html>