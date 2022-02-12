package com.jblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jblog.service.PostService;
import com.jblog.vo.PostVo;

@Controller
@RequestMapping("/admin")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	// ----[포스트 폼]--------------------------------------------------------
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		System.out.println("Controller.post.writeForm 접근");
		return "blog/admin/blog-admin-write";
	}
	
	// ----[포스트 등록]--------------------------------------------------------
	@RequestMapping("/write")
	public String write(@ModelAttribute PostVo postVo) {
		
		System.out.println("Controller.post.write 접근");
		int count = postService.postAdd(postVo);
		System.out.println("성공여부:"+count);
		
		return "redirect:/admin/writeForm";
		
	}
	
	

}
