<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户管理</title>
</head>
<body>
<form>
    <div class="panel admin-panel">
        <div class="panel-head">
            <strong class="icon-reorder"> 用户管理</strong>
        </div>
        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名称</th>
                <th>用户昵称</th>
                <th>联系方式</th>
                <th>邮箱地址</th>
                <th>性别</th>
                <th>出生日期</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

        <%--显示分页插件的位置--%>
        <div id="pages">

        </div>

    </div>
</form>
        <script type="text/javascript">
            $(function () {
                loadData(1, 10);
            });

            function loadData(index, size) {
                $.get(
                    "/user/search",
                    function (data) {
                        var userList = data.list;
                        $("tbody").empty();
                        for (var i = 0; i < userList.length; i++) {
                            var $tr = $("<tr></tr>");
                            $tr.append("<td>" + userList[i].ID + "</td>");
                            $tr.append("<td>" + userList[i].username + "</td>");
                            $tr.append("<td>" + userList[i].nickname + "</td>");
                            $tr.append("<td>" + userList[i].tel + "</td>");
                            $tr.append("<td>" + userList[i].email + "</td>");
                            $tr.append("<td>" + userList[i].sex + "</td>");
                            $tr.append("<td>" + userList[i].birthday + "</td>");
                            if (userList[i].state == 1){
                                $tr.append("<td>正常</td>");
                                $tr.append("<td><button onclick='ban(" + userList[i].ID + ")' class='btn btn-danger' type='button'>封禁</button></td>");

                            }else if (userList[i].state == 0){
                                $tr.append("<td>封禁</td>");
                                $tr.append("<td><button onclick='unban(" + userList[i].ID + ")' class='btn btn-success' type='button'>解封</button></td>");

                            }
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
                                loadData(index, size);// 调用函数加载数据
                                pageIndex = index;//改变页号
                            }
                        });
                    },
                    "json"
                );
            }

            //封禁
            function ban(id) {
                $.get(
                    "/user/setState0/" + id,
                    function (data) {
                        // alert(data.msg);
                        loadData();
                    },
                    "json"
                );
            }

            //解封
            function unban(id) {
                $.get(
                    "/user/setState1",
                    {"ID":id},
                    function (data) {
                        // alert(data.msg);
                        loadData();
                    },
                    "json"
                );
            }

        </script>

</body>
</html>
