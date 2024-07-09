package com.coffeeorderproject.spring.dto;

import lombok.Data;

@Data
public class BoardCategoryDto {

	private int boardCateGoryid;
	private String boardCateGoryname;
	
	private BoardDto board;
	
	
}
