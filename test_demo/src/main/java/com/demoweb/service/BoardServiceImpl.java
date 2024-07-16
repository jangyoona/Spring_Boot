package com.demoweb.service;

import com.demoweb.dto.BoardAttachDto;
import com.demoweb.dto.BoardCommentDto;
import com.demoweb.dto.BoardDto;
import com.demoweb.entity.BoardAttachEntity;
import com.demoweb.entity.BoardCommentEntity;
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

		// 단방향은 이거면 됨.
//		List<BoardAttachEntity> attachments = new ArrayList<>();
//		for (BoardAttachDto attach : board.getAttachments()) {
//			attachments.add(attach.toEntity());
//		}

		// 방법 1. 우리 수준에선 뭘 쓰던 똑같음. -양방향
//		List<BoardAttachEntity> attachments = new ArrayList<>();
//		for (BoardAttachDto attach : board.getAttachments()) {
//			BoardAttachEntity attachEntity = attach.toEntity();
//			attachEntity.setBoard(boardEntity);
//			attachments.add(attachEntity);
//		}

		// 방법 2. 대량의 데이터를 처리할 때 더 좋은 방법임. -양방향
		List<BoardAttachEntity> attachments = board.getAttachments().stream().map(attach -> {
			BoardAttachEntity attachEntity = attach.toEntity();
			attachEntity.setBoard(boardEntity);
			return attachEntity;
		}).toList();

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

//		BoardAttachEntity entity = boardRepository.findBoardAttachByAttachNo(attachNo);
//		return BoardAttachDto.of(entity);

		BoardAttachEntity entity = boardRepository.findBoardAttachByAttachNo(attachNo);
		if (entity != null) {
			return BoardAttachDto.of(entity);
		} else {
			return null;
		}
	}

	@Override
	public void deleteBoard(int boardNo) {
//		BoardEntity entity = boardRepository.findById(boardNo).get();
		// boardRepository.delete(entity); // 실제 데이터 삭제
//		entity.setDeleted(true);
//		boardRepository.save(entity);

		// 윤아 남자친구 코드
		// ifPresnet() 방식
		Optional<BoardEntity> boardEntity = boardRepository.findById(boardNo);
		boardEntity.ifPresent(entity -> {
			entity.setDeleted(true);
			boardRepository.save(entity);
		});

		// isPresent() 방식
//		Optional<BoardEntity> entity = boardRepository.findById(boardNo);
//		if (entity.isPresent()) {
//			BoardEntity boardEntity = entity.get();
//			boardEntity.setDeleted(true);
//			boardRepository.save(boardEntity);
//		}
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
		// 수정
		entity.setTitle(board.getTitle());
		entity.setContent(board.getContent());

		if(board.getAttachments() != null) {
			List<BoardAttachEntity> attachEntities =
					board.getAttachments().stream().map((attach) -> {
						BoardAttachEntity attachEntity = attach.toEntity();
						attachEntity.setBoard(entity);
						return attachEntity;
					}).toList();
			// 선생님 코멘트 : Parent(Board)는 find로 조회해와서 영속성박스에 들어왔지만, child(attach)의 경우
//			entity.setAttachments(attachEntities); // 이렇게 처리하면 안됨. 영속성 컨텍스트 밖의 데이터와 안의 데이터를 바꿔치기할 시 동기화 문제로 에러? - google
			entity.getAttachments().addAll(attachEntities); // 영속성 컨텍스트 안의 데이터 유지 -정상적으로 조회해 온 데이터를 get으로 불러와서 -> .addAll()으로 추가해 주는 방식을 사용

		}
		// 수정된 내용 save
		boardRepository.save(entity);



	}

	@Override
	public void writeComment(BoardCommentDto comment) {

		BoardEntity boardEntity = boardRepository.findById(comment.getBoardNo()).get();
		BoardCommentEntity commentEntity = comment.toEntity();
		commentEntity.setBoard(boardEntity);
		boardEntity.getComments().add(commentEntity);
		boardRepository.save(boardEntity);


	}



	@Override
	public List<BoardCommentDto> findBoardCommentsByBoardNo(int boardNo) {

		// 이렇게하면 조인을 해야되서 성능이 약간 손해지만 빨리하기 위해서 이렇게했다거함 (보드를 가져오면 커멘트가 딸려오잖아 그걸 이용하는 방법임)
		List<BoardCommentEntity> commentEntities = boardRepository.findById(boardNo).get().getComments();
		List<BoardCommentDto> comments = commentEntities.stream().map(BoardCommentDto::of).toList();

//		List<BoardCommentDto> comments = boardMapper.selectBoardCommentsByBoardNo(boardNo);
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