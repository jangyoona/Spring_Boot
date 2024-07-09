package com.coffeeorderproject.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;

@Mapper
public interface MyPageMapper {
	//	비밀번호 암호화
	void updateUserInfo(UserDto user);

	ArrayList<UserCouponDto> selectUserCouponList(String userId);

	ArrayList<BoardDto> UserBoard(String userId);

	ArrayList<UserOrderDto> findMyPageUserorder(String userId);

	ArrayList<UserOrderDto> selectMyPageUserOrders(String userId);
	
	ArrayList<UserOrderDto> selectUserOrderList(int pageNum, String userId);

	int getUserOrderCount(String userId);
	
	ArrayList<BoardDto> selectAllUserBoardList(String userId);
}
