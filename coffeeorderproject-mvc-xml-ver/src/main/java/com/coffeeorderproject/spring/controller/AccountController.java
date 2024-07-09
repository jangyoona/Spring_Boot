package com.coffeeorderproject.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.coffeeorderproject.spring.dto.UserDto;
import com.coffeeorderproject.spring.service.AccountService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Setter;


@Controller
public class AccountController {
	
	@Setter(onMethod_ = { @Autowired})
	private AccountService accountService;
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;
	
	
	@GetMapping("/userAccount/login")
	public String loginForm() {
		return "/userAccount/login";
	}
	
	@PostMapping("/userAccount/login")
	public String login(UserDto user, String id, String pw, HttpSession session) {
		user.setUserId(id);
		user.setUserPw(pw);
		UserDto member = accountService.signInUser(user);
		
		if (member != null) {
			session.setAttribute("loginUser", member);
			//ArrayList<CartDto> userCart = accountService.getUserCart(user.getUserId());
			//session.setAttribute("appUserCart", userCart);
			return "redirect:/home";
		} else {
			return "redirect:/userAccount/login?loginfail=true";
		}
	}
	
	@GetMapping(path = { "/userMyPage/logout" })
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginUser");
		return "redirect:/home";
	}
	
	
	
	@GetMapping("/userAccount/register")
	public String register(@ModelAttribute("user") UserDto user, Model model) {
		
		Boolean isHaveId = accountService.checkId(user);
		model.addAttribute("isHaveId", isHaveId);
		
		return "/userAccount/register";
	}
	
	
	
	
	
	@PostMapping("/userAccount/register")
	public String registerCheck(@Valid @ModelAttribute("user") UserDto user, BindingResult br) {

		if (br.hasErrors()) {
//			for( ObjectError error :  br.getAllErrors() ) {
//				System.out.println(error.getDefaultMessage());
//			}
			return "/userAccount/register";
		}
			
		accountService.inputUser(user);
		return "redirect:/userAccount/login";
	}
	
	
	@GetMapping("/userAccount/checkUser")
	public String checkUserId(UserDto user, Model model) {
		
		Boolean isHaveId = accountService.checkId(user);
		System.out.println(isHaveId);
//		if(isHaveId == false) {
//			isHaveId = true;
//		} else {
//			isHaveId = false;
//		}
		
		model.addAttribute("isHaveId", isHaveId);
		
		return "/userAccount/checkUser";
	}
	
	
	@PostMapping("/userAccount/sendMail")
	public String sendMail(String userId, HttpSession session, HttpServletRequest req, Model model) {
		
		UserDto user = accountService.getUserEmail(userId);
	
		String from = "olozg@naver.com";
		String to = user.getUserEmail();
		String title = "비밀번호 재설정";
		int key = (int)(Math.random() * 1000000000);
		
		boolean success = true;
		ServletContext sc = req.getServletContext();
		sc.setAttribute(to, key);
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
			
			messageHelper.setFrom(from);
			messageHelper.setTo(new String[] {to});
			messageHelper.setSubject(title);
			message.setContent(String.format("<html><body><a href='http://localhost:8081/coffeeorderproject/userAccount/reset-passwd?email=%s&key=%d'>비밀번호 재설정 하기</a></body></html>", to, key),
											 "text/html;charset=utf-8");
			
			mailSender.send(message);
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			success = false;
		}
	
		model.addAttribute("success", success);
		return "/userAccount/emailMessage";
	}
	
	
	@GetMapping("/userAccount/reset-passwd")
	public String resetPasswdForm(String email, HttpServletRequest req) {
		
		ServletContext session = req.getServletContext();
		int userKey = (int)session.getAttribute(email);
		
		int paramKey = Integer.parseInt(req.getParameter("key"));
		
		if(userKey == paramKey) {
			session.removeAttribute(email);
		
		}
		return "/userAccount/resetPw";
	}
	
	@PostMapping("/userAccount/reset-passwd") // 다시해야함
	public String resetPasswd(String userId, String newpw) {
		
		accountService.changeUserPw(userId, newpw);

		return "/home";
		
	}

}
