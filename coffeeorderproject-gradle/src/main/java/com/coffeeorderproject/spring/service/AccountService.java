package com.coffeeorderproject.spring.service;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.CartDto;
import com.coffeeorderproject.spring.dto.UserDto;

public interface AccountService {

	// 회원가입
	void inputUser(UserDto user);

	// 중복 아이디 검사
	Boolean checkId(UserDto user);

	//로그인
	UserDto signInUser(UserDto user);

	// 사용자에게 Email 보내기
	UserDto getUserEmail(String id);

	// 사용자 PW Update
	void changeUserPw(String userId, String newPw);

	// Application에 저장될 유저 장바구니 목록
	ArrayList<CartDto> getUserCart(String userId);

	void deleteUser(String userId);

}