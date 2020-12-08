<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
String id = request.getParameter("id");
String fullname = request.getParameter("fullname");
    String appellation = request.getParameter("appellation");
    String company = request.getParameter("company");
    String owner = request.getParameter("owner");
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
                        <span class="navbar-page-title"> 线索 </span>
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
                    <h4>转换线索 <small><%=fullname%><%=appellation%>-<%=company%></small></h4>
                </div>
                <div class="card-body">
                    <div id="create-customer" style="position: relative; left: 40px; height: 35px;">
                        新建客户：<%=company%>
                    </div>
                    <div id="create-contact" style="position: relative; left: 40px; height: 35px;">
                        新建联系人：<%=fullname%><%=appellation%>
                    </div>
                    <div id="create-transaction1" style="position: relative; left: 40px; height: 35px; top: 25px;">
                        <input type="checkbox" id="isCreateTransaction"/>
                        为客户创建交易
                    </div>
                    <div id="create-transaction2" style="position: relative; left: 40px; top: 20px; width: 80%; background-color: #F7F7F7; display: none;" >

                        <form>
                            <div class="form-group" style="width: 400px; position: relative; left: 20px;">
                                <label for="amountOfMoney">金额</label>
                                <input type="text" class="form-control" id="amountOfMoney">
                            </div>
                            <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                                <label for="tradeName">交易名称</label>
                                <input type="text" class="form-control" id="tradeName" value="">
                            </div>
                            <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                                <label for="expectedClosingDate">预计成交日期</label>
                                <input type="text" class="form-control js-datepicker" id="expectedClosingDate">
                            </div>
                            <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                                <label for="stage">阶段</label>
                                <select id="stage"  class="form-control">
                                    <option></option>
                                    <c:forEach items="${stage}" var="a">
                                        <option value="${a.value}">${a.text}</option>
                                    </c:forEach>
                                    <%--<option>资质审查</option>--%>
                                    <%--<option>需求分析</option>--%>
                                    <%--<option>价值建议</option>--%>
                                    <%--<option>确定决策者</option>--%>
                                    <%--<option>提案/报价</option>--%>
                                    <%--<option>谈判/复审</option>--%>
                                    <%--<option>成交</option>--%>
                                    <%--<option>丢失的线索</option>--%>
                                    <%--<option>因竞争丢失关闭</option>--%>
                                </select>
                            </div>
                            <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                                <label for="activityName">市场活动源&nbsp;&nbsp;<a href="javascript:void(0);" id="openSearchModalBtn" style="text-decoration: none;"><span class="mdi mdi-account-search" style="font-size: 16px"></span></a></label>
                                <input type="text" class="form-control" id="activityName" placeholder="点击上面搜索" readonly>
                                <input type="hidden" id="activityId">
                            </div>
                        </form>

                    </div>

                    <div id="owner" style="position: relative; left: 40px; height: 35px; top: 50px;">
                        记录的所有者：<br>
                        <b><%=owner%></b>
                    </div>
                    <div id="operation" style="position: relative; left: 40px; height: 35px; top: 100px;">
                        <input class="btn btn-primary" type="button" value="转换">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-default" type="button" value="取消">
                    </div>
                </div>
            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
    <!-- 搜索市场活动的模态窗口 -->
    <div class="modal fade" id="searchActivityModal" role="dialog" >
        <div class="modal-dialog" role="document" style="width: 90%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title">搜索市场活动</h4>
                </div>
                <div class="modal-body">
                    <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                        <form class="form-inline" role="form">
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询" id="aname">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </form>
                    </div>
                    <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                        <thead>
                        <tr style="color: #B3B3B3;">
                            <td></td>
                            <td>名称</td>
                            <td>开始日期</td>
                            <td>结束日期</td>
                            <td>所有者</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody id="activitySearchBody">
                        <%--<tr>--%>
                            <%--<td><input type="radio" name="activity"/></td>--%>
                            <%--<td>发传单</td>--%>
                            <%--<td>2020-10-10</td>--%>
                            <%--<td>2020-10-20</td>--%>
                            <%--<td>zhangsan</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td><input type="radio" name="activity"/></td>--%>
                            <%--<td>发传单</td>--%>
                            <%--<td>2020-10-10</td>--%>
                            <%--<td>2020-10-20</td>--%>
                            <%--<td>zhangsan</td>--%>
                        <%--</tr>--%>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="submitActivityBtn">提交</button>
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
    $(function(){
        $("#isCreateTransaction").click(function(){
            if(this.checked){
                $("#create-transaction2").show(200);
            }else{
                $("#create-transaction2").hide(200);
            }
        });
        // 为放大镜图标绑定事件，打开搜索市场活动的模态窗口
        $("#openSearchModalBtn").click(function () {
            $("#searchActivityModal").modal("show");
        });
        $("#aname").keydown(function (event) {
            if(event.keyCode==13){
                // 回车后查询并展现市场活动列表
                $.ajax({
                    url:"workbench/clue/getActivityListByName.do",
                    data:{
                        "name": $.trim($("#aname").val()),
                    },
                    type: "get",
                    dataType: "json",
                    success: function (data) {
                        /*
                        * data:{{市场活动1}, {2}, {3}}
                        * */
                        let html = "";
                        $.each(data, function (i, n) {
                            html += '<tr>';
                            html += '<td><input type="radio" name="xz" value="'+n.id+'"/></td>';
                            html += '<td id='+n.id+'>'+n.name+'</td>';
                            html += '<td>'+n.startDate+'</td>';
                            html += '<td>'+n.endDate+'</td>';
                            html += '<td>'+n.owner+'</td>';
                            html += '</tr>';
                        });
                        $("#activitySearchBody").html(html);
                    }
                });
                // 展现完列表后，记得将模态窗口的默认回车事件禁用
                return false;
            }
        })

        // 为提交市场活动按钮绑定事件，填充市场活动源
        $("#submitActivityBtn").click(function () {
            let $xz = $("input[name=xz]:checked");
            let id = $xz.val();
            let name = $("#" + id).html();
            // 将以上两项信息填写到交易表单的市场活动源中
            $("#activityId").val(id);
            $("#activityName").val(name);
            // 将模态窗口关闭
            $("#searchActivityModal").modal("hide");
        });
    });
</script>

</body>
</html>