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
                                <span class="input-group-addon" id="basic-addon1">名称</span>
                                <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon2">所有者</span>
                                <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon js-datepicker" id="basic-addon3">开始日期</span>
                                <input type="text" class="form-control js-datepicker" placeholder="yyyy-mm-dd">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon js-datepicker" id="basic-addon4">结束日期</span>
                                <input type="text" class="form-control js-datepicker" placeholder="yyyy-mm-dd">
                            </div>
                            <button class="btn btn-default" type="submit">查询</button>
                        </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <button class="btn btn-label btn-primary" data-toggle="modal" data-target="#myModal"><label><i class="mid mdi mdi-plus"></i></label>创建</button>
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
                                <div class="modal-dialog modal-md" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <h4 class="modal-title" id="myModalLabel">创建市场活动</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <%--<div class="col-xs-6">--%>
                                                    <%--<input class="form-control" type="text" placeholder=".col-xs-6">--%>
                                                <%--</div>--%>

                                                <%--<div class="col-xs-6">--%>
                                                    <%--<input class="form-control" type="text" placeholder=".col-xs-6">--%>
                                                <%--</div>--%>
                                                <div class="form-group col-xs-6">
                                                    <label class="col-md-4 control-label" style="margin-right: -30px">所有者*</label>
                                                    <div class="col-md-8">
                                                        <input class="form-control input-sm" type="text" name="example-hf-email" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group  col-xs-6">
                                                    <label class="col-md-4 control-label" style="margin-right: -30px">名称*</label>
                                                    <div class="col-md-8">
                                                        <input class="form-control input-sm" type="text" name="" placeholder="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary">点击保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-label btn-info"><label><i class="mid mdi mdi-pencil"></i></label>修改</button>
                            <button class="btn btn-label btn-danger"><label><i class="mid mdi mdi-close"></i></label> 删除</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table-striped">
                                <table class="table ">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox"></th>
                                        <th>名称</th>
                                        <th>所有者</th>
                                        <th>开始日期</th>
                                        <th>结束日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row"><input type="checkbox"></th>
                                        <td>钦差大臣</td>
                                        <td>果戈理</td>
                                        <td>俄国</td>
                                        <td>国外名族</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><input type="checkbox"></th>
                                        <td>西厢记</td>
                                        <td>王实甫</td>
                                        <td>中国</td>
                                        <td>古文典籍</td>

                                    </tr>
                                    <tr>
                                        <th scope="row"><input type="checkbox"></th>
                                        <td>儒林外史</td>
                                        <td>吴敬梓</td>
                                        <td>中国</td>
                                        <td>古文典籍</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <nav>
                                <ul class="pagination">
                                    <li class="disabled">
                                        <a href="#!">
                                            <span><i class="mdi mdi-chevron-left"></i></span>
                                        </a>
                                    </li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#!">2</a></li>
                                    <li><a href="#!">3</a></li>
                                    <li><a href="#!">4</a></li>
                                    <li><a href="#!">5</a></li>
                                    <li>
                                        <a href="#!">
                                            <span><i class="mdi mdi-chevron-right"></i></span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
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
<script src="js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>