package cn.dpocket.crm.workbench.web.controller;

import cn.dpocket.crm.settings.domain.User;
import cn.dpocket.crm.settings.service.UserService;
import cn.dpocket.crm.settings.service.impl.UserServiceImpl;
import cn.dpocket.crm.utils.DateTimeUtil;
import cn.dpocket.crm.utils.PrintJson;
import cn.dpocket.crm.utils.ServiceFactory;
import cn.dpocket.crm.utils.UUIDUtil;
import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.domain.Activity;
import cn.dpocket.crm.workbench.domain.ActivityRemark;
import cn.dpocket.crm.workbench.service.ActivityService;
import cn.dpocket.crm.workbench.service.impl.ActivityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:ActivityController
 * Package:cn.dpocket.crm.settings.web.controller
 * Description:
 * Date:2020/9/3 17:02
 * Author: anson
 */
public class ClueController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入线索控制器");
        String path = request.getServletPath();

        if("/workbench/clue/getUserList.do".equals(path)){
            getUserList(request, response);
        }
    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        //获取用户列表
        System.out.println("获取用户列表");
        UserService us = (UserService)ServiceFactory.getService(new UserServiceImpl());
        List<User> uList = us.getUserList();
        PrintJson.printJsonObj(response,uList);
    }


}
