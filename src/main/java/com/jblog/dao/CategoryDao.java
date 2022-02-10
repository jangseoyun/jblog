package com.jblog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
		public List<CategoryVo> cateSelect() {
			
			System.out.println("Dao.user.cateSelect 접근");
			List<CategoryVo> cateList = sqlSession.selectList("category.cateSelect");
			System.out.println(cateList);
			
			return cateList;
		}

}
