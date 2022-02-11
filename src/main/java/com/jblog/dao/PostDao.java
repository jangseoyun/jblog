package com.jblog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ----[포스트 카운트]--------------------------------------------------------
	public int postCount(int cateNo) {
		
		System.out.println("Dao.post.postCount 접근");
		int count = sqlSession.selectOne("post.postCount",cateNo);
		System.out.println("post dao:"+count);
		
		return count;
	}

}
