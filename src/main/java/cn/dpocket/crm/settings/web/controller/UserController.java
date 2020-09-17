package cn.dpocket.crm.settings.web.controller;

import cn.dpocket.crm.settings.domain.User;
import cn.dpocket.crm.settings.service.UserService;
import cn.dpocket.crm.settings.service.impl.UserServiceImpl;
import cn.dpocket.crm.utils.MD5Util;
import cn.dpocket.crm.utils.PrintJson;
import cn.dpocket.crm.utils.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:UserController
 * Package:cn.dpocket.crm.settings.web.controller
 * Description:
 * Date:2020/9/3 17:02
 * Author: anson
 */
public class UserController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getServletPath();

        if("/settings/user/login.do".equals(path)){
            login(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("进入登录验证操作！");
        String loginAct = request.getParameter("username");
        String loginPwd = request.getParameter("password");
        // 将明文密码转换成MD5密文
        System.out.println(loginPwd);
        loginPwd = MD5Util.getMD5(loginPwd);
        System.out.println(loginPwd);
        // 接收浏览器端ip地址
        String ip =request.getRemoteAddr();
        System.out.println("ip===============" + ip);

        // 未来业务层开发，统一采用代理形态的接口对象
        UserService us = (UserService)ServiceFactory.getService(new UserServiceImpl());
        try {
            User user = us.login(loginAct, loginPwd, ip);
            request.getSession().setAttribute("user", user);
            PrintJson.printJsonFlag(response, true);
        }catch (Exception e) {
            String msg = e.getMessage();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("success", false);
            map.put("msg", msg);
            PrintJson.printJsonObj(response, map);
        }
    }
}
