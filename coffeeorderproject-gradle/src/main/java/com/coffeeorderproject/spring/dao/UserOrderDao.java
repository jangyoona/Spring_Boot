package com.coffeeorderproject.spring.dao;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.UserOrderDto;

public interface UserOrderDao {

	ArrayList<UserOrderDto> selectMyPageUserOrders(String userId);

	ArrayList<UserOrderDto> selectUserOrderList(int pageNum, String userId);

	int getBoardCount(String userId);

}