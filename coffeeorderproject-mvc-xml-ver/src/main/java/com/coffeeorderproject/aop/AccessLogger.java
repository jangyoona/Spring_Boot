package com.coffeeorderproject.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.coffeeorderproject.spring.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;

@Aspect
public class AccessLogger {
	
	@Before("execution(* com.coffeeorderproject.spring.controller.*.*(..))")
//	@Before("within(com.coffeeorderproject.spring.controller.*)")
	public void userRequestUri(JoinPoint joinpoint) { // track ?
		
		ServletRequestAttributes attrs = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes(); // 현재 웹 요청 정보를 가져옴
		
		if(attrs != null) {
			HttpServletRequest req = attrs.getRequest();
			UserDto loginUser = (UserDto)req.getSession().getAttribute("loginUser") ;
			String uri = req.getRequestURI();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			System.out.printf("사용자 요청경로 : %s\n", attrs);
			
			System.out.printf("로그인 유저 : [%s][%s][%s]\n", loginUser != null ? loginUser.getUserId() : "GUEST", sdf.format(new Date()), uri);
		}
		
	}
}
