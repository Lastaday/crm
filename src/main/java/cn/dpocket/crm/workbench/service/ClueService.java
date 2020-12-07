package cn.dpocket.crm.workbench.service;

import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.domain.Activity;
import cn.dpocket.crm.workbench.domain.Clue;

import java.util.List;
import java.util.Map; /**
 * ClassName:ClueService
 * Package:cn.dpocket.crm.workbench.service
 * Description:
 * Date:2020/12/3 14:33
 * Author: anson
 */
public interface ClueService {
    boolean save(Clue c);

    PaginationVO<Clue> pageList(Map<String, Object> map);

    Clue detail(String id);

    List<Activity> getActivityListByClueId(String clueId);

    boolean unbind(String id);

    boolean bind(String cid, String[] aids);
}
