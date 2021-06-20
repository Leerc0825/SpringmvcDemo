<%--
  Created by IntelliJ IDEA.
  User: FreezaSS
  Date: 2021/5/10
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>评论管理</title>
</head>
<body>
<form method="post" action="/admin/comment/index">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 评论管理</strong></div>
        <div class="form-group form-inline">
            <label>用户名：</label>
            <input type="text" name="username" placeholder="输入用户名">
        </div>
        <div class="form-group form-inline">
            <label>电影名：</label>
            <input type="text" name="filmName" placeholder="输入电影名">
            <button class="btn btn-info" type="button" onclick="loadData(1, 10)">查询</button>
        </div>

        <table id="datagrid-comment" class="table table-hover text-center">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>电影名称</th>
                <th>内容</th>
                <th>打分</th>
                <th>上映时间</th>
                <!-- <th>是否前台显示</th> -->
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <div id="pages">

        </div>
    </div>
</form>
</div>
</div>
</div>
<script type="text/javascript">

    $(function () {
        loadData(1, 10);
    })

    function loadData(index, size) {
        $.get(
            "/comment/search",
            {"pageNum":index,"pageSize":size,
                "username": $("input[name=username]").val(),
                "filmName": $("input[name=filmName]").val()},
            function (data) {
                $("tbody").empty();
                var list = data.list;
                for (var i = 0; i < list.length; i++) {
                    var $tr = $("<tr></tr>");
                    $tr.append("<td>" + list[i].ID + "</td>");
                    $tr.append("<td>" + list[i].user.username + "</td>");
                    $tr.append("<td>" + list[i].film.filmName + "</td>");
                    $tr.append("<td>" + list[i].content + "</td>");
                    $tr.append("<td>" + list[i].score + "</td>");
                    $tr.append("<td>" + list[i].commentTime + "</td>");
                    $tr.append("<td><button class='btn btn-danger' type='button' onclick='del(" + list[i].ID + ")'>删除</button></td>");
                    $("tbody").append($tr);
                }
                //分页实现
                pages = new Pagination({
                    element : '#pages',
                    type : 1,
                    pageIndex : data.pageNum,
                    pageSize : data.pageSize,
                    pageCount : 5,
                    total : data.total,
                    jumper : true,
                    singlePageHide : false,
                    prevText : '上一页',
                    nextText : '下一页',
                    disabled : true,
                    currentChange : function(index) {
                        loadData(index,2);// 调用函数加载数据
                        pageIndex=index;//改变页号
                    }
                });
            },
            "json"
        );

    }

    //删除函数
    function del(id) {
        if (window.confirm("你确定要删除吗")){
            $.get(
                "/comment/delete",
                {"id":id},
                function (data) {
                    alert(data.msg);
                    loadData(1, 10);
                },
                "json"
            )
        }


    }
</script>
</body>
</html>

