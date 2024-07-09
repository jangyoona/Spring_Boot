package com.coffeeorderproject.spring.dao;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.CartDto;

public interface CartDao {

	void inputProductIntoCart(int productCount, int prodno, String userId);

	Boolean selectIsUserInCart(String userId, int prodno);

	void updateProductCount(int productCount, int prodno, String userId);

	ArrayList<CartDto> selectAllCartProduct(String userId);

	void deleteProduct(int prodNo);

	ArrayList<CartDto> selectUserCart(String userId);

}