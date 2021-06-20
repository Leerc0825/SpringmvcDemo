<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<link rel="stylesheet" href="/admin/css/pintuer.css"/>
<link rel="stylesheet" href="/css/pagination.css"/>
<link rel="stylesheet" href="/admin/css/admin.css"/>
<link href="/admin/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
<link href="/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
<script src="/admin/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/admin/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/admin/js/pintuer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<%--引用分页插件pagination.js--%>
<script src="/js/pagination.js"></script>
<script type="text/javascript" charset="utf-8">
    function getXHR() {//返回XMLHttpRequest
        if (window.XMLHttpRequest) {//W3C标准的浏览器获取
            return new XMLHttpRequest();
        } else {//ie浏览器适配
            return new window.ActiveXObject("Microsoft.XMLHTTP");
        }
    }

    // document.write(getXHR());
</script>