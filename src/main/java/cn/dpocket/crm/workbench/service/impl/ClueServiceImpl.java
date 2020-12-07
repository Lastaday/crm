package cn.dpocket.crm.workbench.service.impl;

import cn.dpocket.crm.utils.SqlSessionUtil;
import cn.dpocket.crm.utils.UUIDUtil;
import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.dao.ClueActivityRelationDao;
import cn.dpocket.crm.workbench.dao.ClueDao;
import cn.dpocket.crm.workbench.domain.Activity;
import cn.dpocket.crm.workbench.domain.Clue;
import cn.dpocket.crm.workbench.domain.ClueActivityRelation;
import cn.dpocket.crm.workbench.service.ClueService;

import java.util.List;
import java.util.Map;

/**
 * ClassName:ClueServiceImpl
 * Package:cn.dpocket.crm.workbench.service.impl
 * Description:
 * Date:2020/12/3 14:33
 * Author: anson
 */
public class ClueServiceImpl implements ClueService{
    private ClueDao clueDao = SqlSessionUtil.getSession().getMapper(ClueDao.class);
    private ClueActivityRelationDao  clueActivityRelationDao = SqlSessionUtil.getSession().getMapper(ClueActivityRelationDao.class);

    public boolean save(Clue c) {
        boolean flag = true;
        int count = clueDao.save(c);
        if(count != 1){
            flag = false;
        }
        return flag;
    }

    public PaginationVO<Clue> pageList(Map<String, Object> map) {
        int total = clueDao.getTotalByCondition(map);
        // 取得dataList
        List<Clue> dataList = clueDao.getClueListByCondition(map);
        // 将total和dataList封装到vo中
        PaginationVO<Clue> vo = new PaginationVO<Clue>();
        vo.setTotal(total);
        vo.setDataList(dataList);
        return vo;
    }

    public Clue detail(String id) {
        Clue c = clueDao.detail(id);
        return c;
    }

    public List<Activity> getActivityListByClueId(String clueId) {
        List<Activity> aList = clueDao.getActivityListByClueId(clueId);
        return aList;
    }

    public boolean unbind(String id) {
        boolean flag = true;
        int count = clueActivityRelationDao.unbind(id);
        if(count != 1){
            flag = false;
        }
        return flag;
    }

    public boolean bind(String cid, String[] aids) {
        boolean flag = true;
        for(String aid: aids){
            ClueActivityRelation car = new ClueActivityRelation();
            String id = UUIDUtil.getUUID();
            car.setId(id);
            car.setClueId(cid);
            car.setActivityId(aid);
            int count = clueActivityRelationDao.bind(car);
            if(count != 1){
                flag = false;
            }
        }

        return flag;
    }
}
