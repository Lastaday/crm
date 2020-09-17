package cn.dpocket.crm.utils;

import java.util.UUID;

/**
 * ClassName:UUIDUtil
 * Package:cn.dpocket.crm.utils
 * Description:
 * Date:2020/9/3 14:19
 * Author: anson
 */
public class UUIDUtil {
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
