package cn.dpocket.crm.workbench.dao;

import cn.dpocket.crm.workbench.domain.ClueActivityRelation;

import java.util.List;

public interface ClueActivityRelationDao {


    int unbind(String id);

    int bind(ClueActivityRelation car);
}
