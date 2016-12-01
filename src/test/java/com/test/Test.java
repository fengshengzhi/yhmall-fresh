/**
 * @Title: Test.java
 * @Copyright (C) 2016 约惠(上海)实业有限公司
 * @Description:
 * @Revision History:
 * @Revision 1.0 2016年7月19日  冯升志
 */
 

package com.test;

import java.util.List;
import java.util.Map;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yhmall.fresh.service.UserService;

/**
 * @ClassName: Test
 * @Description: Description of this class
 * @author <a href="mailto:fsz19900908@163.com">冯升志</a> 于 2016年7月19日 下午3:05:54
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class Test {
	
	@Autowired
	UserService  userService;
	
	@org.junit.Test
	public void test1() {
		List<Map> user = userService.getUser();
		System.out.println(userService);
		System.out.println(user.get(0).get("name"));
	}

}
