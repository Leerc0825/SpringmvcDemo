<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/04/27
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录系统</title>
</head>
<body>
<form>
    <input type="text" name="username" placeholder="输入账号">
    <input type="text" name="password" placeholder="输入密码">
    <button id="btn-login" type="button" onclick="login()">登录</button>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function login() {
        var user = {};
        user.username = $("[name=username]").val();
        user.password = $("[name=password]").val();
        $.ajax({
            url: "login",
            type: "post",
            data: JSON.stringify(user),// 将user对象转换为json格式
            contentType: "application/json",//以json格式传输参数
            dataType: "json",// 响应数据的格式为json
            success: function (data) {
                if (data.status == "1") {
                    alert("登录成功");
                    location.href = "index.jsp";
                } else {
                    alert("用户名或密码错误");
                }
            }
        });

    }
</script>
</body>
</html>
