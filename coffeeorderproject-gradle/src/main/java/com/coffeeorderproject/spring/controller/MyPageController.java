package com.coffeeorderproject.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.coffeeorderproject.spring.common.Util;
import com.coffeeorderproject.spring.dto.BoardAttachDto;
import com.coffeeorderproject.spring.dto.BoardDto;
import com.coffeeorderproject.spring.dto.ProductDto;
import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.dto.UserOrderDto;
import com.coffeeorderproject.spring.service.MyPageService;
import com.coffeeorderproject.spring.service.UserBoardService;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
@Controller
@RequestMapping("/userMyPage")
public class MyPageController {

	@Setter(onMethod_ = { @Autowired})
	private MyPageService mypageService;
	
	@Setter(onMethod_ = { @Autowired})
	private UserBoardService userBoardService;
	
	@GetMapping("/mypage")
	public String MyPageForm(HttpSession session, Model model) {
		
		UserDto user = (UserDto)session.getAttribute("loginUser");
		String userId = user.getUserId();
		
		ArrayList<UserOrderDto> orderList = mypageService.findMyPageUserorder(userId);
		model.addAttribute("userOrders", orderList);
		
		ArrayList<UserCouponDto> coupon = mypageService.UserCoupon(userId);
		model.addAttribute("userCoupon", coupon);
		
		ArrayList<BoardDto> userBoardList = mypageService.UserBoard(userId);
		model.addAttribute("board", userBoardList);
		
		
		return "/userMyPage/mypage";
	}
	
	@GetMapping("/order-list")
	public String orderListForm(HttpSession session, String page, Model model) {
        
		UserDto user = (UserDto)session.getAttribute("loginUser");
		String userId = user.getUserId();
		int pageNum = Integer.parseInt(page);
		
		ArrayList<UserOrderDto> orderArr = mypageService.getUserOrder(pageNum, userId);
		int orderCount = mypageService.getUserOrderCount(userId);
		
		int allPageNum = orderCount / 15 + (orderCount % 15 > 0 ? 1 : 0);
		int pagerBlock = (pageNum - 1) / 2;
		int start = (pagerBlock * 2) + 1;
		int end = start + 2;
		
		end = end > allPageNum ? allPageNum : end;
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("allPageNum", allPageNum);
		
		model.addAttribute("orders", orderArr);
		model.addAttribute("orderCount", orderCount);
		
		return "/userMyPage/order-list";
	}
	
//	@GetMapping("user-review")
//	public String reviewForm(HttpSession session, String page, Model model) {
//        
//        UserDto user = (UserDto)session.getAttribute("loginUser");
//		String userId = user.getUserId();
//        int pageNum = Integer.parseInt(page);
//        
//        
//		List<BoardDto> boardArr = userBoardService.getUserBoard(pageNum, userId);
//		int boardCount = userBoardService.getUserBoardCount(userId);
//		
//		int allPageNum = boardCount / 15 + (boardCount % 15 > 0 ? 1 : 0);
//		int pagerBlock = (pageNum - 1) / 2;
//		int start = (pagerBlock * 2) + 1;
//		int end = start + 2;
//		
//		end = end > allPageNum ? allPageNum : end;
//		
//		model.addAttribute("start", start);
//		model.addAttribute("end", end);
//		model.addAttribute("allPageNum", allPageNum);
//		
//		model.addAttribute("boardArr", boardArr);
//		model.addAttribute("boardCount", boardCount);
//		
//		
//		return "userMyPage/user-review";
//	}
	
	@GetMapping("/reviewboardwrite")
	public String reviewBoardWriteForm(@RequestParam("orderid") int orderId, Model model) {
		
		List<ProductDto> prodList = userBoardService.findProdNameList();
		
		UserOrderDto userOrder = userBoardService.findUserOder(orderId);
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("userOrder", userOrder);
		
		
		return "/board/reviewboardwrite";
	}
	
	@PostMapping(path={"/reviewboardwrite"})
	public String reviewWrite(BoardDto board, HttpServletRequest req, MultipartFile attach) {
		
		BoardAttachDto attachment = new BoardAttachDto();
		List<BoardAttachDto> attachments = new ArrayList<>();
		
		try {
			String dir = req.getServletContext().getRealPath("/board-attachments");
			String userFileName = attach.getOriginalFilename();
			String savedFileName = Util.makeUniqueFileName(userFileName);
			attach.transferTo(new File(dir, savedFileName)); // 저장
			
			attachment.setUserfilename(userFileName);
			attachment.setSavedfilename(savedFileName);
			attachments.add(attachment);
		
		} catch (Exception ex) {
		}

		board.setAttachments(attachments);
		
		try {
			userBoardService.writeBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글쓰기 실패");
		}
		
		return "redirect:/board/review";
	}
	
}
