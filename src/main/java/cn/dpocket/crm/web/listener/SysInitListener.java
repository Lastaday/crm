package cn.dpocket.crm.web.listener;

import cn.dpocket.crm.settings.domain.DicValue;
import cn.dpocket.crm.settings.service.DicService;
import cn.dpocket.crm.settings.service.impl.DicServiceImpl;
import cn.dpocket.crm.utils.ServiceFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * ClassName:SysInitListener
 * Package:cn.dpocket.crm.web.listener
 * Description:
 * Date:2020/12/3 16:48
 * Author: anson
 */
public class SysInitListener implements ServletContextListener{
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("上下文域对象创建了");

        ServletContext application = sce.getServletContext();
        DicService ds = (DicService)ServiceFactory.getService(new DicServiceImpl());
        Map<String, List<DicValue>> map = ds.getAll();
        Set<String> set = map.keySet();
        for(String key: set){
//            System.out.println(key);
            application.setAttribute(key, map.get(key));
        }
//        System.out.println(map);
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
