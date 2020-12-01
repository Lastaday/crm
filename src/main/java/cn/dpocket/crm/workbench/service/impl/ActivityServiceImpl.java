package cn.dpocket.crm.workbench.service.impl;

import cn.dpocket.crm.settings.dao.UserDao;
import cn.dpocket.crm.settings.domain.User;
import cn.dpocket.crm.utils.SqlSessionUtil;
import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.dao.ActivityDao;
import cn.dpocket.crm.workbench.dao.ActivityRemarkDao;
import cn.dpocket.crm.workbench.domain.Activity;
import cn.dpocket.crm.workbench.domain.ActivityRemark;
import cn.dpocket.crm.workbench.service.ActivityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * ClassName:ActivityServiceImpl
 * Package:cn.dpocket.crm.workbench.service.impl
 * Description:
 * Date:2020/9/21 16:09
 * Author: anson
 */
public class ActivityServiceImpl implements ActivityService{
    private ActivityDao activityDao = SqlSessionUtil.getSession().getMapper(ActivityDao.class);
    private ActivityRemarkDao activityRemarkDao = SqlSessionUtil.getSession().getMapper(ActivityRemarkDao.class);
    private UserDao userDao = SqlSessionUtil.getSession().getMapper(UserDao.class);

    public boolean save(Activity a) {
        boolean flag = true;
        int count = activityDao.save(a);
        if(count != 1){
            flag = false;
        }
        return flag;
    }

    public PaginationVO<Activity> pageList(Map<String, Object> map) {
        // 取得total
        int total = activityDao.getTotalByCondition(map);
        // 取得dataList
        List<Activity> dataList = activityDao.getActivityListByCondition(map);
        // 将total和dataList封装到vo中
        PaginationVO<Activity> vo = new PaginationVO<Activity>();
        vo.setTotal(total);
        vo.setDataList(dataList);

        // 将vo返回
        return vo;
    }

    public boolean delete(String[] ids) {
        boolean flag = true;
        // 查询需要删除的备注数
        int count1 = activityRemarkDao.getCountByAids(ids);
        // 删除备注数
        int count2 = activityRemarkDao.deleteByAids(ids);
        if(count1 != count2){
            flag = false;
        }
        // 删除活动
        int count3 = activityDao.deleteByAids(ids);
        if(count3 != ids.length){
            flag = false;
        }
        return flag;
    }

    public Map<String, Object> getUserListAndActivity(String id) {
        // 取uList
        List<User> uList = userDao.getUserList();
        // 取a
        Activity a = activityDao.getById(id);
        // 将uList和a打包成map返回
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("uList", uList);
        map.put("a", a);
        return map;
    }

    public boolean update(Activity a) {
        boolean flag = true;
        int count = activityDao.update(a);
        if(count != 1){
            flag = false;
        }
        return flag;
    }

    public Activity detail(String id) {
        Activity a = activityDao.detail(id);
        return a;
    }

    public List<ActivityRemark> getRemarkListByAid(String aid) {
        List<ActivityRemark> arList = activityRemarkDao.getRemarkListByAid(aid);
        return arList;
    }

    public boolean deleteRemark(String id) {
        boolean flag = true;
        int count = activityRemarkDao.deleteRemark(id);
        if(count != 1){
            flag = false;
        }
        return flag;
    }
}
