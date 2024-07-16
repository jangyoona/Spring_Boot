package com.demoweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.mail.internet.MimeMessage;
import lombok.Setter;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;

	@GetMapping("/send-mail")
	public String sendMail(Model model) {
		
		boolean success = true;
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
			
			messageHelper.setFrom("olozg@naver.com");
			messageHelper.setTo(new String[] {"ddslk75@naver.com"});
			messageHelper.setSubject("츄베릅");
			message.setContent(String.format("<html><body><h1>%s</h1></body></html>","넌 내게 반했어"), "text/html;charset=utf-8");
			
			mailSender.send(message);
			
		} catch (Exception ex) {
			success = false;
		}
		
		model.addAttribute("success", success);
		
		return "mail/send-mail-completion";
	}
}
