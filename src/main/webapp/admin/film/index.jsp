<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="../../base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<form method="post" action="${path}/admin/film/index.do">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 电影管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <a class="button border-green" href="${path}/admin/film/updateoradd.jsp"><span
                            class="icon-edit"></span> 添加</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center" id="datagrid-film">
            <thead>
            <tr>
                <th>编号.</th>
                <th>电影名称</th>
                <th>上映年份</th>
                <th>时长</th>
                <th>制片国家/地区</th>
                <th>语言</th>
                <th>类型</th>
                <th>状态</th>
                <!-- <th>是否前台显示</th> -->
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>


        </table>
        <%--显示分页插件的位置--%>
        <div id="pages"></div>
    </div>
</form>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true"></span></button>
                <h4 class="modal-title" id="myModalLabel">编辑影片播放链接</h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label>影片ID</label>
                    <input type="text" name="filmId" class="form-control" id="filmId" placeholder="影片ID" readonly>
                </div>
                <div class="form-group">
                    <label for="message-text" class="control-label">资源路径</label>
                    <textarea class="form-control" id="message-text" name="playbackAddress"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span
                        class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true"></span></button>
                <h4 class="modal-title" id="myModalBanner">编辑轮播图</h4>
            </div>
            <div class="modal-body2">

                <div class="form-group">
                    <label>影片ID</label>
                    <input type="text" name="filmId" class="form-control" id="filmId1" placeholder="影片ID" readonly>
                </div>
                <div class="form-group">
                    <div class="label">
                        <label>轮播图图片：</label>
                    </div>
                    <div class="field">
                        <input type="text" id="img1" name="image" class="input tips" style="width:25%; float:left;"
                               value="${bankuai.img}" data-toggle="hover" data-place="right" data-image="${bankuai.img}"
                               readonly="readonly"/>
                        <input type="file" id="file" name="file" onchange="ajaxFileUpload('file')"/>
                        <!-- <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" onclick="ajaxFileUpload('file')" /> -->
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submitBanner" class="btn btn-primary" data-dismiss="modal"><span
                        class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        loadData(1, 5);
    });


    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        //modal.find('.modal-title').text('影片' + recipient);
        modal.find('.modal-body input[name=filmId]').val(recipient);
    });


    $('#myModal #btn_submit').click(function () {
        $.post(
            "/admin/film/update",
            {
                "ID": $('#myModal').find('.modal-body input[name=filmId]').val(),
                "movie": $('#myModal').find('.modal-body textarea[name=playbackAddress]').val()
            },
            function (data) {
                if (data == "true") {
                    $('#myModal').modal('hide');
                    alert("修改成功");
                }
            },
            "json"
        );
    });

    $('#myModal2 #btn_submitBanner').click(function () {
        $.get(
            "/admin/banner/add",
            {
                "ID": $("#filmId1").val(),
                "bannerImage": $("#img1").val(),
            },
            function (data) {
                if (data.status == "1") {
                    $('#myModal2').modal('hide');
                    alert("添加轮播图成功");
                    loadData(1, 5);
                } else {
                    alert("已经存在该影片的轮播图");
                }
            },
            "json"
        );
    });
</script>
<script type="text/javascript">

    function loadData(index, size) {
        $.get(
            "/admin/film/search",
            {"pageNum": index, "pageSize": size},
            function (data) {
                var filmList = data.list;
                $("#datagrid-film tbody").empty();//清空表格
                for (var i = 0; i < filmList.length; i++) {
                    var $tr = $("<tr></tr>");
                    $tr.append("<td>" + (i + 1) + "</td>");//序号
                    $tr.append("<td>" + filmList[i].filmName + "</td>");// 电影名称
                    $tr.append("<td>" + filmList[i].releaseDate + "</td>");// 上映年份
                    $tr.append("<td>" + filmList[i].filmLength + "</td>");// 时长
                    $tr.append("<td>" + filmList[i].country + "</td>");// 国家
                    $tr.append("<td>" + filmList[i].language + "</td>");// 语言
                    $tr.append("<td>" + filmList[i].type + "</td>");// 分类
                    $tr.append("<td>" + filmList[i].state + "</td>");// 状态

                    if (filmList[i].bannerState == 1) {
                        $tr.append("<td><div class='button-group'>" +
                            "<a class='button border-main btn' data-toggle='modal' data-target='#myModal'data-whatever='" + filmList[i].ID + "'><span class='icon-edit'></span> 编辑播放链接</a>" +
                            "<a class='button border-red' href='javascript:void(0)' onclick='del(" + filmList[i].ID + ")'><span class='icon-trash-o'></span> 删除</a>" +
                            "<a class='button border-red btn' name = 'aa'  data-toggle='modal' data-target='#myModal2'onclick='updateBanner(" + filmList[i].ID + ")'disabled='disabled'><span class='icon-edit'></span>已存在轮播图</a>" +
                            "</div>" + "</td>");
                    } else {
                        $tr.append("<td><div class='button-group'>" +
                            "<a class='button border-main btn' data-toggle='modal' data-target='#myModal'data-whatever='" + filmList[i].ID + "'><span class='icon-edit'></span> 编辑播放链接</a>" +
                            "<a class='button border-red' href='javascript:void(0)' onclick='del(" + filmList[i].ID + ")'><span class='icon-trash-o'></span> 删除</a>" +
                            "<a class='button border-main btn' name = 'aa'  data-toggle='modal' data-target='#myModal2'onclick='updateBanner(" + filmList[i].ID + ")'><span class='icon-edit'></span>添加轮播图</a>" +
                            "</div>" + "</td>");
                    }
                    $("#datagrid-film tbody").append($tr);
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
                })
            },
            "json"
        );
    }

    function del(id) {
        if (confirm("您确定要删除吗?")) {
            var param = {};
            param.id = id;
            $.ajax({
                type: "post",
                url: '/admin/film/delete',
                data: param,
                dataType: 'json',
                success: function (datas) {
                    if (datas == 1) {
                        alert("删除成功");
                        window.location.href = '/admin/film/index.jsp';
                    } else {
                        alert("该影片禁止删除");
                    }
                }
            });
        }
    }

    function updateBanner(id) {
        $("#filmId1").val(id);
    }

    function updateshow(id, show) {
        var param = {};
        param.id = id;
        param.isshow = show;
        $.ajax({
            type: "post",
            url: '${path}/admin/link/updateoradd.do',
            data: param,
            dataType: 'html',
            success: function (datas) {
                window.location.href = '${path}/admin/link/index.do';
            }
        });
    }


    function gotopage(url) {
        window.location.href = url;
    }

    function ajaxFileUpload(id) {
        $.ajaxFileUpload({
            url: '/admin/film/upload',
            secureuri: false,
            fileElementId: id,
            dataType: 'json',
            success: function (data, status) {
                var isok = data.isok;
                if (isok == 1) {
                    /*  $("#img1").attr("data-image", "










                    <%=request.getContextPath()%>/file/" + data.path);*/
                    $("#img1").val(data.path);
                }
            },
            error: function (data, status, e) {
                alert('上传出错');
            }
        });
        return false;
    }

</script>
</body>
</html>