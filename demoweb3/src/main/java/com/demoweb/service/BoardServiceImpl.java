package com.demoweb.service;

import com.demoweb.dto.BoardAttachDto;
import com.demoweb.dto.BoardCommentDto;
import com.demoweb.dto.BoardDto;
import com.demoweb.entity.BoardAttachEntity;
import com.demoweb.entity.BoardEntity;
import com.demoweb.mapper.BoardMapper;
import com.demoweb.repository.BoardAttachRepository;
import com.demoweb.repository.BoardRepository;
import lombok.Setter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BoardServiceImpl implements BoardService {

	@Setter
	private BoardMapper boardMapper;

	@Setter
	private BoardRepository boardRepository;

	@Setter
	private BoardAttachRepository boardAttachRepository;

	@Setter
	private TransactionTemplate transactionTemplate;
	

	@Override
	//@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.READ_UNCOMMITTED)
	public void writeBoard(BoardDto board) {
	
		BoardEntity boardEntity = board.toEntity();
		//boardRepository.save(boardEntity);

		List<BoardAttachEntity> attachments = new ArrayList<>();

		for (BoardAttachDto attach : board.getAttachments()) {
			//attach.setBoardNo(boardEntity.getBoardNo());
			attachments.add(attach.toEntity());
		//	boardAttachRepository.save(attach.toEntity());
		}
		boardEntity.setAttachments(attachments);
		boardRepository.save(boardEntity); // insert or update

	}
	
	
	
	@Override
	public List<BoardDto> findAllBaord() {
		
		List<BoardDto> boards = boardMapper.selectAllBoard();
		return boards;
		
	}
	
	@Override
	public int getBoardCount() {

		return (int)boardRepository.count();
	}
	
	@Override
	public List<BoardDto> findBaordByRange(int start, int count) { // 페이징

		List<BoardDto> boards = boardMapper.selectBoardByRange(start, start + count);
		return boards;
		
	}

	@Override
	public List<BoardDto> findBaordByRange2(int pageNo, int count) { // 페이징 - JPA버전

		//Pageable? 페이징 처리를 하기 위해 제공하는 클래스
		Pageable pageable = PageRequest.of(pageNo, count, Sort.by(Sort.Direction.DESC, "boardNo"));
		Page<BoardEntity> page = boardRepository.findAll(pageable);
		List<BoardDto> boards = new ArrayList<>();

		for (BoardEntity boardEntity : page.getContent()) {
			boards.add(BoardDto.of(boardEntity));
		}
		return boards;

	}
	
	@Override
	public BoardDto findBoardByBoardNo(int boardNo) {
		
		Optional<BoardEntity> entity = boardRepository.findById(boardNo);
		if(entity.isPresent()) {
			BoardEntity boardEntity = entity.get();
			BoardDto board = BoardDto.of(boardEntity);
//			List<BoardAttachDto> attachments = new ArrayList<>();
//			for(BoardAttachEntity entity2 : boardEntity.getAttachments()) {
//				attachments.add(BoardAttachDto.of(entity2));
//			}
			List<BoardAttachDto> attachments =
										boardEntity.getAttachments().stream()
										.map(BoardAttachDto::of)
										.toList();
			board.setAttachments(attachments);
			return board;
		} else {
			return null;
		}
		// return entity.isPresent() ? BoardDto.of(entity.get()) : null; 축약버전으로 이것도 가능함. 선생님 쩐당

//		// 댓글 조회
//		List<BoardCommentDto> comments = boardMapper.selectBoardCommentByBoardNo(boardNo);
//		board.setComments(comments);
		
	}
	

//	public BoardDto findBoardByBoardNo2(int boardNo) { // 한꺼번에 조회하는 방식 (XML 참조)
//
//		// 게시글+첨부파일 조회
//		BoardDto board = boardMapper.selectBoardByBoardNo4(boardNo); // collection - ofType 속성을 사용한 방법 (재사용x)
//		return board;
//
//	}
	

	@Override
	public BoardAttachDto findBoardAttachByAttachNo(int attachNo) {
		//Optional<BoardAttachEntity> entity = boardAttachRepository.findById(attachNo);
		BoardAttachEntity entity = boardRepository.findBoardAttachByAttachNo(attachNo);
		return BoardAttachDto.of(entity);
	}

	@Override
	public void deleteBoard(int boardNo) {
		BoardEntity entity = boardRepository.findById(boardNo).get();
		// boardRepository.delete(entity); // 실제 데이터 삭제
		entity.setDeleted(true);
		boardRepository.save(entity);
	}

	@Override
	public void deleteBoardAttach(int attachNo) {
		
		//boardAttachRepository.deleteById(attachNo); // 편집 페이지 첨부파일 삭제 방법-1
		//BoardAttachEntity entity = boardRepository.findBoardAttachByAttachNo(attachNo); // 편집 페이지 첨부파일 삭제 이렇게해도됨 방법-2
		//boardAttachRepository.delete(entity);// 편집 페이지 첨부파일 삭제 이렇게해도됨
		boardRepository.deleteBoardAttachByAttachNo(attachNo); // 방법-3

	}

	@Override
	public void modifyBoard(BoardDto board) {

		BoardEntity entity = boardRepository.findById(board.getBoardNo()).get();
		entity.setTitle(board.getTitle());
		entity.setContent(board.getContent());
		boardRepository.save(entity);

		if(board.getAttachments() != null) {
			for (BoardAttachDto attach : board.getAttachments()) {
				boardRepository.insertBoardAttach(attach.getBoardNo(), attach.getUserFileName(), attach.getSavedFileName());
			}
			//entity.setAttachments(attaches);
		}

	}

	@Override
	public void writeComment(BoardCommentDto comment) {
		
		boardMapper.insertComment(comment);
		
	}



	@Override
	public List<BoardCommentDto> findBoardCommentsByBoardNo(int boardNo) {
		
		List<BoardCommentDto> comments = boardMapper.selectBoardCommentsByBoardNo(boardNo);
		return comments;
	}


	@Override
	public void deleteComment(int commentNo) {
		
		boardMapper.updateCommentDeleted(commentNo);
		
	}

	@Override
	public void editComment(BoardCommentDto comment) {
		
		boardMapper.updateComment(comment);
		
	}

	@Override
	public void writeReComment(BoardCommentDto comment) {
		
		// 부모 댓글을 조회해서 자식 댓글(대댓글)의 step, depth를 설정
		BoardCommentDto parent = boardMapper.selectBoardCommentByCommentNo(comment.getCommentNo());
		comment.setGroupNo(parent.getGroupNo());
		comment.setStep(parent.getStep() + 1);
		comment.setDepth(parent.getDepth() + 1);
		
		// 새로 삽입될 대댓글보다 순서번호(step)가 뒤에 있는 대댓글의 step 수정 (+1)
		boardMapper.updateStep(parent);
		
		boardMapper.insertReComment(comment);
		
	}

	
}