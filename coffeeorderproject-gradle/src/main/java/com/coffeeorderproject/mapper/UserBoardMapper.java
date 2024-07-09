package com.coffeeorderproject.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.coffeeorderproject.spring.dto.BoardAttachDto;
import com.coffeeorderproject.spring.dto.BoardCommentDto;
import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.ProductDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;


@Mapper
public interface UserBoardMapper {
	ArrayList<BoardDto> selectUserBoard(int pageNum, String userId);

	ArrayList<BoardDto> selectAllUserBoardList(String userId);

	List<BoardDto> selectReviewBoardByRange(int start, int count);

	List<ProductDto> selectProdByProdNoByProdName();

	int selectBoardCount();

	UserOrderDto selectUesridByOrders(int orderId);

	
	
	void insertBoard(BoardDto board);
	void insertBoard2(BoardDto board); // productreview에 저장하는녀석

	void insertBoardAttach(BoardAttachDto attach);

	BoardDto selectBoardByBoardNo(int boardNo);

	
	ArrayList<BoardAttachDto> selectBoardAttachByBoardNo(Integer boardNo);

	ArrayList<BoardCommentDto> selectBoardCommentByBoardNo(Integer boardNo);

	BoardAttachDto selectBoardAttachByAttachNo(int attachNo);

	void insertBoardComment(BoardCommentDto comment);

	List<BoardCommentDto> selectBoardCommentsByBoardNo(int boardNo);

	void deleteComment(int commentNo);
	
	
	
}
