package cn.dpocket.crm.utils;

import org.apache.ibatis.session.SqlSession;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * ClassName:TransactionInvocationHandler
 * Package:cn.dpocket.crm.utils
 * Description:
 * Date:2020/9/3 16:31
 * Author: anson
 */
public class TransactionInvocationHandler implements InvocationHandler{

    private Object target;

    public TransactionInvocationHandler(Object target){
        this.target = target;
    }

    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        SqlSession session = null;
        Object obj = null;
        try {
            session = SqlSessionUtil.getSession();
            obj = method.invoke(target, args);
            session.commit();
        }catch (Exception e){
            session.rollback();
            e.printStackTrace();

            //处理什么异常，继续往上抛什么异常
            throw e.getCause();
        }finally {
            SqlSessionUtil.myClose(session);
        }

        return obj;
    }

    public Object getProxy(){
        return Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), this);
    }
}
