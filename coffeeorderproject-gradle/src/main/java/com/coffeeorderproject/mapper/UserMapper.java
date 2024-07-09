package com.coffeeorderproject.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.coffeeorderproject.spring.dto.UserDto;

@Mapper
public interface UserMapper {
	void insertUser(UserDto user);

	Boolean idCheck(UserDto user);

	UserDto selectUser(UserDto user);

	UserDto selectUserEmail(String id);

	void updateUserPw(String userId, String newPw);

	void updateUser(String userId);
}
