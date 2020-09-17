package cn.dpocket.crm.settings.service.impl;

import cn.dpocket.crm.exception.LoginException;
import cn.dpocket.crm.settings.dao.UserDao;
import cn.dpocket.crm.settings.domain.User;
import cn.dpocket.crm.settings.service.UserService;
import cn.dpocket.crm.utils.DateTimeUtil;
import cn.dpocket.crm.utils.SqlSessionUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:UserServiceImpl
 * Package:cn.dpocket.crm.settings.service.impl
 * Description:
 * Date:2020/9/3 16:28
 * Author: anson
 */
public class UserServiceImpl implements UserService{
    private UserDao userDao = SqlSessionUtil.getSession().getMapper(UserDao.class);

    public User login(String loginAct, String loginPwd, String ip) throws LoginException {
        Map<String, String> map = new HashMap<String,String>();
        map.put("loginAct", loginAct);
        map.put("loginPwd", loginPwd);
        User user = userDao.login(map);
        System.out.println("user======================" + user);
        if(user == null){
            throw new LoginException("账号或密码错误！");
        }

        //验证失效时间
        String expireTime = user.getExpireTime();
        System.out.println(expireTime);
        String currentTime = DateTimeUtil.getSysTime();
        System.out.println(currentTime);
        if(expireTime.compareTo(currentTime) < 0){
            throw new LoginException("账号已失效！");
        }

        //判断锁定状态
        String lockState = user.getLockState();
        if("0".equals(lockState)){
            throw new LoginException("账号被锁定，请联系管理员！");
        }

        //判断ip地址
        String allowIps = user.getAllowIps();
        System.out.println("allowIps==============" + allowIps);
        if(allowIps != null && allowIps.length()>0){
            if(!allowIps.contains(ip)){
                throw new LoginException("ip地址受限");
            }
        }

        return user;
    }
}
