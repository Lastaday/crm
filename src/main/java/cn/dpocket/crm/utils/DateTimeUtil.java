package cn.dpocket.crm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * ClassName:DateTimeUtil
 * Package:cn.dpocket.crm.utils
 * Description:
 * Date:2020/9/3 14:21
 * Author: anson
 */
public class DateTimeUtil {
    public static String getSysTime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String dateStr = sdf.format(date);
        return dateStr;
    }
}
