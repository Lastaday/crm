package cn.dpocket.crm.workbench.dao;

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
}
