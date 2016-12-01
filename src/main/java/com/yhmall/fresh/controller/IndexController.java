/**
 * @Title: TestIndex.java
 * @Copyright (C) 2016 约惠(上海)实业有限公司
 * @Description:
 * @Revision History:
 * @Revision 1.0 2016年7月8日  冯升志
 */
 

package com.yhmall.fresh.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhmall.fresh.controller.base.BaseController;
import com.yhmall.fresh.model.UserModel;
import com.yhmall.fresh.service.UserService;

/**
 * @ClassName: TestIndex
 * @Description: Description of this class
 * @author <a href="mailto:fsz19900908@163.com">冯升志</a> 于 2016年7月8日 下午2:49:05
 */
@Controller
@RequestMapping("/app")
public class IndexController extends BaseController {
	@Autowired
	UserService  userService;
	@RequestMapping("/test")
	public void test (String a) {
	/*	UserModel user = userService.getUser();*/
		System.out.println(userService);
		System.out.println(111);
		System.out.println(222);
		
		/*System.out.println(user.getName());*/
	}
}
