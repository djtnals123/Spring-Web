package com.test.a;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.sumin.spring.config.DataSourceConfig;

public class Main {

	public static void main(String[] args) {
//		String config = "classpath:applicationCTX.xml";
//		AbstractApplicationContext ctx = new GenericXmlApplicationContext(config);
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(DataSourceConfig.class);
//		B b = ctx.getBean("b", B.class);
//		b.hi();
		System.out.println("hd");
	}

}
