package com.demoweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demoweb.dto.MemberDto;
import com.demoweb.service.AccountService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Setter;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Setter(onMethod_ = { @Autowired})
	private AccountService accountService;
	
//	@RequestMapping(path = { "/register" }) // 클래스에 해도 됨.
//	@RequestMapping(path = { "/register" }, method = RequestMethod.GET)
	@GetMapping("/register")
	public String registerForm(@ModelAttribute("member") MemberDto member) {
		return "/account/register";
	}
	
	@GetMapping("/dup-check/{id}") // {id} : 데이터를 의미한다. => @PathVariable로 전달받으면 됨. // 값이 여러개면 /{id}/{id2}/{id3}/ 이렇게 받으면 됨.
	@ResponseBody // 메서드의 return 값이 view-name = url경로가 아니라 그 자체가 데이터 상태로 전송된다. ( view-name이 아니기 때문에 jsp로 이동하지 않음 )
	public String dupCheck(@PathVariable("id") String id) {
		
		boolean dup = accountService.checkDuplication(id);
		
		// 응답
		return String.valueOf(dup); // @ResponseBody 어노테이션을 사용해 경로가 아니라 => dup 데이터 그 자체를 전송. 
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("member") MemberDto member, BindingResult br) {
		
		if(br.hasErrors()) {
//			for( ObjectError error :  br.getAllErrors() ) {
//				System.out.println(error.getDefaultMessage());
//			}
			return "/account/register";
		}
		
		// 회원가입 처리
		accountService.registerMember(member);
		return "redirect:login";
	}
	

	
	@GetMapping("/login")
	public String loginForm(@RequestParam(name="returnuri", defaultValue = "/home") String returnUri, Model model) {
		
		model.addAttribute("returnUri", returnUri);
		return "account/login";
	}
	
	@PostMapping("/login")
	public String login(MemberDto member, String returnUri, HttpSession session) {
		
		MemberDto loginMember = accountService.findMemberByMemeberIdAndPasswd(member);
		
		if (loginMember != null) { // 로그인 성공 ( 사용자가 입력한 id, password에 해당하는 데이터가 조회된 경우 )
			// 2-2. 로그인 처리 --> 세션에 데이터 저장
			session.setAttribute("loginuser", loginMember);
			return "redirect:" + returnUri; // 절대경로
			
		} else {
			return "redirect:login?loginfail=true&returnuri" + returnUri; // 상대경로
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate(); // 세션 전체 파괴 (모든 데이터 제거 + 세션 제거 : 초기화)
//		session.removeAttribute("loginuser"); // 둘 다 가능 내 마음대로
		return "redirect:/home";
	}
	
	@GetMapping("/reset-passwd")
	public String resetPasswdForm() {

		return "/account/reset-passwd";
	}
	
	@PostMapping("/reset-passwd")
	public String resetPasswd(MemberDto member) {
		accountService.resetPasswd(member);
		
		return "redirect:/account/login";
	}
	
	
	
	
	
	
	
}
