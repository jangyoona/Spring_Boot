package com.coffeeorderproject.spring.service;


import com.coffeeorderproject.mapper.UserMapper;
import com.coffeeorderproject.spring.common.Util;
import com.coffeeorderproject.spring.dao.CartDao;
import com.coffeeorderproject.spring.dao.CartDaoImpl;
import com.coffeeorderproject.spring.dto.CartDto;
import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.entity.UserEntity;
import com.coffeeorderproject.spring.repository.UserRepository;
import lombok.Setter;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Optional;

public class AccountServiceImpl implements AccountService {
	
	@Setter
	private UserMapper userMapper;

	@Setter
	private UserRepository userRepository;
	
	// 회원가입
	@Override
	public void inputUser(UserDto user) {
		// 비번 암호화
		String hashedPasswd = Util.getHashedString(user.getUserPw(), "SHA-256");
		user.setUserPw(hashedPasswd);

		UserEntity userEntity = user.toEntity();
		userRepository.save(userEntity);
	}
	
	// 중복 아이디 검사
	@Override
	public Boolean checkId(UserDto user) {

		int countEntity = userRepository.countByUserId(user.getUserId());
        return countEntity != 0;
	}
	
	//로그인
	@Override
	public UserDto signInUser(UserDto user) {

//		if(member != null) { // 정상 로그인이 아닐 경우 
//			// 쿠폰 테이블에 로그인 유저의 데이터가 있는지 조회 (쿠폰이 있는지)
//			CouponDao coupon = new CouponDao();
//			ArrayList<UserCouponDto> couponList = coupon.selectCouponList(user);
//			member.setUsercoupon(couponList);
//			
//			return member;
//		}
		String hashedPasswd = Util.getHashedString(user.getUserPw(), "SHA-256");
//		Optional<UserEntity> optionalUser = Optional.ofNullable(userRepository.findUserByUserIdAndUserPw(user.getUserId(), hashedPasswd));

//		if (optionalUser.isPresent()) {
//			return UserDto.of(optionalUser); // 비어있지 않으면 of로 변환해서 반환
//		} else {
//			return null;
//		}

		// 윤아 남자친구 코드
		UserEntity entity = userRepository.findUserByUserIdAndUserPw(user.getUserId(), hashedPasswd);
		return UserDto.of(entity);

	}


	// 사용자에게 Email 보내기
	@Override
	public String getUserEmail(String userId) {

        return userRepository.findByUserEmail(userId);
	}
	
	// 사용자 PW Update
	@Override
	public void changeUserPw(String userId, String newPw) {
		// 비번 암호화
		String hashedPasswd = Util.getHashedString(newPw, "SHA-256");

		UserEntity userEntity = userRepository.findById(userId).get();
		userEntity.setUserPw(hashedPasswd);
		userRepository.save(userEntity);
	}


	// Application에 저장될 유저 장바구니 목록
	@Override
	public ArrayList<CartDto> getUserCart(String userId) {
		CartDao cartDao = new CartDaoImpl();
        return cartDao.selectUserCart(userId);
	}

	@Override
	public void deleteUser(String userId) {
		userMapper.updateUser(userId);
        
		
	}
}