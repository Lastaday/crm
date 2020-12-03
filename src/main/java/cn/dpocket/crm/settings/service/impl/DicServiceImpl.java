package cn.dpocket.crm.settings.service.impl;


import cn.dpocket.crm.settings.dao.DicTypeDao;
import cn.dpocket.crm.settings.dao.DicValueDao;

import cn.dpocket.crm.settings.domain.DicType;
import cn.dpocket.crm.settings.domain.DicValue;
import cn.dpocket.crm.settings.service.DicService;

import cn.dpocket.crm.utils.SqlSessionUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName:UserServiceImpl
 * Package:cn.dpocket.crm.settings.service.impl
 * Description:
 * Date:2020/9/3 16:28
 * Author: anson
 */
public class DicServiceImpl implements DicService{
    private DicTypeDao dicTypeDao = SqlSessionUtil.getSession().getMapper(DicTypeDao.class);
    private DicValueDao dicValueDao = SqlSessionUtil.getSession().getMapper(DicValueDao.class);

    public Map<String, List<DicValue>> getAll() {
        Map<String, List<DicValue>> map = new HashMap<String, List<DicValue>>();
        // 将字段类型列表取出
        List<DicType> dtList = dicTypeDao.getTypeList();
        for(DicType dt: dtList){
            String code = dt.getCode();
            List<DicValue> dvList = dicValueDao.getListByCode(code);
            map.put(code, dvList);
        }
        return map;
    }
}
