package com.jblog.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.BlogVo;

@Repository
public class BlogDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//블로그 타이틀, 
	public BlogVo getBlogVo(String id) {
		BlogVo getBlogVo = sqlSession.selectOne("blog.getBlogVo",id);
		System.out.println(getBlogVo);
		return getBlogVo;
	}
	
	// ----[기본 정보 수정]--------------------------------------------------------
	public int basicUpdate(Map<String,String> basicMap) {
		
		System.out.println("Dao.user.basicUpate 접근");
		return sqlSession.update("blog.basicUpdate",basicMap);
	}

	

}
