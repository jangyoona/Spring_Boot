package com.coffeeorderproject.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.coffeeorderproject.mapper.MyPageMapper;
import com.coffeeorderproject.spring.common.Util;
import com.coffeeorderproject.spring.dao.CartDao;
import com.coffeeorderproject.spring.dao.CouponDao;
import com.coffeeorderproject.spring.dao.MyPageDao;
import com.coffeeorderproject.spring.dao.UserBoardDao;
import com.coffeeorderproject.spring.dao.UserOrderDao;
import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;

import lombok.Setter;

public class MyPageServiceImpl implements MyPageService {
	
	@Setter
	MyPageMapper myPageMapper;
	
	
//	비밀번호 암호화
	@Override
	public void updateUserInfo(UserDto user) {
		String hashedPasswd = Util.getHashedString(user.getUserPw(), "SHA-256");
		user.setUserPw(hashedPasswd);
		
		myPageMapper.updateUserInfo(user);		
	}
	
	@Override
	public ArrayList<UserCouponDto> UserCoupon(String userId) {
		ArrayList<UserCouponDto> coupon = myPageMapper.selectUserCouponList(userId);
		return coupon;
	}

	@Override
	public ArrayList<BoardDto> UserBoard(String userId) {
		ArrayList<BoardDto> userBoardList = myPageMapper.selectAllUserBoardList(userId);
		return userBoardList;
	}
	
	@Override
	public ArrayList<UserOrderDto> findMyPageUserorder(String userId) {
		ArrayList<UserOrderDto> orderList = myPageMapper.selectMyPageUserOrders(userId);
		return orderList;	
	}
	
	@Override
	public ArrayList<UserOrderDto> getUserOrder(int pageNum, String userId) {
		ArrayList<UserOrderDto> orderArr = myPageMapper.selectUserOrderList(pageNum,userId);
		return orderArr;
	}

	@Override
	public int getUserOrderCount(String userId) {
//		int orderCount = myPageMapper.getBoardCount(userId);
//		return orderCount;
		return 0;
		
	}

	
}
