package com.demoweb.dto;

import com.demoweb.entity.BoardCommentEntity;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardCommentDto {


	private int commentNo;
	private int boardNo;
	private String content;
	private String writer;
	private Date writeDate;
	private Date modifyDate;
	private boolean deleted;

	@Column
	private int groupNo;
	@Column(nullable = false)
	private int step;
	@Column(nullable = false)
	private int depth;


	public BoardCommentEntity toEntity() {
		return BoardCommentEntity.builder()
				.writer(writer)
				.content(content)
				.groupNo(groupNo)
				.step(step)
				.depth(depth)
				.build();
	}

	public static BoardCommentDto of(BoardCommentEntity entity) {
		return BoardCommentDto.builder()
				.commentNo(entity.getCommentNo())
				.writer(entity.getWriter())
				.content(entity.getContent())
				.writeDate(entity.getWriteDate())
				.modifyDate(entity.getModifyDate())
				.build();

	}
	
	

}
