package cn.dpocket.crm.settings.service;

import cn.dpocket.crm.exception.LoginException;
import cn.dpocket.crm.settings.domain.User;

import java.util.List;

/**
 * ClassName:UserService
 * Package:cn.dpocket.crm.settings.service
 * Description:
 * Date:2020/9/3 16:28
 * Author: anson
 */
public interface UserService {
    User login(String loginAct, String loginPwd, String ip) throws LoginException;

    List<User> getUserList();
}
