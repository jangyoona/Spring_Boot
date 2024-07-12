package com.coffeeorderproject.spring.service;

import com.coffeeorderproject.mapper.UserBoardMapper;
import com.coffeeorderproject.spring.dto.*;
import com.coffeeorderproject.spring.entity.BoardEntity;
import com.coffeeorderproject.spring.repository.BoardRepository;
import lombok.Setter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.ArrayList;
import java.util.List;


public class UserBoardServiceImpl implements UserBoardService {
	
	@Setter
	private UserBoardMapper userBoardMapper;

	@Setter
	private BoardRepository boardRepository;
	
	
	@Override
	public List<BoardDto> getUserBoard(int pageNum, String userId) {
		List<BoardDto> boardArr = userBoardMapper.selectUserBoard(pageNum,userId);
		return boardArr;
	}

	
	@Override
	public int getBoardCount() {

		return (int)boardRepository.count();

	}
	
	@Override
	public List<BoardDto> findReviewBoardByRange(int pageNo, int count) {

		Pageable pageable = PageRequest.of(pageNo, count, Sort.by(Sort.Direction.DESC, "boardNo"));
		Page<BoardEntity> page = boardRepository.findAll(pageable);
		List<BoardDto> boards = new ArrayList<>();

		for(BoardEntity boardEntity : page.getContent()) {
			boards.add(BoardDto.of(boardEntity));
		}
		return boards;

		//List<BoardDto> board = userBoardMapper.selectReviewBoardByRange(start, count);
		//return board;

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
