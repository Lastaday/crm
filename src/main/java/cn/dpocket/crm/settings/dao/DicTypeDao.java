package cn.dpocket.crm.settings.dao;

import cn.dpocket.crm.settings.domain.DicType;
import cn.dpocket.crm.settings.domain.User;

import java.util.List;
import java.util.Map;

/**
 * ClassName:UserDao
 * Package:cn.dpocket.crm.settings.dao
 * Description:
 * Date:2020/9/3 16:22
 * Author: anson
 */
public interface DicTypeDao {

    List<DicType> getTypeList();
}
