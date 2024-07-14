package com.demoweb.dto;

import com.demoweb.entity.BoardEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDto {
	
	private Integer boardNo;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private Date modifyDate;
	private int readCount;
	private boolean deleted;
	
	// board 테이블과 boardattach 테이블 사이의 1 : Many 관계를 구현하는 필드
	private List<BoardAttachDto> attachments;
	
	// board 테이블과 boardcomment 테이블 사이의 1 : Many 관계를 구현하는 필드
	private List<BoardCommentDto> comments;
	

	// 여기부터 변환기
	public BoardEntity toEntity(){ // Dto -> Entity 변환 메서드는 'toEntity'
        return BoardEntity.builder()
											.title(title)
											.writer(writer)
											.content(content)
//											.writeDate(writeDate) // Entity에서 Defalut값 설정했으면, 여기서 값 넣어주면 안됨xx
//											.modifyDate(modifyDate) // Entity에서 Defalut값 설정했으면, 여기서 값 넣어주면 안됨xx
											.readCount(readCount)
											.deleted(deleted)
											.build();
	}

	public static BoardDto of(BoardEntity entity) { // Entity -> Dto 변환 메서드는 'of'
        return BoardDto.builder()
									.boardNo(entity.getBoardNo())
									.title(entity.getTitle())
									.writer(entity.getWriter())
									.content(entity.getContent())
									.readCount(entity.getReadCount())
									.writeDate(entity.getWriteDate())
									.modifyDate(entity.getModifyDate())
									.deleted(entity.isDeleted())
									.build();
	}

}
