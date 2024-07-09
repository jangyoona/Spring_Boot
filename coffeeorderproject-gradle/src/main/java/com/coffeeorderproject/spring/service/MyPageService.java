package com.coffeeorderproject.spring.service;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;

public interface MyPageService {

	//	비밀번호 암호화
	void updateUserInfo(UserDto user);

	ArrayList<UserCouponDto> UserCoupon(String userId);

	ArrayList<BoardDto> UserBoard(String userId);

	ArrayList<UserOrderDto> findMyPageUserorder(String userId);

	ArrayList<UserOrderDto> getUserOrder(int pageNum, String userId);

	int getUserOrderCount(String userId);

}