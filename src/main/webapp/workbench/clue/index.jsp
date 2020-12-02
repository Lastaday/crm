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
<!-- 创建线索的模态窗口 -->
<div class="modal fade" id="createClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">创建线索</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="create-clueOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-clueOwner">
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="create-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-company">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-call">
                                <option></option>
                                <option>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                        <label for="create-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-surname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-job">
                        </div>
                        <label for="create-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-phone" class="col-sm-2 control-label">公司座机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-phone">
                        </div>
                        <label for="create-website" class="col-sm-2 control-label">公司网站</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-website">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-mphone">
                        </div>
                        <label for="create-status" class="col-sm-2 control-label">线索状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-status">
                                <option></option>
                                <option>试图联系</option>
                                <option>将来联系</option>
                                <option>已联系</option>
                                <option>虚假线索</option>
                                <option>丢失线索</option>
                                <option>未联系</option>
                                <option>需要条件</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-source" class="col-sm-2 control-label">线索来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-source">
                                <option></option>
                                <option>广告</option>
                                <option>推销电话</option>
                                <option>员工介绍</option>
                                <option>外部介绍</option>
                                <option>在线商场</option>
                                <option>合作伙伴</option>
                                <option>公开媒介</option>
                                <option>销售邮件</option>
                                <option>合作伙伴研讨会</option>
                                <option>内部研讨会</option>
                                <option>交易会</option>
                                <option>web下载</option>
                                <option>web调研</option>
                                <option>聊天</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">线索描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-nextContactTime">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="1" id="create-address"></textarea>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改线索的模态窗口 -->
<div class="modal fade" id="editClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">修改线索</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="edit-clueOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-clueOwner">
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="edit-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-company" value="动力节点">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-call">
                                <option></option>
                                <option selected>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                        <label for="edit-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-surname" value="李四">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-job" value="CTO">
                        </div>
                        <label for="edit-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-email" value="lisi@bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-phone" value="010-84846003">
                        </div>
                        <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-website" value="http://www.bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-mphone" value="12345678901">
                        </div>
                        <label for="edit-status" class="col-sm-2 control-label">线索状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-status">
                                <option></option>
                                <option>试图联系</option>
                                <option>将来联系</option>
                                <option selected>已联系</option>
                                <option>虚假线索</option>
                                <option>丢失线索</option>
                                <option>未联系</option>
                                <option>需要条件</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-source" class="col-sm-2 control-label">线索来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-source">
                                <option></option>
                                <option selected>广告</option>
                                <option>推销电话</option>
                                <option>员工介绍</option>
                                <option>外部介绍</option>
                                <option>在线商场</option>
                                <option>合作伙伴</option>
                                <option>公开媒介</option>
                                <option>销售邮件</option>
                                <option>合作伙伴研讨会</option>
                                <option>内部研讨会</option>
                                <option>交易会</option>
                                <option>web下载</option>
                                <option>web调研</option>
                                <option>聊天</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe">这是一条线索的描述信息</textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="edit-contactSummary">这个线索即将被转换</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-nextContactTime" value="2017-05-01">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="1" id="edit-address">北京大兴区大族企业湾</textarea>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>
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
                        <li class="nav-item"> <a href="workbench/index.jsp"><i class="mdi mdi-home"></i> 工作台</a> </li>
                        <li class="nav-item"> <a href="workbench/activity/index.jsp"><i class="mdi mdi-palette"></i> 市场活动</a> </li>
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
                        <span class="navbar-page-title"> 线索列表 </span>
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
            <div class="card">
                <div class="card-body">
                    <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">名称</div>
                                <input class="form-control" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">公司</div>
                                <input class="form-control" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">公司座机</div>
                                <input class="form-control" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">线索来源</div>
                                <select class="form-control">
                                    <option></option>
                                    <option>广告</option>
                                    <option>推销电话</option>
                                    <option>员工介绍</option>
                                    <option>外部介绍</option>
                                    <option>在线商场</option>
                                    <option>合作伙伴</option>
                                    <option>公开媒介</option>
                                    <option>销售邮件</option>
                                    <option>合作伙伴研讨会</option>
                                    <option>内部研讨会</option>
                                    <option>交易会</option>
                                    <option>web下载</option>
                                    <option>web调研</option>
                                    <option>聊天</option>
                                </select>
                            </div>
                        </div>

                        <br>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">所有者</div>
                                <input class="form-control" type="text">
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">手机</div>
                                <input class="form-control" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">线索状态</div>
                                <select class="form-control">
                                    <option></option>
                                    <option>试图联系</option>
                                    <option>将来联系</option>
                                    <option>已联系</option>
                                    <option>虚假线索</option>
                                    <option>丢失线索</option>
                                    <option>未联系</option>
                                    <option>需要条件</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-default">查询</button>

                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="btn-group" style="position: relative; top: 18%;">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createClueModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editClueModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
                        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive table-striped">
                        <table class="table table-hover">
                        <thead>
                            <tr style="color: #B3B3B3;">
                                <td><input type="checkbox" /></td>
                                <td>名称</td>
                                <td>公司</td>
                                <td>公司座机</td>
                                <td>手机</td>
                                <td>线索来源</td>
                                <td>所有者</td>
                                <td>线索状态</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" /></td>
                                <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='workbench/clue/detail.jsp';">李四先生</a></td>
                                <td>动力节点</td>
                                <td>010-84846003</td>
                                <td>12345678901</td>
                                <td>广告</td>
                                <td>zhangsan</td>
                                <td>已联系</td>
                            </tr>
                            <tr class="active">
                                <td><input type="checkbox" /></td>
                                <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">李四先生</a></td>
                                <td>动力节点</td>
                                <td>010-84846003</td>
                                <td>12345678901</td>
                                <td>广告</td>
                                <td>zhangsan</td>
                                <td>已联系</td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <div style="height: 50px; position: relative;top: 10px;">
                        <div style="position: relative;top: 5px;">
                            <button type="button" class="btn btn-default" style="cursor: default; top:5px;">共<b>50</b>条记录</button>
                        </div>
                        <div class="btn-group" style="position: relative;top: -34px; left: 110px;">
                            <button type="button" class="btn btn-default" style="cursor: default;">显示</button>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    10
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">20</a></li>
                                    <li><a href="#">30</a></li>
                                </ul>
                            </div>
                            <button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
                        </div>
                        <div style="position: relative;top: -88px; left: 285px;">
                            <nav>
                                <ul class="pagination">
                                    <li class="disabled"><a href="#">首页</a></li>
                                    <li class="disabled"><a href="#">上一页</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">下一页</a></li>
                                    <li class="disabled"><a href="#">末页</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">--%>

                <%--<div style="width: 100%; position: absolute;top: 5px; left: 10px;">--%>

                    <%--<div class="btn-toolbar" role="toolbar" style="height: 80px;">--%>

                    <%--</div>--%>
                    <%--<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 40px;">--%>
                        <%--<div class="btn-group" style="position: relative; top: 18%;">--%>
                            <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createClueModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>--%>
                            <%--<button type="button" class="btn btn-default" data-toggle="modal" data-target="#editClueModal"><span class="glyphicon glyphicon-pencil"></span> 修改</button>--%>
                            <%--<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>--%>
                        <%--</div>--%>


                    <%--</div>--%>
                    <%--<div style="position: relative;top: 50px;">--%>

                    <%--</div>--%>

                    <%--<div style="height: 50px; position: relative;top: 60px;">--%>
                        <%--<div>--%>
                            <%--<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>--%>
                        <%--</div>--%>
                        <%--<div class="btn-group" style="position: relative;top: -34px; left: 110px;">--%>
                            <%--<button type="button" class="btn btn-default" style="cursor: default;">显示</button>--%>
                            <%--<div class="btn-group">--%>
                                <%--<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">--%>
                                    <%--10--%>
                                    <%--<span class="caret"></span>--%>
                                <%--</button>--%>
                                <%--<ul class="dropdown-menu" role="menu">--%>
                                    <%--<li><a href="#">20</a></li>--%>
                                    <%--<li><a href="#">30</a></li>--%>
                                <%--</ul>--%>
                            <%--</div>--%>
                            <%--<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>--%>
                        <%--</div>--%>
                        <%--<div style="position: relative;top: -88px; left: 285px;">--%>
                            <%--<nav>--%>
                                <%--<ul class="pagination">--%>
                                    <%--<li class="disabled"><a href="#">首页</a></li>--%>
                                    <%--<li class="disabled"><a href="#">上一页</a></li>--%>
                                    <%--<li class="active"><a href="#">1</a></li>--%>
                                    <%--<li><a href="#">2</a></li>--%>
                                    <%--<li><a href="#">3</a></li>--%>
                                    <%--<li><a href="#">4</a></li>--%>
                                    <%--<li><a href="#">5</a></li>--%>
                                    <%--<li><a href="#">下一页</a></li>--%>
                                    <%--<li class="disabled"><a href="#">末页</a></li>--%>
                                <%--</ul>--%>
                            <%--</nav>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>

            <%--</div>--%>

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

</script>
</body>
</html>