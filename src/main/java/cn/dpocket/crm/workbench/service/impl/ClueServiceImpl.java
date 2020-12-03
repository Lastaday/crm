package cn.dpocket.crm.workbench.service.impl;

import cn.dpocket.crm.utils.SqlSessionUtil;
import cn.dpocket.crm.workbench.dao.ClueDao;
import cn.dpocket.crm.workbench.service.ClueService;

/**
 * ClassName:ClueServiceImpl
 * Package:cn.dpocket.crm.workbench.service.impl
 * Description:
 * Date:2020/12/3 14:33
 * Author: anson
 */
public class ClueServiceImpl implements ClueService{
    private ClueDao clueDao = SqlSessionUtil.getSession().getMapper(ClueDao.class);
}
