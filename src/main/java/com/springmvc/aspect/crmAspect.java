package com.springmvc.aspect;



import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.springmvc.helper.datehelper;




@Aspect
@Component
public class crmAspect extends HandlerInterceptorAdapter {
	
	@Autowired
	HttpServletRequest request;
	
	//private Logger myLogger = Logger.getLogger(getClass().getName());
	
	@Pointcut("execution(* com.springmvc.controller.*.*(..))")
	private void forControllerPackage() {}
	
	
	@Pointcut("execution(* com.springmvc.service.*.*(..))")
	private void forServicePackage() {}
	

	@Pointcut("execution(* com.springmvc.dao.*.*(..))")
	private void forDaoPackage() {}
	
	
	@Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
	private void forAppFlow() {}
	
	
	@Before("forControllerPackage()")
	public void beforecontroller(JoinPoint joinpoint) {
		System.err.println(datehelper.now());
		System.err.println(datehelper.toStringTime(null));
		System.err.println(joinpoint.getSignature());
		System.out.println(request.getRequestURL());
	}


//
//	
//	@Before("forDaoPackage()")
//	public void beforedao(JoinPoint joinpoint) {
//		System.out.println("you call DAO");
//	}
//	
//	@Before("forServicePackage()")
//	public void beforeservice(JoinPoint joinpoint) {
//		System.out.println("you call Service");
//	}

//	@After("forAppFlow()")
//	public void aftertest(JoinPoint joinpoint) {
////		String method = joinpoint.getSignature().toShortString();
////		System.out.println("after method:" + method);
//	}
	
}
