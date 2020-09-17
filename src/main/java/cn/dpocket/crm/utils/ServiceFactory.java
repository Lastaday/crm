package cn.dpocket.crm.utils;

/**
 * ClassName:ServiceFactory
 * Package:cn.dpocket.crm.utils
 * Description:
 * Date:2020/9/7 15:41
 * Author: anson
 */
public class ServiceFactory {
    public static Object getService(Object service){
        return new TransactionInvocationHandler(service).getProxy();
    }
}
