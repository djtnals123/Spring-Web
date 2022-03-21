package com.test.a;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class A {
	public A() {
		
	}
	
	@Around("within(com.test.a.*)")
	public Object methodd(ProceedingJoinPoint jointpoint) throws Throwable{ //arround¾Æ´Ï¸é JointPoint
		try{
			System.out.println("before");
			Object obj=jointpoint.proceed();
			System.out.println("after");
			return obj;
		}finally{
		}
	}
}