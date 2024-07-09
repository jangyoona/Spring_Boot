package com.demoweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.demoweb.dto.BoardCommentDto;
import com.demoweb.service.BoardService;

import lombok.Setter;

@RestController // 모든 @~Mapping에 @ResponseBody를 자동으로 설정하는 녀석 -- Ajax 응답 전용? 컨트롤러로 생각하래.
@RequestMapping("/board")
public class CommentRestController {

	@Setter(onMethod_ = {@Autowired})
	BoardService boardService;
	
	@PostMapping(path = {"/write-comment"}, produces ="text/plain;charset=utf-8")
	//@ResponseBody //@RestController 클래스에서는 생략
	public String writeComment(BoardCommentDto comment) {
		
		String result = "success";
		try {
			boardService.writeComment(comment);		
		} catch (Exception e) {
			result = "fail";
		}
		
		return result;
	}
	
	@GetMapping(path = "/list-comment-as-json", produces = "application/json;charset=utf-8")
	public List<BoardCommentDto> listComment(int boardNo, Model model) {
		List<BoardCommentDto> comments = boardService.findBoardCommentsByBoardNo(boardNo);
		//model.addAttribute("comments", comments); 이것두 필요없음 아래처럼 데이터 자체를 리턴하면 되니까.
		
		return comments;
	}
	
	@GetMapping("/delete-comment")
	public String deleteComment(@RequestParam(required = false) Integer commentNo) {
		
		if(commentNo == -1) {
			return "invalid comment no";
		}
		
		boardService.deleteComment(commentNo);
		
		return "success";
	}
	
	@PostMapping("/edit-comment")
	public String editComment(BoardCommentDto comment) {
		
		boardService.editComment(comment);
		return "success";
	}
	
	@PostMapping("/write-recomment")
	public String writeReComment(BoardCommentDto comment) {
		
		boardService.writeReComment(comment);
		return "success";
	}
	
	
	
	
}






