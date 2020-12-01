package cn.dpocket.crm.workbench.dao;

import cn.dpocket.crm.workbench.domain.ActivityRemark;

import java.util.List;

/**
 * ClassName:ActivityRemarkDao
 * Package:cn.dpocket.crm.workbench.dao
 * Description:
 * Date:2020/9/21 16:01
 * Author: anson
 */
public interface ActivityRemarkDao {
    int getCountByAids(String[] ids);

    int deleteByAids(String[] ids);

    List<ActivityRemark> getRemarkListByAid(String aid);

    int deleteRemark(String id);
}
