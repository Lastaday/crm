package cn.dpocket.crm.workbench.dao;

import cn.dpocket.crm.workbench.domain.Activity;
import cn.dpocket.crm.workbench.domain.Clue;

import java.util.List;
import java.util.Map;

public interface ClueDao {

    int save(Clue c);

    int getTotalByCondition(Map<String, Object> map);

    List<Clue> getClueListByCondition(Map<String, Object> map);

    Clue detail(String id);

    List<Activity> getActivityListByClueId(String clueId);


}
