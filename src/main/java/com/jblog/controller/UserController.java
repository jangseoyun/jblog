package com.jblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	//----[로그인 폼]--------------------------------------------------------
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		System.out.println("Controller.user.loginForm 접속");
		
		return "user/loginForm";
		
	}
	
	//----[회원가입 폼]--------------------------------------------------------
	@RequestMapping("/joinForm")
	public String joinForm() {
		
		System.out.println("Controller.user.joinForm 접속");
		
		return "user/joinForm";
		
	}

}
