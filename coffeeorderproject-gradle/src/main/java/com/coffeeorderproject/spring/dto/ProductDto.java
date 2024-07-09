package com.coffeeorderproject.spring.dto;

import lombok.Data;

@Data
public class ProductDto {
	
	private int prodNo;
	private int productCategoryId;
	private String prodName;
	private int prodPrice;
	private String prodexplain;
	private Boolean prodActive;
	private String productCategoryName;
	
	private int likeCount; // 찜 갯수
	

	
}
