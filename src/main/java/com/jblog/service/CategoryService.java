package com.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.CategoryDao;
import com.jblog.vo.CategoryVo;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
	public List<CategoryVo> cateSelect() {
		
		System.out.println("Service.blog.cateList");
		return categoryDao.cateSelect();
	}
	
	// ----[카테고리 등록]--------------------------------------------------------
	public String cateInsert(CategoryVo categoryVo) {
		
		System.out.println("Service.blog.cateInsert");
		return categoryDao.cateInsert(categoryVo);
	}

}
