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
import cn.dpocket.crm.workbench.domain.Clue;
import cn.dpocket.crm.workbench.service.ActivityService;
import cn.dpocket.crm.workbench.service.ClueService;
import cn.dpocket.crm.workbench.service.impl.ActivityServiceImpl;
import cn.dpocket.crm.workbench.service.impl.ClueServiceImpl;

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
        }else if("/workbench/clue/save.do".equals(path)){
            save(request, response);
        }else if("/workbench/clue/pageList.do".equals(path)){
            pageList(request, response);
        }else if("/workbench/clue/detail.do".equals(path)){
            detail(request, response);
        }else if("/workbench/clue/getActivityListByClueId.do".equals(path)){
            getActivityListByClueId(request, response);
        }else if("/workbench/clue/unbind.do".equals(path)){
            unbind(request, response);
        }else if("/workbench/clue/getActivityListByNameNotByClueId.do".equals(path)){
            getActivityListByNameNotByClueId(request, response);
        }else if("/workbench/clue/bind.do".equals(path)){
            bind(request, response);
        }
    }

    private void bind(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("绑定关联");

        String cid = request.getParameter("cid");
        String[] aids = request.getParameterValues("aid");

        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        boolean flag = cs.bind(cid, aids);
        PrintJson.printJsonFlag(response, flag);
    }

    private void getActivityListByNameNotByClueId(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("查询市场活动列表，根据名称模糊查询，并排除已关联的线索的列表");

        String cid = request.getParameter("clueId");
        String name = request.getParameter("name");
        ActivityService as = (ActivityService)ServiceFactory.getService(new ActivityServiceImpl());
        Map<String,String> map = new HashMap<String, String>();
        map.put("cid", cid);
        map.put("name", name);
        List<Activity> aList = as.getActivityListByNameNotByClueId(map);
        PrintJson.printJsonObj(response, aList);
    }

    private void unbind(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("执行解除关联操作");
        String id = request.getParameter("id");
        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        boolean flag = cs.unbind(id);
        PrintJson.printJsonFlag(response, flag);
    }

    private void getActivityListByClueId(HttpServletRequest request, HttpServletResponse response) {
        String clueId = request.getParameter("clueId");
        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        List<Activity> aList = cs.getActivityListByClueId(clueId);
        PrintJson.printJsonObj(response, aList);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        Clue c = cs.detail(id);
        request.setAttribute("c", c);
        request.getRequestDispatcher("/workbench/clue/detail.jsp").forward(request, response);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("查询线索列表的操作");

        String fullname = request.getParameter("fullname");
        String owner = request.getParameter("owner");
        String company = request.getParameter("company");
        String phone = request.getParameter("phone");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        String source = request.getParameter("source");

        String pageNoStr = request.getParameter("pageNo");
        int pageNo = Integer.valueOf(pageNoStr);
        String pageSizeStr = request.getParameter("pageSize");
        int pageSize = Integer.valueOf(pageSizeStr);
        // 计算略过的记录数
        int skipCount = (pageNo - 1) * pageSize;

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("fullname", fullname);
        map.put("owner", owner);
        map.put("company", company);
        map.put("phone", phone);
        map.put("mphone", mphone);
        map.put("state", state);
        map.put("source", source);
        map.put("skipCount", skipCount);
        map.put("pageSize", pageSize);

        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        PaginationVO<Clue> vo = cs.pageList(map);
        PrintJson.printJsonObj(response, vo);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {

        System.out.println("创建线索");

        String id = UUIDUtil.getUUID();
        String fullname = request.getParameter("fullname");
        String appellation = request.getParameter("appellation");
        String owner = request.getParameter("owner");
        String company = request.getParameter("company");
        String job = request.getParameter("job");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String mphone = request.getParameter("mphone");
        String state = request.getParameter("state");
        String source = request.getParameter("source");
        String createBy = ((User)request.getSession().getAttribute("user")).getName();
        String createTime = DateTimeUtil.getSysTime();
        String description = request.getParameter("description");
        String contactSummary = request.getParameter("contactSummary");
        String nextContactTime = request.getParameter("nextContactTime");
        String address = request.getParameter("address");

        Clue c = new Clue();
        c.setId(id);
        c.setFullname(fullname);
        c.setAppellation(appellation);
        c.setOwner(owner);
        c.setCompany(company);
        c.setJob(job);
        c.setEmail(email);
        c.setPhone(phone);
        c.setWebsite(website);
        c.setMphone(mphone);
        c.setState(state);
        c.setSource(source);
        c.setCreateBy(createBy);
        c.setCreateTime(createTime);
        c.setDescription(description);
        c.setContactSummary(contactSummary);
        c.setNextContactTime(nextContactTime);
        c.setAddress(address);

        ClueService cs = (ClueService)ServiceFactory.getService(new ClueServiceImpl());
        boolean flag = cs.save(c);
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
