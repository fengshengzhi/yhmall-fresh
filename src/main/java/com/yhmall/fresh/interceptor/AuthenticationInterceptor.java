package com.yhmall.fresh.interceptor;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yhmall.fresh.utils.WebUtils;

/**
 * 登录 权限等拦截器 **
 */
public class AuthenticationInterceptor implements HandlerInterceptor {
	
	private PathMatcher pathMatcher = new AntPathMatcher();
	private List<String> excludedUrls;
/*	@Autowired
	private IMenuService menuService;
	@Autowired
	private IAdminService adminService;*/
	
	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}

	public boolean preHandle(HttpServletRequest request, 
	        HttpServletResponse response, Object handler) throws Exception {
	/*	String uri = request.getRequestURI();
		//过滤不需要拦截的
        for (String url : this.excludedUrls) {
            if (uri.contains(url)) {
                return true;            
            }
        }
        //判断用户是否登录状态
        String adminId = null;
        int type = 0;
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
		    Cookie autoCookie = null;
		    boolean islogin = false;
		    boolean isAutologin = false;
			for (Cookie cookie : cookies) {
				if ("yhmall_session_id".equals(cookie.getName())) {
				    String value = cookie.getValue().toString();
				    AdminPo dto =JsonUtil.parseObject(value, AdminPo.class);
				    adminId = dto.getId();
				    type = dto.getType();
				    islogin = true;
				    
				} else if("autologin".equals(cookie.getName())) {
				    isAutologin =true;
				    autoCookie = cookie;
				}
			}
			if(!islogin) {//没有登录需要登录
			    if(isAutologin) {
	                //自动登录
	                if(autoCookie==null) {
	                    response.sendRedirect(request.getContextPath() + "/admin/tologin");
	                    return false;  
	                } else {
	                    // 获取cookie值  
	                    String value = autoCookie.getValue();  
	                    // 拆分cookie的值  
	                    String temp[] = value.split(":");  
	                    System.out.println(temp.length);  
	                    // 判断长度 是否等于自己拼接的长度  
	                    if (temp.length != 3) {  
	                        // 如果不等于3,则继续执行login.jsp页面  
	                        response.sendRedirect(request.getContextPath() + "/admin/tologin");
	                        return false;  
	                    } else {
	                        // 获取cookie拆分的各个值  
	                        String name = temp[0]; // 用户名  
	                        String time = temp[1];// 获取有效时间  
	                        // 判断cookie是否失效  
	                        if (Long.valueOf(time) <= System.currentTimeMillis()) {  
	                            // 如果失效,则继续执行login页面  
	                            response.sendRedirect(request.getContextPath() + "/admin/tologin");
	                            return false;  
	                        }  
	              
	                        // 如果cookie没有失效,根据用户名,去查询用户信息  
	                        List<AdminPo> pos = adminService.queryByUserName(name);
	                        if(pos!=null&&pos.size()>0) {
	                            AdminPo po = pos.get(0);
	                            request.setAttribute("adminPo", po);
	                            adminId = po.getId();
	                            type = po.getType();
	                            //存入cokie
	                            Cookie cookie = new Cookie("yhmall_session_id",JSON.toJSONString(po));
	                            cookie.setPath("/");
	                            //cookie.setMaxAge(1*60*60);
	                            response.addCookie(cookie); 
	                        } else {
	                            // 则继续执行login页面  
	                            response.sendRedirect(request.getContextPath() + "/admin/tologin");
	                            return false;
	                        }
	                    } 
	                }
	            } else {
	                response.sendRedirect(request.getContextPath() + "/admin/tologin");
	                return false;
	            }
			}
		} else {
		    //跳转登录页面
		    response.sendRedirect(request.getContextPath() + "/admin/tologin");
            return false;
		}
		//加载菜单信息
		if(adminId!=null&&adminId.length()>0){
		  List<Map<String, Object>> menupo = menuService.queryUserMenu(adminId, type);
		  request.setAttribute("menus", menupo);
		}*/
		return true;
	}
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	protected boolean pathsMatch(String path, ServletRequest request) {
		String requestURI = getPathWithinApplication(request);

		return pathsMatch(path, requestURI);
	}

	protected boolean pathsMatch(String pattern, String path) {
		return this.pathMatcher.match(pattern, path);
	}

	protected String getPathWithinApplication(ServletRequest request) {
		return WebUtils.getPathWithinApplication((HttpServletRequest) request);
	}
}
