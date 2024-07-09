package com.coffeeorderproject.spring.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class BoardDto {

	//board 게시판 정보
	private int boardNo;
	private String userId;
	private int boardcategoryId;
	private String boardTitle;
	private Date boardDate;
	private Timestamp boardModifyDate;
	private String boardContent;
	private boolean boardDelete;
	private String usernickname;

	// 유저가 선택한 상품 정보
	private int prodNo;
	private String prodName;
	private String prodExplain;
	
	private int userAdmin;

	private ArrayList<BoardCategoryDto> categorys;
	private List<BoardAttachDto> attachments;
	private ArrayList<BoardCommentDto> comments;
	private List<ProductDto> products;

}
