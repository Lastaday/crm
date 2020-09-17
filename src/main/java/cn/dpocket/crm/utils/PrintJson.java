package cn.dpocket.crm.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:PrintJson
 * Package:cn.dpocket.crm.utils
 * Description:
 * Date:2020/9/3 14:32
 * Author: anson
 */
public class PrintJson {

    //将boolean值解析为json串
    public static void printJsonFlag(HttpServletResponse response, boolean flag){
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("success", flag);
        ObjectMapper om = new ObjectMapper();
        String json = null;
        try {
            json = om.writeValueAsString(map);
            response.getWriter().print(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void printJsonObj(HttpServletResponse response, Object obj){

        ObjectMapper om = new ObjectMapper();

        try {
            String json = om.writeValueAsString(obj);
            response.getWriter().print(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
