package cn.dpocket.crm.workbench.service;

import cn.dpocket.crm.vo.PaginationVO;
import cn.dpocket.crm.workbench.domain.Activity;

import java.util.Map; /**
 * ClassName:ActivityService
 * Package:cn.dpocket.crm.workbench.service
 * Description:
 * Date:2020/9/21 16:08
 * Author: anson
 */
public interface ActivityService {
    boolean save(Activity a);

    PaginationVO<Activity> pageList(Map<String, Object> map);

    boolean delete(String[] ids);

    Map<String,Object> getUserListAndActivity(String id);

    boolean update(Activity a);

    Activity detail(String id);
}
