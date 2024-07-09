package com.coffeeorderproject.spring.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserOrderDto {
	private int orderId;
	private String userId;
	private String orderOption;
	private Date orderDate;
	private String orderStatus;
	private String orderPayment;

	
	// 주문관리 탭에서 사용할 변수 Dao
	private String userName;
	private String userPhone;
	private String prodName;
	private int prodNo;
	private int cartQuantity;
	private boolean couponuse; // 쿠폰 사용여부
	private int totalPrice;
	private String serchtext;
	

}