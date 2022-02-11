package com.jblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.service.CategoryService;
import com.jblog.vo.CategoryVo;

@Controller
@RequestMapping(value="/admin")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
	@RequestMapping("/category")
	public String categoryMain() {
		
		System.out.println("Controller.cate.category 접근");
		return "blog/admin/blog-admin-cate";
	}
	
	// ----[카테고리 리스트 요청]--------------------------------------------------------
	@RequestMapping("/cateList")
	@ResponseBody
	public List<CategoryVo> cateList(){
		//cateNo 받기 + 포스트 수 가져오기 + 리스트 뿌리기
		System.out.println("Controller.cate.cateList 접근");
		List<CategoryVo> cateList = categoryService.cateSelect();
		System.out.println(cateList);

		return cateList;
	}
	
	// ----[카테고리 등록+리턴]--------------------------------------------------------
	@RequestMapping("/cateAdd")
	@ResponseBody
	public CategoryVo cateAdd(@ModelAttribute CategoryVo categoryVo) {
		
		System.out.println("Controller.cate.cateAdd 접근");
		System.out.println(categoryVo);
		CategoryVo cateVo = categoryService.cateInsert(categoryVo);
		
		return cateVo;
	}
	
	// ----[포스트 카운트]--------------------------------------------------------
	@RequestMapping("/postCount")
	@ResponseBody
	public int postCount(@RequestParam("cateNo") int cateNo) {
		
		System.out.println("Controller.cate.postCount 접근");
		System.out.println(cateNo);
		
		int postCount = categoryService.postCount(cateNo);
		
		return postCount;
	}

	// ----[카테고리 삭제]--------------------------------------------------------
	@RequestMapping("/cateDelete")
	@ResponseBody
	public int cateDelete(@RequestParam("cateNo") int cateNo) {
		
		System.out.println("Controller.cate.cateDelete 접근");
		System.out.println(cateNo);
		
		int count = categoryService.cateDelete(cateNo);
		System.out.println("최종카운트:"+count);
		
		return count;
	}
	
}
