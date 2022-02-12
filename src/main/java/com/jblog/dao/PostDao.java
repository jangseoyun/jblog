package com.jblog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.PostVo;

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
	
	// ----[포스트 등록]--------------------------------------------------------
	public int postInsert(PostVo postVo) {
		
		System.out.println("Dao.post.postInsert 접근");
		return sqlSession.insert("post.postInsert",postVo);
	}
	

}
