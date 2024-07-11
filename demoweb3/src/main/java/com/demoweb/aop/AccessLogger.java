package com.demoweb.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.demoweb.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;

@Aspect
public class AccessLogger {
	
	@Before("execution(* com.demoweb.controller.*.*(..))")
//	@After("within(com.demoweb.controller.*)")
	public void userRequestUri(Joinpoint joinpoint) { // track ?
		ServletRequestAttributes attrs = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes(); // 현재 웹 요청 정보를 가져옴
		
		if(attrs != null) {
			HttpServletRequest req = attrs.getRequest();
			MemberDto loginUser = (MemberDto)req.getSession().getAttribute("loginUser") ;
			String uri = req.getRequestURI();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			System.out.printf("사용자 요청경로 : %s\n", attrs);
			
			System.out.printf("로그인 유저 : [%s][%s][%s]\n", loginUser != null ? loginUser.getMemberId() : "GUEST", sdf.format(new Date()), uri);
			
		}
		
//		String uri = req.getRequestURI();
//		String userId = (String)req.getSession().getAttribute("loginUser") ;
//		if(userId == null) {
//			userId = "Guest";
//		}
//		
//		System.out.printf("사용자 요청경로 : %s\n", uri);
//		System.out.printf("로그인 유저 : %s\n", userId);
		
	}

	
}
