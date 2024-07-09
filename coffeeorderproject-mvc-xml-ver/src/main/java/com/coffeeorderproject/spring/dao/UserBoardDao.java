package com.coffeeorderproject.spring.dao;

import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.BoardDto;

public interface UserBoardDao {

	ArrayList<BoardDto> selectUserBoard(int pageNum, String userId);

	int getBoardCount(String userId);

	ArrayList<BoardDto> selectAllUserBoardList(String userId);

}