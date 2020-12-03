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
                                <li> <a href="settings/dictionary/type/index.jsp"><i class="mdi mdi-delete"></i> 数据字典</a></li>
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
                <div class="card-header">
                        <a href="javascript:void(0);" onclick="window.history.back();" style="" class="pull-left"><span class="mdi mdi-arrow-left-bold" style="font-size: 20px; color: #DDDDDD; margin-right: 10px"></span></a>
                        <h3 class="pull-left">李四先生 <small>动力节点</small></h3>

                    <button type="button" class="btn btn-default pull-right" onclick="window.location.href='convert.html';"><span class="glyphicon glyphicon-retweet"></span> 转换</button>
                    <button type="button" class="btn btn-default pull-right" data-toggle="modal" data-target="#editClueModal"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
                    <button type="button" class="btn btn-danger pull-right"><span class="glyphicon glyphicon-minus"></span> 删除</button>
                </div>
                <div class="card-body">
                    <!-- 详细信息 -->
                    <div style="position: relative; top: 0px;">
                        <div style="position: relative; left: 40px; height: 30px;">
                            <div style="width: 300px; color: gray;">名称</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>李四先生</b></div>
                            <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">所有者</div>
                            <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>zhangsan</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 30px; top: 10px;">
                            <div style="width: 300px; color: gray;">公司</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>动力节点</b></div>
                            <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">职位</div>
                            <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>CTO</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 35px; top: 20px;">
                            <div style="width: 300px; color: gray;">邮箱</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>lisi@bjpowernode.com</b></div>
                            <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">公司座机</div>
                            <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>010-84846003</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">公司网站</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>http://www.bjpowernode.com</b></div>
                            <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">手机</div>
                            <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>12345678901</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">线索状态</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>已联系</b></div>
                            <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">线索来源</div>
                            <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>广告</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">创建者</div>
                            <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>zhangsan&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-18 10:10:10</small></div>
                            <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">修改者</div>
                            <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>zhangsan&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">2017-01-19 10:10:10</small></div>
                            <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">描述</div>
                            <div style="width: 630px;position: relative; left: 200px; top: -20px;">
                                <b>
                                    这是一条线索的描述信息
                                </b>
                            </div>
                            <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">联系纪要</div>
                            <div style="width: 630px;position: relative; left: 200px; top: -20px;">
                                <b>
                                    这条线索即将被转换
                                </b>
                            </div>
                            <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">下次联系时间</div>
                            <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>2017-05-01</b></div>
                            <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px; "></div>
                        </div>
                        <div style="position: relative; left: 40px; height: 45px; top: 30px;">
                            <div style="width: 300px; color: gray;">详细地址</div>
                            <div style="width: 630px;position: relative; left: 200px; top: -20px;">
                                <b>
                                    北京大兴大族企业湾
                                </b>
                            </div>
                            <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>备注</h4>
                </div>
                <div class="card-body">
                    <!-- 备注1 -->
                    <div class="remarkDiv" style="height: 60px;">
                        <img title="zhangsan" src="images/user-thumbnail.png" style="width: 30px; height:30px;">
                        <div style="position: relative; top: -40px; left: 40px;" >
                            <h5>哎呦！</h5>
                            <font color="gray">线索</font> <font color="gray">-</font> <b>李四先生-动力节点</b> <small style="color: gray;"> 2017-01-22 10:10:10 由zhangsan</small>
                            <div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
                                <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
                            </div>
                        </div>
                    </div>

                    <!-- 备注2 -->
                    <div class="remarkDiv" style="height: 60px;">
                        <img title="zhangsan" src="images/user-thumbnail.png" style="width: 30px; height:30px;">
                        <div style="position: relative; top: -40px; left: 40px;" >
                            <h5>呵呵！</h5>
                            <font color="gray">线索</font> <font color="gray">-</font> <b>李四先生-动力节点</b> <small style="color: gray;"> 2017-01-22 10:20:10 由zhangsan</small>
                            <div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
                                <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
                            </div>
                        </div>
                    </div>

                    <div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
                        <form role="form" style="position: relative;top: 10px; left: 10px;">
                            <textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注..."></textarea>
                            <p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
                                <button id="cancelBtn" type="button" class="btn btn-default">取消</button>
                                <button type="button" class="btn btn-primary">保存</button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header"><h4>市场活动</h4></div>
                <div class="card-body">
                    <div style="position: relative;top: 0px;" class="table-responsive">
                        <table class="table table-hover" style="width: 900px;">
                            <thead>
                            <tr style="color: #B3B3B3;">
                                <td>名称</td>
                                <td>开始日期</td>
                                <td>结束日期</td>
                                <td>所有者</td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>发传单</td>
                                <td>2020-10-10</td>
                                <td>2020-10-20</td>
                                <td>zhangsan</td>
                                <td><a href="javascript:void(0);"  style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>
                            </tr>
                            <tr>
                                <td>发传单</td>
                                <td>2020-10-10</td>
                                <td>2020-10-20</td>
                                <td>zhangsan</td>
                                <td><a href="javascript:void(0);"  style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div>
                        <a href="javascript:void(0);" data-toggle="modal" data-target="#bundModal" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>关联市场活动</a>
                    </div>

                    <div style="height: 200px;"></div>
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
    <!-- 关联市场活动的模态窗口 -->
    <div class="modal fade" id="bundModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">关联市场活动</h4>
                </div>
                <div class="modal-body">
                    <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                        <form class="form-inline" role="form">
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </form>
                    </div>
                    <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                        <thead>
                        <tr style="color: #B3B3B3;">
                            <td><input type="checkbox"/></td>
                            <td>名称</td>
                            <td>开始日期</td>
                            <td>结束日期</td>
                            <td>所有者</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>发传单</td>
                            <td>2020-10-10</td>
                            <td>2020-10-20</td>
                            <td>zhangsan</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>发传单</td>
                            <td>2020-10-10</td>
                            <td>2020-10-20</td>
                            <td>zhangsan</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关联</button>
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
                    <h4 class="modal-title" id="myModalLabel">修改线索</h4>
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
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
    //默认情况下取消和保存按钮是隐藏的
    var cancelAndSaveBtnDefault = true;

    $(function(){
        $("#remark").focus(function(){
            if(cancelAndSaveBtnDefault){
                //设置remarkDiv的高度为130px
                $("#remarkDiv").css("height","130px");
                //显示
                $("#cancelAndSaveBtn").show("2000");
                cancelAndSaveBtnDefault = false;
            }
        });

        $("#cancelBtn").click(function(){
            //显示
            $("#cancelAndSaveBtn").hide();
            //设置remarkDiv的高度为130px
            $("#remarkDiv").css("height","90px");
            cancelAndSaveBtnDefault = true;
        });

        $(".remarkDiv").mouseover(function(){
            $(this).children("div").children("div").show();
        });

        $(".remarkDiv").mouseout(function(){
            $(this).children("div").children("div").hide();
        });

        $(".myHref").mouseover(function(){
            $(this).children("span").css("color","red");
        });

        $(".myHref").mouseout(function(){
            $(this).children("span").css("color","#E6E6E6");
        });
    });
</script>

</body>
</html>