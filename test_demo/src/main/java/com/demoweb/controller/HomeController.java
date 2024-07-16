package com.demoweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(path = { "/", "/home" }) // 클래스에 해도 됨.
	public String home() {
		return "home";
	}
}
