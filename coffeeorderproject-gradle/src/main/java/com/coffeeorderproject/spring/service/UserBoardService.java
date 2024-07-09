package com.coffeeorderproject.spring.service;

import java.util.List;

import com.coffeeorderproject.spring.dto.BoardAttachDto;
import com.coffeeorderproject.spring.dto.BoardCommentDto;
import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.ProductDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;

public interface UserBoardService {

	List<BoardDto> getUserBoard(int pageNum, String userId);

	int getBoardCount();

	List<BoardDto> findReviewBoardByRange(int start, int count);
	
	List<ProductDto> findProdNameList();

	UserOrderDto findUserOder(int orderId);
	
	void writeBoard(BoardDto board);

	BoardDto findBoardByBoardNo(Integer boardNo);

	BoardAttachDto findBoardAttachByAttachNo(int attachNo);

	void writeComment(BoardCommentDto comment);

	List<BoardCommentDto> findBoardCommentsByBoardNo(int boardNo);

	void deleteComment(int commentNo);
	

}