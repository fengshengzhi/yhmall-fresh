package com.yhmall.fresh.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

@SuppressWarnings("unchecked")
public class MModuleSpringUtils {
	
	static ApplicationContext context = null;
	
	public static void init(String xmlFilename){
		context = new FileSystemXmlApplicationContext(xmlFilename);
	}
	public static void setApplicationContext(ApplicationContext applicationContext){
		context = applicationContext;
	}

	public static ApplicationContext getContext() {
		return context;
	}

	public static <T> T getBean(String name) {
		return (T)context.getBean(name);
	}

	public static <T> T getBean(Class<T> requiredType) {
        // String shortClassName = ClassUtils.getShortName(requiredType);
        // String beanName = Introspector.decapitalize(shortClassName);
        // return (T)context.getBean(beanName, requiredType);
		return (T)context.getBean(requiredType.getName(), requiredType);
	}

}
