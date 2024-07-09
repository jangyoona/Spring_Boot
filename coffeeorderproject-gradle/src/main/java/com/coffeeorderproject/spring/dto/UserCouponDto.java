package com.coffeeorderproject.spring.dto;

import java.util.Date;

import lombok.Data;

@Data
public class UserCouponDto {
	
	private int couponId;
	private String userId;
	private int couponDiscount;
	private Date couponStartDate;
	private Date couponLastDate;
	private boolean couponActive; // false = 쿠폰있음  true = 쿠폰 이미 사용(폐기)
	private int couponSum; // 쿠폰 몇개있는지 갯수
	
	private UserDto user;
	

}
