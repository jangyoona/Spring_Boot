package com.demoweb.service;

import com.demoweb.dto.BoardAttachDto;
import com.demoweb.dto.BoardCommentDto;
import com.demoweb.dto.BoardDto;

import java.util.List;

public interface BoardService {

	void writeBoard(BoardDto board);

	List<BoardDto> findAllBaord();

	int getBoardCount();
	
	List<BoardDto> findBaordByRange(int start, int count);
	List<BoardDto> findBaordByRange2(int pageNo, int count);
	
	BoardDto findBoardByBoardNo(int boardNo);
	
	BoardAttachDto findBoardAttachByAttachNo(int attachNo);

	void writeComment(BoardCommentDto comment);

	void deleteComment(int commentNo);
	
	void editComment(BoardCommentDto comment);
	
	void writeReComment(BoardCommentDto comment);
	
	List<BoardCommentDto> findBoardCommentsByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void deleteBoardAttach(int attachNo);

	void modifyBoard(BoardDto board);
//
//	void writeComment(BoardCommentDto comment);
//
//	void deleteComment(int commentNo);
//

//

}