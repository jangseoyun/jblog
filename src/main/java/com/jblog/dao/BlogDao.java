package com.jblog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.CategoryVo;

@Repository
public class BlogDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ----[기본 정보 수정]--------------------------------------------------------
	public int basicUpdate(Map<String,String> basicMap) {
		
		System.out.println("Dao.user.basicUpate 접근");
		return sqlSession.update("blog.basicUpdate",basicMap);
	}
	
	// ----[카테고리 메인 리스트]--------------------------------------------------------
	public List<CategoryVo> cateSelect() {
		
		System.out.println("Dao.user.cateSelect 접근");
		List<CategoryVo> cateList = sqlSession.selectList("blog.cateSelect");
		System.out.println(cateList);
		
		return cateList;
	}
	

}
