<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <base href="<%=basePath%>%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>登录</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="">
<meta name="description" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<style>
.lyear-wrapper {
    position: relative;
}
.lyear-login {
    display: flex !important;
    min-height: 100vh;
    align-items: center !important;
    justify-content: center !important;
}
.lyear-login:after{
    content: '';
    min-height: inherit;
    font-size: 0;
}
.login-center {
    background: #fff;
    min-width: 29.25rem;
    padding: 2.14286em 3.57143em;
    border-radius: 3px;
    margin: 2.85714em;
}
.login-header {
    margin-bottom: 1.5rem !important;
}
.login-center .has-feedback.feedback-left .form-control {
    padding-left: 38px;
    padding-right: 12px;
}
.login-center .has-feedback.feedback-left .form-control-feedback {
    left: 0;
    right: auto;
    width: 38px;
    height: 38px;
    line-height: 38px;
    z-index: 4;
    color: #dcdcdc;
}
.login-center .has-feedback.feedback-left.row .form-control-feedback {
    left: 15px;
}
.msg-alert{
    display: none;
  padding: 5px;
}
</style>
</head>
  
<body>
<div class="row lyear-wrapper" style="background-image: url(images/login-bg-2.jpg); background-size: cover;">
  <div class="lyear-login">
    <div class="login-center">
      <!--<div class="login-header text-center">-->
        <!--<a href="index.jsp"> <img alt="light year admin" src="images/logo-sidebar.png"> </a>-->
      <!--</div>-->
      <form action="#!" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="alert alert-danger msg-alert">
          <span id="msg" class=""></span>
        </div>
        <!--<div class="form-group has-feedback feedback-left row">-->
          <!--<div class="col-xs-7">-->
            <!--<input type="text" name="captcha" class="form-control" placeholder="验证码">-->
            <!--<span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>-->
          <!--</div>-->
          <!--<div class="col-xs-5">-->
            <!--<img src="images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">-->
          <!--</div>-->
        <!--</div>-->
        <!--<div class="form-group">-->
          <!--<label class="lyear-checkbox checkbox-primary m-t-10">-->
            <!--<input type="checkbox"><span>5天内自动登录</span>-->
          <!--</label>-->
        <!--</div>-->
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="button" id="submitBtn">立即登录</button>
        </div>
      </form>
      <hr>
      <footer class="col-sm-12 text-center">
        <p class="m-b-0">Copyright © 2019 <a href=""></a>. All right reserved</p>
      </footer>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function () {
      // 页面加载完毕后，让用户名输入框自动获得焦点
      $("#username").focus();

      $("#submitBtn").click(function () {
          login();
      });
      // 给当前窗口绑定回车事件
      $(window).keydown(function (event) {
          if(event.keyCode==13){
              login();
          }
      });
  });
  function login() {
        let loginAct = $.trim($("#username").val());
        let loginPwd = $.trim($("#password").val());
        if((loginAct=="") || (loginPwd=="")){
            $(".msg-alert").css("display", "block");
            $("#msg").html("账号密码不能为空");
            return false;
        }
        $.ajax({
            url:"settings/user/login.do",
            data:{
                "username": loginAct,
                "password": loginPwd,
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if(data.success){
                    document.location.href = "workbench/index.jsp";
                }else{
                    $(".msg-alert").css("display", "block");
                    $("#msg").html(data.msg);
                }
            }
        })
  }
</script>
</body>
</html>