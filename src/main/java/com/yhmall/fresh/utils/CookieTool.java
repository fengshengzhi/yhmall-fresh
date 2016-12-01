package com.yhmall.fresh.utils;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class CookieTool {

	public static String cookieDomain = "";

	public static String cookiePath = "/";
	
	/**
	 * 获取COOKIE
	 * @param request
	 * @param name
	 */
	public static Cookie getCookie(HttpServletRequest request, String name) 
	{
		Cookie[] cookies = request.getCookies();
		if(cookies == null)
			return null;
		for (int i = 0; i < cookies.length; i++) 
		{
			if (name.equals(cookies[i].getName())) 
			{
				return cookies[i];
			}
		}
		return null;
	}

	/**
	 * 设置COOKIE
	 * @param request
	 * @param response
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public static void setCookie(HttpServletResponse response, String name,
			String value, int maxAge) 
	{
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		if(cookieDomain!=null && cookieDomain.indexOf('.')!=-1)
		{
			cookie.setDomain('.' + cookieDomain);
		}
		cookie.setPath(cookiePath);
		response.addCookie(cookie);
	}
	
	/**
	 * 设置COOKIE
	 * @param request
	 * @param response
	 * @param name
	 * @param value
	 */
	public static void setCookie(HttpServletResponse response, String name,
			String value) 
	{
		Cookie cookie = new Cookie(name, value);
		if(cookieDomain!=null && cookieDomain.indexOf('.')!=-1)
		{
			cookie.setDomain('.' + cookieDomain);
		}
		cookie.setPath(cookiePath);
		response.addCookie(cookie);
	}
	
	/**
	 * 从URL地址中解析出URL前缀，例如
	 * http://www.sina.com.cn:8081/index.jsp -> http://www.sina.com.cn:8081
	 * @param request
	 * @return
	 */
	public static String getUrlPrefix(HttpServletRequest request)
	{
		StringBuffer url = new StringBuffer(request.getScheme());
		url.append("://");
		url.append(request.getServerName());
		int port = request.getServerPort();
		if(port!=80)
		{
			url.append(":");
			url.append(port);
		}
		return url.toString();
	}
	
	/**
	 * 获取访问的URL全路径
	 * @param request
	 * @return
	 */
	public static String getRequestURL(HttpServletRequest request)
	{
		StringBuffer url = new StringBuffer(request.getRequestURI());
		String param = request.getQueryString();
		if(param!=null){
			url.append('?');
			url.append(param);
		}
		String path = url.toString();
		return path.substring(request.getContextPath().length());
	}
	
	  
		 /**
		 * @author : xusq
		 * @date : 2015年8月4日 下午6:37:54
		 * @Description: 获取购物车信息Cookie值（Redis Key）
		 */
		/*public static String getRedisKey(HttpServletRequest request,HttpServletResponse response,UserSession userSession) {
			
			*//** 获取购物车信息Cookie *//*
			Cookie cart_Cookie = CookieTool.getCookie(request, Constants.REDIS_KEY);

			*//** Cookie为空时，返回Null *//*
			if (cart_Cookie == null || StringUtils.isBlank(cart_Cookie.getValue())) {
				
				Integer userId = 0;
//				        getCurrentUserId(request,userSession);
				
				if(null == userId || userId == 0){
					
					String redisValue = UUID.randomUUID().toString();
					
					CookieTool.setCookie(response, Constants.REDIS_KEY, redisValue, 60*60*24*7);
					
					return redisValue;
					
				} else {
					
					return null;
				}
			}

			*//** 返回Cookie值 *//*
			return cart_Cookie.getValue();
			
		}*/
	    
//	    /**
//		 * @author : xusq
//		 * @date : 2015年8月1日 上午10:59:34
//		 * @Description: 获取当前用户Id
//		 */
//	    public  static Integer getCurrentUserId(HttpServletRequest request,UserSession userSession) {
//	    	
//	    	Integer id = null;
//	    	if(null != userSession && null != userSession.getUser()){
//	    		id = userSession.getUser().getId();
//	    	}
//	    	return id;
//	      
//	    }
//	    
	    
}
