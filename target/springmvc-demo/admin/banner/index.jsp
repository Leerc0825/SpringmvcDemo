<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<div class="container">
    <form>
        <div class="form-group form-inline">
            <label>电影名称:</label>
            <input type="text" name="FilmName" placeholder="输入影片名称">
            <button type="button" class="btn btn-primary" onclick="loadData(1,5)">查询</button>
        </div>

    </form>
    <table id="datagrid-website" class="table table-striped table-hover" style='text-align:center'>
        <thead>
        <tr>
            <th>序号</th>
            <th>影片名称</th>
            <th>轮播图地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <%--显示分页插件的位置--%>
    <div id="pages"></div>
</div>


<script type="text/javascript">
    $(function () {
        loadData(1, 5);
    });

    function loadData(index, size) {
        $.get(
            "/admin/banner/search",
            {
                "pageNum": index,
                "pageSize": size,
                "filmName": $("input[name=FilmName]").val(),
                // "className": $("input[name=className]").val(),
                // "checkerName": $("input[name=checkerName]").val()
            },

            function (data) {
                $("tbody").empty();
                var list = data.list;
                for (var i = 0; i < list.length; i++) {
                    var $tr = $("<tr style='text-align:center'></tr>");
                    $tr.append("<td >" + (i + 1) + "</td>");
                    $tr.append("<td>" + list[i].filmName + "</td>");
                    $tr.append("<td><img width = '100' src = '/admin/film/download?url=" + list[i].bannerImage + "'></img></td>");
                    $tr.append($("<td><button class='btn btn-danger' onclick='deleteBanner(" + list[i].ID + ")'>删除</button>"));
                    $("tbody").append($tr);
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
                        loadData(index, 5);// 调用函数加载数据
                        pageIndex = index;//改变页号
                    }
                });
            }
        );
    }

    function deleteBanner(id) {
        if (confirm("您确定要删除吗?")) {
            var param = {};
            param.id = id;
            $.ajax({
                type: "post",
                url: '/admin/banner/delete',
                data: param,
                dataType: 'json',
                success: function (datas) {
                    if (datas == 1) {
                        alert("删除成功");
                        window.location.href = '/admin/banner/index.jsp';
                    } else {
                        alert("该轮播图禁止删除");
                    }
                }
            });
        }
    }
</script>
</body>
</html>