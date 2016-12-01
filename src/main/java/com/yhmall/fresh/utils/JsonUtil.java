package com.yhmall.fresh.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Json操作工具类
 */
public final class JsonUtil {
    private JsonUtil() {
    }

    /**
     * 将 Map 转换成 json 字符串
     * @param map
     * @return
     */
    public static String convertMap2Json(Map map){
        return JSONObject.toJSONString(map);
    }

    /**
     * 将json格式的字符串解析成Map对象 <li>
     * json格式：{"name":"admin","retries":"3fff","testname"
     * :"ddd","testretries":"fffffffff"}
     */
    public static Map<String, String> toHashMap(String object)
    {
        Map<String, String> data = new HashMap<>();
        // 将json字符串转换成jsonObject
        JSONObject jsonObject = JSON.parseObject(object);
        Set<String> it = jsonObject.keySet();
        // 遍历jsonObject数据，添加到Map对象
        for(String s: it){
            String key = s ;
            Object value = jsonObject.get(key);
            data.put(key, String.valueOf(value));
        }


        return data;
    }

    /**
     * 将json转成对象
     *
     * @param text      json对应String
     * @param classType 类型
     * @param <T>
     * @return
     */
    public static <T> T parseObject(String text, Class<T> classType) {
        return JSON.parseObject(text, classType);
    }

    /**
     * 对象转换为Json
     * @param object
     * @return
     */
    public static String toJSONString(Object object) {
        return JSON.toJSONString(object);
    }


}
