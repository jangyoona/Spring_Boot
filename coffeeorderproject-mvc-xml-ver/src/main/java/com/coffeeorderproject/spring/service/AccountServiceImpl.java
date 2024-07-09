package com.coffeeorderproject.spring.service;


import java.util.ArrayList;

import com.coffeeorderproject.mapper.UserMapper;
import com.coffeeorderproject.spring.common.Util;
import com.coffeeorderproject.spring.dao.CartDao;
import com.coffeeorderproject.spring.dao.CartDaoImpl;
import com.coffeeorderproject.spring.dto.CartDto;
import com.coffeeorderproject.spring.dto.UserDto;

import lombok.Setter;

public class AccountServiceImpl implements AccountService {
	
	@Setter
	private UserMapper userMapper;
	
	// 회원가입
	@Override
	public void inputUser(UserDto user) {
		// 비번 암호화
		String hashedPasswd = Util.getHashedString(user.getUserPw(), "SHA-256");
		user.setUserPw(hashedPasswd);
		
		userMapper.insertUser(user);
	}
	
	// 중복 아이디 검사
	@Override
	public Boolean checkId(UserDto user) {
		Boolean isHave = userMapper.idCheck(user);
//		if(isHave == true) {
//			isHave = false;
//		} else {
//			isHave = true;
//		}

		return isHave;
	}
	
	//로그인
	@Override
	public UserDto signInUser(UserDto user) {
		String hashedPasswd = Util.getHashedString(user.getUserPw(), "SHA-256");
		user.setUserPw(hashedPasswd);
		
		UserDto member = userMapper.selectUser(user);
		
//		if(member != null) { // 정상 로그인이 아닐 경우 
//			// 쿠폰 테이블에 로그인 유저의 데이터가 있는지 조회 (쿠폰이 있는지)
//			CouponDao coupon = new CouponDao();
//			ArrayList<UserCouponDto> couponList = coupon.selectCouponList(user);
//			member.setUsercoupon(couponList);
//			
//			return member;
//		}
		

		return member;
	}
	
	
	
	// 사용자에게 Email 보내기
	@Override
	public UserDto getUserEmail(String id) {
		UserDto member = userMapper.selectUserEmail(id);
		return member;
	}
	
	// 사용자 PW Update
	@Override
	public void changeUserPw(String userId, String newPw) {
		// 비번 암호화
		System.out.println(userId + newPw);
		String hashedPasswd = Util.getHashedString(newPw, "SHA-256");
//		user.setUserPw(hashedPasswd);
		
		userMapper.updateUserPw(userId, hashedPasswd);
	}
	
	// Application에 저장될 유저 장바구니 목록
	@Override
	public ArrayList<CartDto> getUserCart(String userId) {
		CartDao cartDao = new CartDaoImpl();
		ArrayList<CartDto> userCartArr = cartDao.selectUserCart(userId);
		return userCartArr;
	}
	@Override
	public void deleteUser(String userId) {
		
		userMapper.updateUser(userId);
        
		
	}
}