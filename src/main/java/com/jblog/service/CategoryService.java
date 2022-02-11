package com.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.CategoryDao;
import com.jblog.dao.PostDao;
import com.jblog.vo.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private PostDao postDao;
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
	public List<CategoryVo> cateSelect() {

		System.out.println("Service.blog.cateList");
		return categoryDao.cateSelect();
	}

	// ----[카테고리 등록+리턴]--------------------------------------------------------
	public CategoryVo cateInsert(CategoryVo categoryVo) {

		System.out.println("Service.cate.cateInsert");
		int count = categoryDao.cateInsert(categoryVo);
		System.out.println(count);
		// -------------
		int cateNo = categoryVo.getCateNo();
		CategoryVo cateVo = categoryDao.cateVo(cateNo);
		System.out.println("카테고리 등록+리턴:" + cateVo);

		return cateVo;
	}
	
	// ----[포스트 카운트]--------------------------------------------------------
	public int postCount(int cateNo) {
		
		System.out.println("Service.cate.postCount");
		int postCount = postDao.postCount(cateNo);
		System.out.println(postCount);
		
		return 0;
	}

	// ----[카테고리 삭제]--------------------------------------------------------
	public int cateDelete(int cateNo) {

		System.out.println("Service.cate.cateDelete");

		int count = categoryDao.cateDelete(cateNo);
		
		return count;

	}
}
