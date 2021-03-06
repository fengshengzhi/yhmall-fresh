package com.yhmall.fresh.controller.base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yhmall.fresh.utils.Des;
import com.yhmall.fresh.utils.Token;
import com.yhmall.fresh.utils.TypeConverter;



 /**
  * 
  * @author zwt
  *
  */
public class BaseController {
  /*  @Autowired
    protected IAdminSessionService adminSessionService;
    @Autowired
    protected IAdminService adminService;*/
	
	/**
	 * 此方法用于日期的转换.
	 * @param binder date
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	 /**
     * 功能：获取当前由用户 getCurrentUser.
     * @return String
     */
     public String getCurrentUser(){
	       return null;
	    }
    
    protected String successJson(String...kvs){
		JsonObject json = new JsonObject();
		json.addProperty("success", true);
		if(kvs==null || kvs.length==0){
			return json.toString();
		}
		for(int i=0,len=kvs.length;(i+1)<len;i+=2){
			json.addProperty(kvs[i], kvs[i+1]);
		}			
		return json.toString();
	}
    
    
  	protected String successJson(Object... kvs) {
  		JSONObject json = new JSONObject();
  		json.put("success", true);
  		if (kvs == null || kvs.length == 0) {
  			return json.toString();
  		}
  		for (int i = 0, len = kvs.length; (i + 1) < len; i += 2) {
  			json.put(""+kvs[i], kvs[i + 1]);
  		}
  		return json.toString();
  	}
  	
  	protected String successJson(String msg,Object obj) {
  		JSONObject json = new JSONObject();
  		json.put("success", true);
  		json.put("msg", msg);
  		json.put("data", obj);
  		return json.toString();
  	}
	
	protected String errorJson(String msg){
		JsonObject json = new JsonObject();
		json.addProperty("success", false);
		json.addProperty("msg", msg);
		return json.toString();
	}
	/**
	* @Title: sucThirdMap 
	* @Description:(第三方接口成功时返回) 
	* @author create by yushengwei @ 2015年9月14日 下午5:07:53 
	* @param @return 
	* @return Map<String,Object> 返回类型 
	* @throws
	 */
	public Map<String,Object> sucThirdMap(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", 1);/**成功*/
		return map;
		
	}
	
	/**
	* @Title: errThirdMap 
	* @Description:(第三方接口失败时返回) 
	* @author create by yushengwei @ 2015年9月14日 下午5:08:19 
	* @param @param errDetail
	* @param @return 
	* @return Map<String,Object> 返回类型 
	* @throws
	 */
	public Map<String,Object> errThirdMap(String errDetail){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", 0);/**失败*/
		map.put("error",errDetail);
		return map;
	}
	
	/**
	* @Title: toJson 
	* @Description:(返回json串) 
	* @author create by yushengwei @ 2015年9月14日 下午5:11:46 
	* @param @param obj
	* @param @return 
	* @return String 返回类型 
	* @throws
	 */
	public String toJson(Object obj){
		return new Gson().toJson(obj);
	}
	
	/*public AdminPo getAdminPoByCookie(HttpServletRequest request){
	    AdminPo po = null;
		Cookie[] cookie = request.getCookies();
		for (int i = 0; i < cookie.length; i++) {
		Cookie cook = cookie[i];
		if(cook.getName().equalsIgnoreCase("yhmall_session_id")) { //获取键
		    String value = cook.getValue().toString();
		    po = JsonUtil.parseObject(value, AdminPo.class);
		    break;
		}
		} 
		if (po == null) {
		    po = (AdminPo) request.getAttribute("adminPo");
		}
		return po;
	}*/
	
	public Token getToken(HttpServletRequest request){
		String token = request.getParameter("token").replaceAll(" ","+");
		//参数不能微空
        String[] fields = null;
        //解密字符串
        String code = null;
        Token t  = null;
        try {
            code = Des.decryptDES(token,"f7451ca8");
            fields = code.split(",");
            
            String fieldSalt = fields[0];
            String fieldUID = fields[1];
            String fieldTimeStamp = fields[2];
            String fieldVersion = fields[3];
            String fieldPwdUpdateTime = fields[4];
            String filedUserName = fields[5];
            String filePassword  ="";
            if(fields.length > 6)
                filePassword  = fields[6];
            
            t = new Token(fieldVersion, TypeConverter.parseLong(fieldTimeStamp),
                    TypeConverter.parseInt(fieldSalt), TypeConverter.parseLong(fieldUID), TypeConverter.parseLong(fieldPwdUpdateTime),filedUserName,filePassword);
        } catch (Exception e) {
        }
        return t;
	}
	
	public long getUserId(HttpServletRequest request){
        Token t  = this.getToken(request);
        if(t!=null)
        	return t.getUserId();
        return 0;
	}
}
