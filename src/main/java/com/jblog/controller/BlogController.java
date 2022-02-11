package com.jblog.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.service.BlogService;
import com.jblog.service.PostService;

@Controller
@RequestMapping(value="/{id}")
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private PostService postService;

	// ----[내블로그로 이동]--------------------------------------------------------
	@RequestMapping("")
	public String getBlog(@PathVariable(value="id") String id,
							Model model) {

		System.out.println("Controller.blog.getBlog 접근");
		Map<String,Object> blogMap = blogService.getBlogVo(id);
		model.addAttribute("blogMap",blogMap);
		System.out.println("BlogMap:" + blogMap);
		
		return "blog/blog-main";
	}
	
	// ----[블로그 로그인]--------------------------------------------------------
	@RequestMapping("blogLogin")
	public String blogLogin() {

		System.out.println("Controller.blog.blogLogin 접근");
		return "redirect:/{id}";
	}
	
	// ----[블로그 로그아웃]--------------------------------------------------------
	@RequestMapping("/blogLogout")
	public String blogLogout(HttpSession httpSession) {
		
		System.out.println("Controller.blog.blogLogout 접근");
		
		httpSession.removeAttribute("authUser");
		httpSession.invalidate();
		
		return "redirect:/{id}";
	}
	
	//========================================================================
	// ----[내블로그 관리]--------------------------------------------------------
	@RequestMapping("/admin/basic")
	public String adminBasic() {
		
		System.out.println("Controller.blog.adminBasic 접근");
		return "blog/admin/blog-admin-basic";
	}
	
	// ----[블로그 기본정보 수정]--------------------------------------------------------
	@RequestMapping("/basicModify")
	public String basicModify(@RequestParam MultipartFile file
								,@RequestParam("blogTitle") String blogTitle
								,@RequestParam("id") String id
								,Model model) {
		
		System.out.println("Controller.blog.basicModify 접근");
		//System.out.println(file.getOriginalFilename());
		String logoFilePath = blogService.basicUpdate(blogTitle,file,id);
		model.addAttribute("logoFilePath",logoFilePath);
		System.out.println("controller:"+logoFilePath);
		 
		return "redirect:/{id}";
	}
	
	//====================================================================
	// ----[글작성]--------------------------------------------------------
	@RequestMapping("/admin/writeForm")
	public String writeForm() {
		
		System.out.println("Controller.blog.writeForm 접근");
		//post 가져오기
		
		return "blog/admin/blog-admin-write";
	}
	
	
	
	
}
