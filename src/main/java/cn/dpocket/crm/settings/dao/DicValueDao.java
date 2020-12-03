package cn.dpocket.crm.settings.dao;

import cn.dpocket.crm.settings.domain.DicValue;

import java.util.List;

/**
 * ClassName:UserDao
 * Package:cn.dpocket.crm.settings.dao
 * Description:
 * Date:2020/9/3 16:22
 * Author: anson
 */
public interface DicValueDao {

    List<DicValue> getListByCode(String code);
}
