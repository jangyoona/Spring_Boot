package com.coffeeorderproject.spring.dao;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;

public interface CouponDao {

	ArrayList<UserCouponDto> selectCouponList(UserDto user);

	ArrayList<UserCouponDto> selectUserCouponList(String userId);

}