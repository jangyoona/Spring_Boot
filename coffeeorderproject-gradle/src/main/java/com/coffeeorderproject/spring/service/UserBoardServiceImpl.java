package com.coffeeorderproject.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.coffeeorderproject.mapper.UserBoardMapper;
import com.coffeeorderproject.spring.dto.BoardAttachDto;
import com.coffeeorderproject.spring.dto.BoardCommentDto;
import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.ProductDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;

import lombok.Setter;


public class UserBoardServiceImpl implements UserBoardService {
	
	@Setter
	private UserBoardMapper userBoardMapper;
	
	
	@Override
	public List<BoardDto> getUserBoard(int pageNum, String userId) {
		List<BoardDto> boardArr = userBoardMapper.selectUserBoard(pageNum,userId);
		return boardArr;
	}

	
	@Override
	public int getBoardCount() {
		int boardCount = userBoardMapper.selectBoardCount();
		return boardCount;
	}
	
	@Override
	public List<BoardDto> findReviewBoardByRange(int start, int count) {

		List<BoardDto> board = userBoardMapper.selectReviewBoardByRange(start, count);
		return board;

	}
	
	@Override
	public List<ProductDto> findProdNameList() {

		List<ProductDto> Product = userBoardMapper.selectProdByProdNoByProdName();

		return Product;
	}
	
	public UserOrderDto findUserOder(int orderId) {
		
		UserOrderDto userorder = userBoardMapper.selectUesridByOrders(orderId);
		return userorder;
		
	}
	
	
	public void writeBoard(BoardDto board) {

		userBoardMapper.insertBoard(board); // board 테이블에 데이터 저장 -> boardNo 결정 (DB에서)
		// board.getBoardNo() : 새로 만든 글 번호

		for (BoardAttachDto attach : board.getAttachments()) {
			attach.setBoardNo(board.getBoardNo()); // 위 게시글 insert 후 생성된 글번호 저장
			userBoardMapper.insertBoardAttach(attach); // boardattach 테이블에 데이터 저장
		}
		
		userBoardMapper.insertBoard2(board);

	}
	
	
	
	@Override
	public BoardDto findBoardByBoardNo(Integer boardNo) {

		// 게시글 조회
		BoardDto board = userBoardMapper.selectBoardByBoardNo(boardNo);

		// 첨부파일 조회
		ArrayList<BoardAttachDto> attaches = userBoardMapper.selectBoardAttachByBoardNo(boardNo);
		board.setAttachments(attaches);

		ArrayList<BoardCommentDto> comments = userBoardMapper.selectBoardCommentByBoardNo(boardNo);
		board.setComments(comments);

		return board;

	}
	
	@Override
	public BoardAttachDto findBoardAttachByAttachNo(int attachNo) {
		BoardAttachDto attach = userBoardMapper.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}
	
	@Override
	public void writeComment(BoardCommentDto comment) {

		userBoardMapper.insertBoardComment(comment);
	}
	
	@Override
	public List<BoardCommentDto> findBoardCommentsByBoardNo(int boardNo) {
		
		List<BoardCommentDto> comments = userBoardMapper.selectBoardCommentsByBoardNo(boardNo);
		return comments;
	}


	@Override
	public void deleteComment(int commentNo) {
		
		userBoardMapper.deleteComment(commentNo);
	}
	
	
}
