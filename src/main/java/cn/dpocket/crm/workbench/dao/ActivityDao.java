package cn.dpocket.crm.workbench.dao;

import cn.dpocket.crm.workbench.domain.Activity;

import java.util.List;
import java.util.Map; /**
 * ClassName:ActivityDao
 * Package:cn.dpocket.crm.workbench.dao
 * Description:
 * Date:2020/9/21 16:00
 * Author: anson
 */
public interface ActivityDao {
    int save(Activity a);

    List<Activity> getActivityListByCondition(Map<String, Object> map);

    int getTotalByCondition(Map<String, Object> map);

    int deleteByAids(String[] ids);

    Activity getById(String id);

    int update(Activity a);

    Activity detail(String id);
}
