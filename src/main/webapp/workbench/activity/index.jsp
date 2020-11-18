<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>市场活动</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="js/bootstrap-datepicker/bootstrap-datepicker3.min.css">

    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/jquery.bs_pagination.min.css" rel="stylesheet">
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
                        <div class="card-body">
                            <form class="form-inline" action="" method="post" onsubmit="return false;">
                            <div class="input-group">
                                <span class="input-group-addon">名称</span>
                                <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1" id="search-name">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">所有者</span>
                                <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1" id="search-owner">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon js-datepicker">开始日期</span>
                                <input type="text" class="form-control js-datepicker" placeholder="yyyy-mm-dd" id="search-startDate">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon js-datepicker">结束日期</span>
                                <input type="text" class="form-control js-datepicker" placeholder="yyyy-mm-dd" id="search-endDate">
                            </div>
                            <button class="btn btn-default" type="button" id="searchBtn">查询</button>
                        </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <button class="btn btn-label btn-primary" id="addBtn"><label><i class="mid mdi mdi-plus"></i></label>创建</button>
                            <input type="hidden" id="hidden-name">
                            <input type="hidden" id="hidden-owner">
                            <input type="hidden" id="hidden-startDate">
                            <input type="hidden" id="hidden-endDate">
                            <div class="modal fade" id="createActivityModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" style="display: none;">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title" id="createModalLabel">创建市场活动</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form id="activityAddForm" class="form-horizontal" role="form">
                                                <div class="row">
                                                <div class="form-group  col-xs-6">
                                                    <label class="col-md-4 control-label" style="margin-right: -30px">所有者*</label>
                                                    <div class="col-md-8">
                                                        <select class="form-control input-sm" id="create-owner">
                                                            <%--<option>zhangsan</option>--%>
                                                            <%--<option>lisi</option>--%>
                                                            <%--<option>wangwu</option>--%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group  col-xs-6">
                                                    <label class="col-md-4 control-label" style="margin-right: -30px">名称*</label>
                                                    <div class="col-md-8">
                                                        <input class="form-control input-sm" type="text" name="" placeholder="" id="create-name">
                                                    </div>
                                                </div>
                                            </div>
                                                <div class="row">
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">开始日期</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm js-datepicker" type="text" name="" placeholder="yyyy-mm-dd" readonly id="create-startDate">
                                                        </div>
                                                    </div>
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">结束日期</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm js-datepicker" type="text" name="" placeholder="yyyy-mm-dd" readonly id="create-endDate">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">成本</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm" type="text" name="" placeholder="" id="create-cost">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-xs-12">
                                                        <label class="col-md-2 control-label" style="margin-right: -30px">描述</label>
                                                        <div class="col-md-10">
                                                            <textarea class="form-control"  id="create-description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary" id="saveBtn">点击保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-label btn-info" id="editBtn"><label><i class="mid mdi mdi-pencil"></i></label>修改</button>
                            <div class="modal fade" id="editActivityModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" style="display: none;">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title" id="eidtModalLabel">修改市场活动</h4>
                                        </div>
                                        <div class="modal-body">
                                                <form id="activityEditForm" class="form-horizontal" role="form">
                                                    <input type="hidden" id="edit-id">
                                                <div class="row">
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">所有者*</label>
                                                        <div class="col-md-8">
                                                            <select class="form-control input-sm" id="edit-owner">
                                                                <%--<option>zhangsan</option>--%>
                                                                <%--<option>lisi</option>--%>
                                                                <%--<option>wangwu</option>--%>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">名称*</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm" type="text" name="" placeholder="" id="edit-name">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">开始日期</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm js-datepicker" type="text" name="" placeholder="yyyy-mm-dd" readonly id="edit-startDate">
                                                        </div>
                                                    </div>
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">结束日期</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm js-datepicker" type="text" name="" placeholder="yyyy-mm-dd" readonly id="edit-endDate">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group  col-xs-6">
                                                        <label class="col-md-4 control-label" style="margin-right: -30px">成本</label>
                                                        <div class="col-md-8">
                                                            <input class="form-control input-sm" type="text" name="" placeholder="" id="edit-cost">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group col-xs-12">
                                                        <label class="col-md-2 control-label" style="margin-right: -30px">描述</label>
                                                        <div class="col-md-10">
                                                            <textarea class="form-control"  id="edit-description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary" id="updateBtn">更新</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-label btn-danger" id="deleteBtn"><label><i class="mid mdi mdi-close"></i></label> 删除</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table-striped">
                                <table class="table ">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="qx"></th>
                                        <th>名称</th>
                                        <th>所有者</th>
                                        <th>开始日期</th>
                                        <th>结束日期</th>
                                    </tr>
                                    </thead>
                                    <tbody id="activityBody">
                                    <%--<tr>--%>
                                        <%--<th scope="row"><input type="checkbox"></th>--%>
                                        <%--<td>钦差大臣</td>--%>
                                        <%--<td>果戈理</td>--%>
                                        <%--<td>俄国</td>--%>
                                        <%--<td>国外名族</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<th scope="row"><input type="checkbox"></th>--%>
                                        <%--<td>西厢记</td>--%>
                                        <%--<td>王实甫</td>--%>
                                        <%--<td>中国</td>--%>
                                        <%--<td>古文典籍</td>--%>

                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<th scope="row"><input type="checkbox"></th>--%>
                                        <%--<td>儒林外史</td>--%>
                                        <%--<td>吴敬梓</td>--%>
                                        <%--<td>中国</td>--%>
                                        <%--<td>古文典籍</td>--%>
                                    <%--</tr>--%>
                                    </tbody>
                                </table>
                            </div>
                            <div id="activityPage"></div>
                            <%--<nav>--%>
                                <%--<ul class="pagination">--%>
                                    <%--<li class="disabled">--%>
                                        <%--<a href="#!">--%>
                                            <%--<span><i class="mdi mdi-chevron-left"></i></span>--%>
                                        <%--</a>--%>
                                    <%--</li>--%>
                                    <%--<li class="active"><a href="#">1</a></li>--%>
                                    <%--<li><a href="#!">2</a></li>--%>
                                    <%--<li><a href="#!">3</a></li>--%>
                                    <%--<li><a href="#!">4</a></li>--%>
                                    <%--<li><a href="#!">5</a></li>--%>
                                    <%--<li>--%>
                                        <%--<a href="#!">--%>
                                            <%--<span><i class="mdi mdi-chevron-right"></i></span>--%>
                                        <%--</a>--%>
                                    <%--</li>--%>
                                <%--</ul>--%>
                            <%--</nav>--%>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>

<script type="text/javascript" src="js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="js/en.js"></script>

<script type="text/javascript">
    $(function () {
        $("#addBtn").click(function () {
            $.ajax({
                url:"workbench/activity/getUserList.do",
                type: "get",
                dataType: "json",
                success: function (data) {
                    let html = "";
                    $.each(data, function (i, n) {
                        html += "<option value=" + n.id +">" + n.name +"</option>";
                    });
                    $("#create-owner").html(html);
                    // 在js使用el表达式，必须套用在字符串中
                    let id = "${user.id}";
                    $("#create-owner").val(id);
                    $("#createActivityModal").modal("show");
                }
            });

        });
        $("#saveBtn").click(function () {
            $.ajax({
                url:"workbench/activity/save.do",
                data:{
                    "owner": $.trim($("#create-owner").val()),
                    "name": $.trim($("#create-name").val()),
                    "startDate": $.trim($("#create-startDate").val()),
                    "endDate": $.trim($("#create-endDate").val()),
                    "cost": $.trim($("#create-cost").val()),
                    "description": $.trim($("#create-description").val())
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if(data.success){
                        //刷新市场活动表，局部刷新
                        //pageList(1, 2);
                        /*
                        * ("#activityPage").bs_pagination('getOption', 'currentPaga')"操作后留在当前页
                        * $("#activityPage").bs_pagination('getOption', 'rowPerPage')操作后维持设置好的条目数
                        * */
                        pageList(1, $("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
                        //清空模态对话框的数据
                        /**
                         * 使用jquery拿到form表单对象，表单的submit()有效
                         * 但是jquery拿到form表单的reset()无效
                         * 原生的js提供了reset方法，需要将jquery对象转成原生的dom
                         * jquery对象转dom：
                         *      jquery对象[下标]
                         * dom对象转jquery对象：
                         *      $(dom)
                         * **/
                        $("#activityAddForm")[0].reset();
                        //关闭模态窗口
                        $("#createActivityModal").modal("hide");

                    }else{
                        alert("添加市场活动表失败！");
                    }

                }
            });

        });
        $("#searchBtn").click(function () {
            $("#hidden-name").val($.trim($("#search-name").val()));
            $("#hidden-owner").val($.trim($("#search-owner").val()));
            $("#hidden-startDate").val($.trim($("#search-startDate").val()));
            $("#hidden-endDate").val($.trim($("#search-endDate").val()));
            pageList(1, 2);
        });
        $("#qx").click(function () {
            $("input[name=xz]").prop("checked", this.checked);
        });
        $("#activityBody").on("click", $("input[name=xz]"), function () {
            $("#qx").prop("checked", $("input[name=xz]").length== $("input[name=xz]:checked").length);
        });
        $("#editBtn").click(function () {
            let $xz = $("input[name=xz]:checked");
            if($xz.length==0){
                alert("请选择需要修改的记录！");
            }else if($xz.length>1){
                alert("请选择一条记录修改！");
            }else{
                $.ajax({
                    url:"workbench/activity/getUserListAndActivity.do",
                    data:{
                        id: $($xz).val(),
                    },
                    type: "get",
                    dataType: "json",
                    success: function (data) {
                        let html = "";
                        $.each(data.uList, function (i, n) {
                            html += "<option value=" + n.id +">" + n.name +"</option>";
                        });
                        $("#edit-owner").html(html);

                        $("#edit-id").val(data.a.id);
                        $("#edit-name").val(data.a.name);
                        $("#edit-owner").val(data.a.owner);
                        $("#edit-startDate").val(data.a.startDate);
                        $("#edit-endDate").val(data.a.endDate);
                        $("#edit-cost").val(data.a.cost);
                        $("#edit-description").val(data.a.description);

                        $("#editActivityModal").modal("show");
                    }
                });
            }
        });
        $("#deleteBtn").click(function () {
            let $xz = $("input[name=xz]:checked");
            if($xz.length == 0){
                alert("请选择需要删除的记录！");
            }else{
                if(confirm("确定删除所选中的记录吗？")){
                    let param = "";
                    for(i=0; i<$xz.length;i++){
                        param += "id=" + $($xz[i]).val();
                        if(i<$xz.length - 1){
                            param += "&";
                        }
                    }
                    $.ajax({
                        url:"workbench/activity/delete.do",
                        data: param,
                        type: "get",
                        dataType: "json",
                        success: function (data) {
                            /*
                            * data:
                            *    {"success": true/false}*/
                            if(data.success){
                                // 删除成功
                                pageList(1, $("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
                            }else{
                                // 删除失败
                                alert("删除市场活动失败！");
                            }
                        }
                    });
                }
            }
        });
        $("#updateBtn").click(function () {
            $.ajax({
                url:"workbench/activity/update.do",
                data:{
                    "id": $("#edit-id").val(),
                    "owner": $.trim($("#edit-owner").val()),
                    "name": $.trim($("#edit-name").val()),
                    "startDate": $.trim($("#edit-startDate").val()),
                    "endDate": $.trim($("#edit-endDate").val()),
                    "cost": $.trim($("#edit-cost").val()),
                    "description": $.trim($("#edit-description").val())
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if(data.success){
                        //刷新市场活动表，局部刷新
                        // pageList(1, 2);
                        pageList($("#activityPage").bs_pagination('getOption', 'currentPage'), $("#activityPage").bs_pagination('getOption', 'rowsPerPage'));
                        //关闭模态窗口
                        $("#editActivityModal").modal("hide");
                    }else{
                        alert("修改市场活动表失败！");
                    }

                }
            });
        });



        // 页面加载完毕后，触发分页显示数据
        // 默认展开第一页，每一页显示2条数据
        pageList(1, 2);
    });
    function pageList(pageNo, pageSize) {
        $("#qx").prop("checked", false);

        $("#search-name").val($.trim($("#hidden-name").val()));
        $("#search-owner").val($.trim($("#hidden-owner").val()));
        $("#search-startDate").val($.trim($("#hidden-startDate").val()));
        $("#search-endDate").val($.trim($("#hidden-endDate").val()));
        $.ajax({
            url:"workbench/activity/pageList.do",
            data:{
                "pageNo": pageNo,
                "pageSize": pageSize,
                "name": $.trim($("#search-name").val()),
                "owner": $.trim($("#search-owner").val()),
                "startDate": $.trim($("#search-startDate").val()),
                "endDate": $.trim($("#search-endDate").val())
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                /*
                * data:{"total": 100, "dataList": [{市场活动1}, {2}, {3}]}
                * */
                let html = "";
                $.each(data.dataList, function (i, n) {
                    html += '<tr><th scope="row"><input type="checkbox" name="xz" value="' + n.id + '"></th><td><a href="workbench/activity/detail.html">' + n.name + '</></td>';
                    html += '<td>' + n.owner + '</td>';
                    html += '<td>' + n.startDate + '</td>';
                    html += '<td>' + n.endDate + '</td>';
                });
                $("#activityBody").html(html);
                // 计算总页数
                let totalPages = data.total%pageSize==0?data.total/pageSize:parseInt(data.total/pageSize) + 1;
                console.log(totalPages);
                $("#activityPage").bs_pagination({
                    currentPage: pageNo,
                    rowsPerPage: pageSize,
                    maxRowsPerPage: 20,
                    totalPages: totalPages,
                    totalRows: data.total,
                    visiblePageLinks: 3,
                    showGoToPage: true,
                    showRowsPerPage: true,
                    showRowsInfo: true,
                    showRowsDefaultInfo: true,
                    onChangePage: function (event, data) {
                        pageList(data.currentPage, data.rowsPerPage);
                    }
                });
            }
        });
    };
</script>
</body>
</html>