package com.jblog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.service.UserService;
import com.jblog.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	// ----[로그인 폼]--------------------------------------------------------
	@RequestMapping("/loginForm")
	public String loginForm() {

		System.out.println("Controller.user.loginForm 접속");
		return "user/loginForm";

	}
	
	// ----[로그인]--------------------------------------------------------
	@RequestMapping("/login")
	public String login(@ModelAttribute UserVo userVo,
						HttpSession httpSession) {
		
		System.out.println("Controller.user.login 접속");
		UserVo authUser = userService.getUser(userVo);
		System.out.println(authUser);
		//세션 저장
		if(authUser != null) {
			httpSession.setAttribute("authUser", authUser);
			return "redirect:/";
		}else {
			return "redirect:/user/loginForm";
		}

	}

	// ----[회원가입 폼]--------------------------------------------------------
	@RequestMapping("/joinForm")
	public String joinForm() {

		System.out.println("Controller.user.joinForm 접속");
		return "user/joinForm";

	}

	// ----[회원가입 실행]--------------------------------------------------------
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo userVo) {

		System.out.println("Controller.user.join 접속");
		userService.joinInsert(userVo);
		System.out.println(userVo);

		return "user/joinSuccess";

	}
	
	// ----[아이디 중복 체크]--------------------------------------------------------
	@RequestMapping("/idCheck")
	@ResponseBody
	public int inCheck(@RequestParam("id") String id) {
		
		System.out.println("Controller.user.idCheck 접속");
		int count = userService.idCheck(id);

		return count;
	}
	
	// ----[로그아웃]--------------------------------------------------------
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession) {
		
		System.out.println("Controller.user.logout 접속");
		
		//세션정보 삭제
		httpSession.removeAttribute("authUser");
		httpSession.invalidate();
		
		return "redirect:/";
	}
	

}
