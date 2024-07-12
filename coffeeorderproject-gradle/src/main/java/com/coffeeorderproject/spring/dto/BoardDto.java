package com.coffeeorderproject.spring.dto;

import com.coffeeorderproject.spring.entity.BoardEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDto {

	//board 게시판 정보
	private int boardNo;
	private String userId;
	private int boardcategoryId;
	private String boardTitle;
	private Date boardDate = new Date();
	private Date boardModifyDate;
	private String boardContent;
	private boolean boardDelete;
	//private String usernickname;

	// 유저가 선택한 상품 정보
	private int prodNo;
	private String prodName;
	private String prodExplain;
	
	private int userAdmin;

	private ArrayList<BoardCategoryDto> categorys;
	private List<BoardAttachDto> attachments;
	private ArrayList<BoardCommentDto> comments;
	private List<ProductDto> products;


	public static BoardDto of(BoardEntity entity) {
		return BoardDto.builder()
						.boardNo(entity.getBoardNo())
						.boardcategoryId(entity.getBoardcategoryId())
						.boardTitle(entity.getBoardTitle())
						.boardDate(entity.getBoardDate())
						.boardModifyDate(entity.getBoardModifyDate())
						.boardContent(entity.getBoardContent())
						.boardDelete(entity.isBoardDelete()).build();
	}
}
