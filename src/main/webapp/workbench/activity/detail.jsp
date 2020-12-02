<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>%>">
    <meta charset="UTF-8">
    <title>市场活动</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="js/bootstrap-datepicker/bootstrap-datepicker3.min.css">

    <link href="css/style.min.css" rel="stylesheet">
</head>
<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <!--<a href="index.jsp"><img src="images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>-->
                <a href="workbench/index.jsp"><h2>CRM</h2></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a href="workbench/index.jsp"><i class="mdi mdi-home"></i> 工作台</a> </li>
                        <li class="nav-item active"> <a href="workbench/activity/index.jsp"><i class="mdi mdi-palette"></i> 市场活动</a> </li>
                        <li class="nav-item active"> <a href="workbench/clue/index.jsp"><i class="mdi mdi-palette"></i> 线索(潜在客户)</a> </li>
                    </ul>
                </nav>


            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 市场活动列表 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <!--<img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="笔下光年" />-->
                                <span>${user.name} <span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a> </li>
                                <li> <a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                                <li> <a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                                <li class="divider"></li>
                                <li> <a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                            </ul>
                        </li>

                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <span class="pull-left"><span style="font-size: 22px">市场活动-${a.name}</span>&nbsp;&nbsp;${a.startDate}~${a.endDate}</span>
                            <%--<span>fefef</span>--%>
                            <button class="btn btn-label btn-danger pull-right"><label><i class="mid mdi mdi-minus"></i></label>删除</button>
                            <button class="btn btn-label btn-default pull-right"><label><i class="mid mdi mdi-eyedropper"></i></label>编辑</button>
                        </div>
                        <div class="card-body">
                            <div class="row show-grid" style="margin-bottom: 15px">
                                    <div class="col-xs-5 col-md-5" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-6">所有者</div><div class="col-xs-6">${a.owner}</div></div>
                                    <div class="col-xs-5 col-md-5 col-md-offset-1 col-xs-offset-1" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-6">名称</div><div class="col-xs-6">${a.name}</div></div>
                            </div>
                            <div class="row show-grid" style="margin-bottom: 15px">
                                <div class="col-xs-5 col-md-5" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-6">开始日期</div><div class="col-xs-6">${a.startDate}</div></div>
                                <div class="col-xs-5 col-md-5 col-md-offset-1 col-xs-offset-1" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-6">结束日期</div><div class="col-xs-6">${a.endDate}</div></div>
                            </div>
                            <div class="row show-grid" style="margin-bottom: 15px">
                                <div class="col-xs-5 col-md-5" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-6">成本</div><div class="col-xs-6">${a.cost}</div></div>
                            </div>
                            <div class="row show-grid" style="margin-bottom: 15px">
                                <div class="col-xs-7 col-md-7" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-4">创建者</div><div class="col-xs-6">${a.createBy} ${a.createTime}</div></div>
                            </div>
                            <div class="row show-grid" style="margin-bottom: 15px">
                                <div class="col-xs-7 col-md-7" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-4">修改者</div><div class="col-xs-6">${a.editBy} ${a.editTime}</div></div>
                            </div>
                            <div class="row show-grid" style="margin-bottom: 15px">
                                <div class="col-xs-10 col-md-10" style="border-bottom: 1px solid #D9D9D9; padding-bottom: 5px"><div class="col-xs-3">描述</div><div class="col-xs-9">${a.description}</div></div>
                            </div>
                        </div>
                    </div>
                    <div class="card" id="remarkBody">
                        <div class="card-header">
                            <span class="pull-left" style="font-size: 20px">备注</span>
                        </div>
                        <div class="card-body">
                            <%--<div class="remarkDiv" style="height: 60px">--%>
                                <%--<img title="zhangsan" src="images/users/timg.jpg" style="height: 30px; width: 30px">--%>
                                <%--<div style="position: relative; top: -40px; left: 40px">--%>
                                    <%--<h5>哎呦1</h5>--%>
                                    <%--<span style="color: gray">市场活动-</span><b>发传单1</b><small style="color: gray">2020-11-01 由zhangsan</small>--%>
                                    <%--<div style="position: relative; top: -50px; left: 500px; height: 30px; width: 100px; display: none;">--%>
                                        <%--<a class="myHref" href=""><span class="mid mdi mdi-pencil" style="color: #E6E6E6; font-size: 20px"></span></a>--%>
                                        <%--<a class="myHref" href=""><span class="mid mdi mdi-close" style="color: #E6E6E6; font-size: 20px"></span></a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="remarkDiv" style="height: 60px">--%>
                                <%--<img title="zhangsan" src="images/users/timg.jpg" style="height: 30px; width: 30px">--%>
                                <%--<div style="position: relative; top: -40px; left: 40px">--%>
                                    <%--<h5>哎呦2</h5>--%>
                                    <%--<span style="color: gray">市场活动-</span><b>发传单2</b><small style="color: gray">2020-11-01 由zhangsan</small>--%>
                                    <%--<div style="position: relative; top: -50px; left: 500px; height: 30px; width: 100px; display: none;">--%>
                                        <%--<a class="myHref" href=""><span class="mid mdi mdi-pencil" style="color: #E6E6E6; font-size: 20px"></span></a>--%>
                                        <%--<a class="myHref" href=""><span class="mid mdi mdi-close" style="color: #E6E6E6; font-size: 20px"></span></a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div id="remarkDiv" style="height: 120px">
                                <form role="form" style="">
                                    <textarea id="remark" class="form-control" style="width: 50%" rows="2" placeholder="添加备注"></textarea>
                                    <p id="cancelAndSaveBtn" style="margin-top: 20px">
                                        <button id="cancelBtn" type="button" class="btn btn-default">取消</button>
                                        <button type="button" class="btn btn-primary" id="saveRemarkBtn">保存</button>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>
<div class="modal fade" id="editRemarkModal" tabindex="-1" role="dialog">
    <input type="hidden" id="remarkId">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改备注</h4>
            </div>
            <div class="modal-body clearfix">
                    <div class="col-xs-12">
                        <textarea class="form-control" id="noteContent" name="" rows="6" placeholder="内容.."></textarea>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateRemarkBtn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    $(function () {
        // $(".remarkDiv").mouseover(function () {
        //     $(this).children("div").children("div").show();
        // });
        // $(".remarkDiv").mouseout(function () {
        //     $(this).children("div").children("div").hide();
        // });
        // $(".myHref").mouseover(function () {
        //     $(this).children("span").css("color", "red");
        // });
        // $(".myHref").mouseout(function () {
        //     $(this).children("span").css("color", "#E6E6E6");
        // });

        // 在页面加载完毕后，展现与该活动关联的备注列表
        showRemarkList();
        // 添加删除按钮动态添加
        $("#remarkBody").on("mouseover", ".remarkDiv", function () {
            $(this).children("div").children("div").show();
        });
        $("#remarkBody").on("mouseout", ".remarkDiv", function () {
            $(this).children("div").children("div").hide();
        });
        $("#remarkBody").on("mouseover", ".myHref", function () {
            $(this).children("span").css("color", "red");
        });
        $("#remarkBody").on("mouseout", ".myHref", function () {
            $(this).children("span").css("color", "#E6E6E6");
        });
        $("#saveRemarkBtn").click(function () {
            $.ajax({
                url:"workbench/activity/saveRemark.do",
                data:{
                    "noteContent": $.trim($("#remark").val()),
                    "activityId": "${a.id}",
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    // 清空text文本域的信息
                    $("#remarkDiv").val("");
                    /*
                    * data:{"success": "true/false", "ar": {备注}}
                    * */
                    if(data.success){
                        let html = "";
                        html += '<div id="' + data.ar.id + '" class="remarkDiv" style="height: 60px">';
                        html += '<img title="zhangsan" src="images/users/timg.jpg" style="height: 30px; width: 30px">';
                        html += '<div style="position: relative; top: -40px; left: 40px">';
                        html += '<h5 id="e'+data.ar.id+'">' + data.ar.noteContent + '</h5>';
                        html += '<span style="color: gray">市场活动-</span><b>${a.name}</b><small style="color: gray" id="s'+data.ar.id+'">' + (data.ar.createTime) + ' 由' + (data.ar.createBy) + '</small>';
                        html += '<div style="position: relative; top: -50px; left: 500px; height: 30px; width: 100px; display: none;">';
                        html += '<a class="myHref" href="javascript:void(0);" onclick="editRemark(\'' + data.ar.id + '\')"><span class="mid mdi mdi-pencil" style="color: #E6E6E6; font-size: 20px"></span></a>';
                        html += '<a class="myHref" href="javascript:void(0);" onclick="deleteRemark(\'' + data.ar.id + '\')"><span class="mid mdi mdi-close" style="color: #E6E6E6; font-size: 20px"></span></a>';
                        html += '</div>';
                        html += '</div>';
                        html += '</div>';
                        $("#remarkDiv").before(html);
                    }else{
                        alert("添加备注失败！");
                    }
                }
            });
        });

        // 为修改备注的更新按钮绑定事件
        $("#updateRemarkBtn").click(function () {
            let id = $.trim($("#remarkId").val());
            $.ajax({
                url:"workbench/activity/updateRemark.do",
                data:{
                    "id": id,
                    "noteContent": $.trim($("#noteContent").val()),
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    /*
                    * data:{"success": "true/false", "ar": {备注}}
                    * */
                    if(data.success){
                        // 需要更新原noteContent和editBy，editCreate内容
                        $("#e" + id).html(data.ar.noteContent);
                        $("#s" + id).html(data.ar.editTime + "由" + data.ar.editBy);

                        // 关闭模态窗口
                        $("#editRemarkModal").modal("hide");
                    }else{
                        alert("修改备注失败！");
                    }
                }
            });
        });
    });
    function showRemarkList() {
        $.ajax({
            url:"workbench/activity/getRemarkListByAid.do",
            data:{
                "activityId": "${a.id}",
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                /*
                * data:{[{remark1}, {remark2}, {3}]}
                * */
                let html = "";
                $.each(data, function (i, n) {
                    html += '<div id="' + n.id + '" class="remarkDiv" style="height: 60px">';
                    html += '<img title="zhangsan" src="images/users/timg.jpg" style="height: 30px; width: 30px">';
                    html += '<div style="position: relative; top: -40px; left: 40px">';
                    html += '<h5 id="e'+n.id+'">' + n.noteContent + '</h5>';
                    html += '<span style="color: gray">市场活动-</span><b>${a.name}</b><small style="color: gray" id="s'+n.id+'">' + (n.editFlag==0?n.createTime:n.editTime) + ' 由' + (n.editFlag==0?n.createBy:n.editBy) + '</small>';
                    html += '<div style="position: relative; top: -50px; left: 500px; height: 30px; width: 100px; display: none;">';
                    html += '<a class="myHref" href="javascript:void(0);" onclick="editRemark(\'' + n.id + '\')"><span class="mid mdi mdi-pencil" style="color: #E6E6E6; font-size: 20px"></span></a>';
                    html += '<a class="myHref" href="javascript:void(0);" onclick="deleteRemark(\'' + n.id + '\')"><span class="mid mdi mdi-close" style="color: #E6E6E6; font-size: 20px"></span></a>';
                    html += '</div>';
                    html += '</div>';
                    html += '</div>';
                });
                $("#remarkDiv").before(html);
            }
        });
    }
    function deleteRemark(id) {
        $.ajax({
            url:"workbench/activity/deleteRemark.do",
            data:{
                "id": id,
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                /*
                * data:{"success", "true/false"}
                * */
                if(data.success){
                    $("#" + id).remove();
                }else{
                    alert("删除备注失败！");
                }

            }
        });
    }
    function editRemark(id) {
        let noteContent = $("#e" + id).html();
        $("#noteContent").val(noteContent);
        $("#remarkId").val(id);
        $("#editRemarkModal").modal("show");

        // $.ajax({
        //     url:"workbench/activity/deleteRemark.do",
        //     data:{
        //         "id": id,
        //     },
        //     type: "post",
        //     dataType: "json",
        //     success: function (data) {
        //         /*
        //         * data:{"success", "true/false"}
        //         * */
        //         if(data.success){
        //             $("#" + id).remove();
        //         }else{
        //             alert("删除备注失败！");
        //         }
        //
        //     }
        // });
    }
</script>

</body>
</html>