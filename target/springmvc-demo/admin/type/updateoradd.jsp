<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>编辑分类信息</title>
    <style type="text/css">
        .occupation-box {
            border: 1px solid #ddd;
            width: 300px !important;
            height: 100px;
            padding: 20px;
        }

        .occupation-box > label {
            margin-right: 22px;
        }
    </style>
    <script type="text/javascript">


    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>添加信息</strong></div>
    <div class="body-content">
        <form method="post">
            <div class="form-group">
                <div class="label">
                    <label>类别名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="typename" size="100" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button border-main icon-check-square-o" type="button" onclick="addCategory()"> 提交
                    </button>
                    <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function addCategory() {
        var typeName = $("input[name=typename]").val();
        $.post(
            "/category/add",
            {"name": typeName},
            function (data) {
                alert(data.msg);
                window.location.href = '/admin/type/index.jsp';
            },
            "json"
        );
    }
</script>
</body>
</html>