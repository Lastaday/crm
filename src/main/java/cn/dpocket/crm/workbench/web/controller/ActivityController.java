package cn.dpocket.crm.workbench.web.controller;

import cn.dpocket.crm.settings.domain.User;
import cn.dpocket.crm.settings.service.UserService;
import cn.dpocket.crm.settings.service.impl.UserServiceImpl;
import cn.dpocket.crm.utils.*;
import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.domain.Activity;
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
import java.util.UUID;

/**
 * ClassName:ActivityController
 * Package:cn.dpocket.crm.settings.web.controller
 * Description:
 * Date:2020/9/3 17:02
 * Author: anson
 */
public class ActivityController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入市场活动控制器");
        String path = request.getServletPath();
        System.out.println(path);
        if("/workbench/activity/getUserList.do".equals(path)){

            getUserList(request, response);
        }else if("/workbench/activity/save.do".equals(path)){
            save(request, response);
        }else if("/workbench/activity/pageList.do".equals(path)){
            pageList(request, response);
        }else if("/workbench/activity/delete.do".equals(path)){
            delete(request, response);
        }else if("/workbench/activity/getUserListAndActivity.do".equals(path)){
            getUserListAndActivity(request, response);
        }else if("/workbench/activity/update.do".equals(path)){
            update(request, response);
        }


    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("执行市场活动的修改操作");
        String id = request.getParameter("id");
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String cost = request.getParameter("cost");
        String description = request.getParameter("description");
        // 修改时间是当前系统时间
        String editTime = DateTimeUtil.getSysTime();
        String editBy = ((User)request.getSession().getAttribute("user")).getName();

        Activity a = new Activity();
        a.setId(id);
        a.setOwner(owner);
        a.setName(name);
        a.setStartDate(startDate);
        a.setEndDate(endDate);
        a.setCost(cost);
        a.setDescription(description);
        a.setEditBy(editBy);
        a.setEditTime(editTime);
        ActivityService as = (ActivityService)ServiceFactory.getService(new ActivityServiceImpl());
        boolean flag = as.update(a);
        PrintJson.printJsonFlag(response, flag);
    }

    private void getUserListAndActivity(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("获取用户信息列表和根据市场活动id查询市场活动");
        String id = request.getParameter("id");
        ActivityService as = (ActivityService)(ServiceFactory.getService(new ActivityServiceImpl()));
        Map<String, Object> map = as.getUserListAndActivity(id);
        PrintJson.printJsonObj(response, map);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("执行删除操作");
        String ids[] = request.getParameterValues("id");
        ActivityService as = (ActivityService)(ServiceFactory.getService(new ActivityServiceImpl()));
        boolean flag = as.delete(ids);
        PrintJson.printJsonFlag(response, flag);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("进入查询市场活动信息列表的操作");
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = Integer.valueOf(pageNoStr);
        String pageSizeStr = request.getParameter("pageSize");
        int pageSize = Integer.valueOf(pageSizeStr);
        // 计算略过的记录数
        int skipCount = (pageNo - 1) * pageSize;

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", name);
        map.put("owner", owner);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("skipCount", skipCount);
        map.put("pageSize", pageSize);

        ActivityService as = (ActivityService)(ServiceFactory.getService(new ActivityServiceImpl()));


        /*
        * 前端需要：
        *   市场活动信息列表
        *   查询总条数
        *
        * 业务层拿到信息后，做返回，不常用就使用map，常用就使用vo
        *   map:
        *       map.put("total", total)
        *       map.put("dataList", dataList)
        *       printJSON map
        *   vo:
        *       PaginationVO<T>
        *           private int total;
        *           private List<T> dataList;
        *   PaginationVO<Activity> vo = new PaginationVO();
        * 将来分页查询每个模块都有，选择使用通用的vo
        * */
        PaginationVO<Activity> vo = as.pageList(map);
        PrintJson.printJsonObj(response, vo);
    }


    private void save(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("执行市场活动的添加操作");
        String id = UUIDUtil.getUUID();
        String owner = request.getParameter("owner");
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String cost = request.getParameter("cost");
        String description = request.getParameter("description");
        // 创建时间是当前系统时间
        String createTime = DateTimeUtil.getSysTime();
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        System.out.println(createBy);
        Activity a = new Activity();
        a.setId(id);
        a.setOwner(owner);
        a.setName(name);
        a.setStartDate(startDate);
        a.setEndDate(endDate);
        a.setCost(cost);
        a.setDescription(description);
        a.setCreateBy(createBy);
        a.setCreateTime(createTime);
        ActivityService as = (ActivityService)ServiceFactory.getService(new ActivityServiceImpl());
        boolean flag = as.save(a);
        PrintJson.printJsonFlag(response, flag);
    }

    private void getUserList(HttpServletRequest request, HttpServletResponse response) {
        //获取用户列表
        System.out.println("获取用户列表");
        UserService us = (UserService)ServiceFactory.getService(new UserServiceImpl());
        List<User> uList = us.getUserList();
        PrintJson.printJsonObj(response,uList);
    }
}
