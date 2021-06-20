<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>编辑影人信息</title>
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

        function ajaxFileUpload(id) {
            $.ajaxFileUpload({
                url: '/admin/film/upload',
                secureuri: false,
                fileElementId: id,
                dataType: 'json',
                success: function (data, status) {
                    var isok = data.isok;
                    if (isok == 1) {
                        //$("#img1").attr("data-image", "<%=request.getContextPath()%>/file/" + data.path);
                        $("#img1").val(data.path);
                    }
                },
                error: function (data, status, e) {
                    alert('上传出错');
                }
            });
            return false;
        }

       /* function ajaxFileUpload2(id) {
            $.ajaxFileUpload({
                url: '<%=request.getContextPath()%>/upload/uploadVideo.do',
                secureuri: false,
                fileElementId: id,
                dataType: 'json',
                success: function (data, status) {
                    var isok = data.isok;
                    if (isok == 1) {
                        $("#video1").attr("data-image", "<%=request.getContextPath()%>/file/" + data.path);
                        $("#video1").val(data.path);
                    }
                },
                error: function (data, status, e) {
                    alert('上传出错');
                }
            });
            return false;
        }*/

        function yanzheng() {
            var name = $("#name").val();
            var orderby = $("#orderby").val();
            if ($.trim(name) == "") {
                alert("名称不能为空");
                return;
            }
            if ($.trim(orderby) != "" && isNaN(orderby)) {
                alert("顺序号必须为数字");
                return;
            }
            $("#form").submit();
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>影人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="" id="form">
            <div class="form-group">
                <div class="label">
                    <label>影片名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="filmName" size="100" id="filmName"/>
                    <%-- <input type="hidden" name="id" value="${film.id}"/> --%>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>导演：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="director" size="100" id="director"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>编剧：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="screenwriter" size="100"
                           id="screenwriter"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>主演：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="actor" size="100" id="actor"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>上映日期：</label>
                </div>
                <div class="field">
                    <input type="date" name="releaseDate" class="input"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>时长：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="filmLength" size="100" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>制片国家/地区：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="country" size="100" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>类型：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="type" size="100" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>语言：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="language" size="100" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>当前状态：</label>
                </div>
                <div class="field">
                    <input type="radio" name="status" value="即将上映" id="s1"/><label for="s1">即将上映</label>
                    <input type="radio" name="status" value="正在上映" id="s2"/><label for="s2">正在上映</label>
                    <input type="radio" name="status" value="已经下映" id="s3"/><label for="s3">已经下映</label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>购片连接：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="link" size="256" id="name"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>封面：</label>
                </div>
                <div class="field">
                    <input type="text" id="img1" name="image" class="input tips" style="width:25%; float:left;"
                           value="${bankuai.img}" data-toggle="hover" data-place="right" data-image="${bankuai.img}"
                           readonly="readonly"/>
                    <input type="file" id="file" name="file" onchange="ajaxFileUpload('file')"/>
                    <!-- <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" onclick="ajaxFileUpload('file')" /> -->
                </div>
            </div>
           <%-- <div class="form-group">
                <div class="label">
                    <label>电影片段：</label>
                </div>
                <div class="field">
                    <input type="text" id="video1" name="movie" class="input tips"
                           style="width:25%; float:left;" value="${bankuai.img}" data-toggle="hover" data-place="right"
                           data-image="${bankuai.img}" readonly="readonly"/>
                    <input type="file" id="file" name="file" onchange="ajaxFileUpload2('file')"/>
                    <!-- <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" onclick="ajaxFileUpload('file')" /> -->
                </div>
            </div>--%>
            <div class="form-group">
                <div class="label">
                    <label>简介：</label>
                </div>
                <div class="field">
                    <textarea rows="" cols="" class="input" name="brief">${film.briefIntro}</textarea>
                    <%--  <input type="text" class="input" name="orderby" value="${link.orderby}" size="10" id="orderby"/> --%>
                    <!-- <div class="tips">如为空则按顺序排列</div> -->
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button border-main icon-check-square-o" type="button" onclick="submitAdd()"> 提交
                    </button>
                    <button class="button border-red icon-tags" type="button" onclick="window.history.go(-1);"> 返回
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>

    function submitAdd() {
        var params = {
            filmName: $("#form input[name = filmName]").val(),
            director: $("#form input[name = director]").val(),
            screenwriter: $("#form input[name = screenwriter]").val(),
            actor: $("#form input[name = actor]").val(),
            type: $("#form input[name = type]").val(),
            country: $("#form input[name = country]").val(),
            language: $("#form input[name = language]").val(),
            releaseDate: $("#form input[name = releaseDate]").val(),
            filmLength: $("#form input[name = filmLength]").val(),
            link: $("#form input[name = link]").val(),
            brief: $("#form textarea[name = brief]").val(),
            state: $("#form input[name = status]:checked").val(),
            image: $("#form input[name = image]").val(),
        };
        $.post(
            "/admin/film/add",
            params,
            function (data) {
                alert(data.msg);
                window.location.href = '/admin/film/index.jsp';
            },
            "json"
        );
    }
</script>
</body>
</html>