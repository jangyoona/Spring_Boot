package com.coffeeorderproject.spring.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardCommentDto {
	
	private int commentNo;
	private String userId;
	private int boardNo;
	private String commentContent;
	private Timestamp commentDate;
	private Timestamp comModifyDate;
	private boolean commentActive;
	

	private int groupno;
	private int replycount;
	private int replylocation;
	
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public Timestamp getComModifyDate() {
		return comModifyDate;
	}
	public void setComModifyDate(Timestamp comModifyDate) {
		this.comModifyDate = comModifyDate;
	}
	
	public boolean isCommentActive() {
		return commentActive;
	}
	public void setCommentActive(boolean commentActive) {
		this.commentActive = commentActive;
	}
	
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getReplylocation() {
		return replylocation;
	}
	public void setReplylocation(int replylocation) {
		this.replylocation = replylocation;
	}
	
	
	
	
	
}
