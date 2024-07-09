package com.coffeeorderproject.spring.dto;
// hl.prodno, userid, cartquantity, p.productcategoryid, p.prodname, 
// p.prodprice, p.prodactive

import lombok.Data;

@Data
public class CartDto {
	private int prodNo;
	private String userId;
	private int cartquantity;
	private int productCategoryId;
	private String prodName;
	private int prodPrice;
	private Boolean prodActive;
	

	
}
