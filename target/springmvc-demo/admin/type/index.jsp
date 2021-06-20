<%--
  Created by IntelliJ IDEA.
  User: Duo
  Date: 2021-05-12
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>分类管理</title>
</head>
<body>
<form>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 分类管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <a class="button border-green" href="/admin/type/updateoradd.jsp"><span
                            class="icon-edit"></span> 添加</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th>编号</th>
                <th>类型</th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true"></span></button>
                <h4 class="modal-title" id="myModalLabel">编辑影片类别</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>ID</label>
                    <input type="text" name="typeId" class="form-control" id="filmId" placeholder="ID" readonly>
                </div>
                <div class="form-group">
                    <label for="message-text" class="control-label">类别名称</label>
                    <input class="form-control" id="message-text" name="typeName">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"
                        onclick="updateCategory()"><span class="glyphicon glyphicon-floppy-disk"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        loadData(1, 10)
    });

    function loadData(index, size) {
        $.get(
            "/category/search",
            {"pageNum": index, "pageSize": size},
            function (data) {
                var categoryList = data.list;
                $("tbody").empty();
                for (var i = 0; i < categoryList.length; i++) {
                    var $tr = $("<tr></tr>");
                    $tr.append("<td>" + categoryList[i].id + "</td>");
                    $tr.append("<td>" + categoryList[i].name + "</td>");
                    $tr.append("<td>" +
                        "<button type='button' class='btn btn-info' data-toggle='modal' data-target = '#myModal' onclick='findDetail(" + categoryList[i].id + ")'>编辑</button> " +
                        "<button type='button' class='btn btn-danger' onclick='deleteCategory(" + categoryList[i].id + ")'>删除</button>" +
                        "</td>");
                    $("tbody").append($tr);
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
                }
            },
            "json"
        );
    }

    function findDetail(id) {
        $.get(
            "/category/detail",
            {"id": id},
            function (data) {
                $("#myModal input[name=typeId]").val(data.id);
                $("#myModal input[name=typeName]").val(data.name);
            },
            "json"
        );
    }

    function updateCategory() {
        var typeId = $("#myModal input[name=typeId]").val();
        var typeName = $("#myModal input[name=typeName]").val();
        $.get(
            "/category/update",
            {"id": typeId, "name": typeName},
            function (data) {
                alert(data.msg);
                loadData(1,10);
            },
            "json"
        );
    }

    function deleteCategory(id) {
        if (window.confirm("你确定要删除吗")) {
            $.post(
                "/category/delete",
                {"id": id},
                function (data) {
                    alert(data.msg);
                },
                "json"
            );
        }
    }
</script>
</body>
</html>
