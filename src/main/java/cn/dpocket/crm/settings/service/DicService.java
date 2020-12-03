package cn.dpocket.crm.settings.service;

import cn.dpocket.crm.exception.LoginException;
import cn.dpocket.crm.settings.domain.DicValue;
import cn.dpocket.crm.settings.domain.User;

import java.util.List;
import java.util.Map;

/**
 * ClassName:UserService
 * Package:cn.dpocket.crm.settings.service
 * Description:
 * Date:2020/9/3 16:28
 * Author: anson
 */
public interface DicService {

    Map<String,List<DicValue>> getAll();
}
