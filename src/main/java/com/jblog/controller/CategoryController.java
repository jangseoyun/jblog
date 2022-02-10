package com.jblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.service.CategoryService;
import com.jblog.vo.CategoryVo;

@Controller
@RequestMapping(value="/{id}")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
	@RequestMapping("/admin/category")
	public String categoryMain() {
		
		System.out.println("Controller.blog.category 접근");
		return "blog/admin/blog-admin-cate";
	}
	
	// ----[카테고리 리스트 요청]--------------------------------------------------------
	@RequestMapping("/admin/cateList")
	@ResponseBody
	public List<CategoryVo> cateList(){
		
		System.out.println("Controller.blog.cateList 접근");
		List<CategoryVo> cateList = categoryService.cateSelect();
		System.out.println(cateList);

		return cateList;
	}
	
	// ----[카테고리 등록]--------------------------------------------------------
	@RequestMapping("admin/cateAdd")
	@ResponseBody
	public String cateAdd(@ModelAttribute CategoryVo categoryVo) {
		
		System.out.println("Controller.blog.cateAdd 접근");
		CategoryVo cateVo = categoryService.cateInsert(categoryVo);
		
		return cateVo;
	}
	
	
	
	
}
