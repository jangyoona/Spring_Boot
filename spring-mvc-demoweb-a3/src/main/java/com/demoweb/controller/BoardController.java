package com.demoweb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.demoweb.common.Util;
import com.demoweb.dto.BoardAttachDto;
import com.demoweb.dto.BoardCommentDto;
import com.demoweb.dto.BoardDto;
import com.demoweb.service.BoardService;
import com.demoweb.ui.ThePager;
import com.demoweb.view.DownloadView1;

import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_ = {@Autowired})
	BoardService boardService;

//	@GetMapping("/list")
//	public String listAll(Model model) {
//		
//		List<BoardDto> boardList = boardService.findAllBaord();
//		model.addAttribute("boardList", boardList);
//		
//		return "/board/list-without-page";
//	}
	
	@GetMapping("/list")
	public String listRange(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, HttpServletRequest req,Model model) {
		
		int pageSize = 3; 		// 한 페이지에 표시하는 데이터 갯수
		int pagerSize = 3;		// 한 번에 표시되는 페이지 번호 갯수
		int dataCount = boardService.getBoardCount();	// 전체 데이터 갯수
		
		String uri = req.getRequestURI();		
		String linkUrl = uri.substring(uri.lastIndexOf("/") + 1); // 페이지 번호를 클릭했을 때 요청을 보낼 URL ( 목록 페이지 경로 )
		String queryString = req.getQueryString();
		
		int start = pageSize * (pageNo - 1) + 1; // 현재 페이지의 첫번째 데이터 행 번호
		
		// ThePager pager = new ThePager(dataCount, page, pageSize, pagerSize, linkUrl);
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl, queryString);
		//
		
		List<BoardDto> boardList = boardService.findBaordByRange(start, pageSize);		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);
		
		return "/board/list";
	}
	
	@GetMapping("/write")
	public String writeForm() {
		
		return "/board/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute("board") BoardDto board,
						MultipartFile attach, // <input type="file"의 데이터를 담은 변수
						HttpServletRequest req){
//		System.out.println(attach.getOriginalFilename());
//		System.out.println(board);
		
		BoardAttachDto attachment = new BoardAttachDto();
		ArrayList<BoardAttachDto> attachments = new ArrayList<>();
		
		try {
			String dir = req.getServletContext().getRealPath("/board-attachments");
			String userFileName = attach.getOriginalFilename();
			String savedFileName = Util.makeUniqueFileName(userFileName);
			attach.transferTo(new File(dir, savedFileName)); // 저장
			
			attachment.setUserFileName(userFileName);
			attachment.setSavedFileName(savedFileName);
			attachments.add(attachment);
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		board.setAttachments(attachments);
		
		try {
			boardService.writeBoard(board);
		} catch (Exception e) {
			System.out.println("글쓰기 실패");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/detail")
	public String detailWithQueryString(@RequestParam(value = "boardno", required = false) Integer boardNo,
										@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
		
		if(boardNo == null) { // 요청 데이터의 값이 없는 경우 = null이 들어올 경우를 대비해 Integer 래퍼 타입으로 지정함.
			return "redirect:/board/list";
		}
//		BoardDto board = boardService.findBoardByBoardNo(boardNo); // 게시글, 첨부파일 따로따로 조회하는 방식
		BoardDto board = boardService.findBoardByBoardNo2(boardNo); // 한번에 조회하는 방식
		
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo); // 디테일 -> 목록으로 돌아갈 때 페이지 유지를 위해 가져온 pageNo를 다시 넘겨주기.
		
		return "/board/detail";
	}
	
	@GetMapping("/detail/{boardNo}")
	public String detailWithPathVariable(@PathVariable("boardNo") Integer boardNo, Model model) {
		
		BoardDto board = boardService.findBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		
		return "/board/detail";
	}
	
	@GetMapping("/download")
	public View downloadWithQueryString(@RequestParam("attachno") int attachNo, Model model) {
		
		BoardAttachDto boardAttach = boardService.findBoardAttachByAttachNo(attachNo);
		model.addAttribute("attach",boardAttach); // DownloadView 서블릿에 데이터 전달
		
		// 다운로드 처리 -> 사용자 정의 View 생성+사용
		return new DownloadView1();
//		return new DownloadView2();
	}
	
	
	@GetMapping("/download/{attachNo}")
	public View downloadWithPathVariable(@PathVariable("attachno") int attachNo, Model model) {
		
		BoardAttachDto boardAttach = boardService.findBoardAttachByAttachNo(attachNo);
		model.addAttribute("attach",boardAttach); // DownloadView 서블릿에 데이터 전달
		
		// 다운로드 처리 -> 사용자 정의 View 생성+사용
		return new DownloadView1();
//		return new DownloadView2();
	}
	
	@GetMapping("/delete")
	public String deleteBoard(int boardNo, @RequestParam(defaultValue = "-1") int pageNo) {
		
		if(pageNo == -1) {
			return "redirect:list"; 
		}
		boardService.deleteBoard(boardNo);
		
		return String.format("redirect:/board/list?pageNo=%d", pageNo);
	}
	
	@GetMapping("/edit")
	public String showEditForm(int boardNo, @RequestParam(defaultValue = "-1") int pageNo, Model model) {
		
		if(pageNo == -1) {
			System.out.println("if문 안");
			return "redirect:list";
		}
		
		BoardDto board = boardService.findBoardByBoardNo(boardNo);
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo);
		
		return "/board/edit";
	}
	
	@PostMapping("/edit")
	public String editBoard(BoardDto board, MultipartFile attach, HttpServletRequest req, @RequestParam(required = false) Integer pageNo) {
		
		if(board.getBoardNo() == 0 || pageNo == null) {
			return "redirect:list";
		}
		
		if(attach != null && attach.getSize() > 0) {
			BoardAttachDto attachment = new BoardAttachDto();
			ArrayList<BoardAttachDto> attachments = new ArrayList<>();
			
			try {
				String dir = req.getServletContext().getRealPath("/board-attachments");
				String userFileName = attach.getOriginalFilename();
				String savedFileName = Util.makeUniqueFileName(userFileName);
				attach.transferTo(new File(dir, savedFileName)); // 저장
				
				attachment.setBoardNo(board.getBoardNo());
				attachment.setUserFileName(userFileName);
				attachment.setSavedFileName(savedFileName);
				attachments.add(attachment);
			
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			board.setAttachments(attachments);
			
			try {
				boardService.modifyBoard(board);
			} catch (Exception e) {
				System.out.println("글 수정 실패");
				return String.format("redirect:edit?boardNo=%d&pageNo=%d", board.getBoardNo(), pageNo); 
			}
		}
		return String.format("redirect:detail?boardNo=%d&pageNo=%d", board.getBoardNo(), pageNo);
	}
	
	@GetMapping("/delete-attach")
	@ResponseBody
	public String deleteAttach(@RequestParam(required = false) Integer attachNo, HttpServletRequest req) {
		
		if(attachNo == null) {
			return "invalid attachNo";
		}
		
		// edit-page 파일 삭제
		BoardAttachDto attach = boardService.findBoardAttachByAttachNo(attachNo);
		String dirpath = req.getServletContext().getRealPath("/board-attachments");
		File file = new File(dirpath, attach.getSavedFileName());
		
		if(file.exists()) {
			file.delete();
		}
		boardService.deleteBoardAttach(attachNo);
		
		return "success";
	}
	
	
	
	@GetMapping("/list-comment")
	public String listComment(int boardNo, Model model) {
		List<BoardCommentDto> comments = boardService.findBoardCommentsByBoardNo(boardNo);
		model.addAttribute("comments", comments);
		
		return "/board/comment-list";
	}
	

	
	

	
}
