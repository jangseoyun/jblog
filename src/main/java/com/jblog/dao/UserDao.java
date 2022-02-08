package com.jblog.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jblog.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ----[회원가입 등록]--------------------------------------------------------
	public int joinInsert(UserVo userVo) {
		
		System.out.println("Dao.user.joinInsert 접근");
		int join = sqlSession.insert("users.joinInsert",userVo);
		
		return join;
	}
	
	// ----[아이디 중복 체크 ]--------------------------------------------------------
	public int idCheck(String id) {
		
		System.out.println("Dao.user.idCheck 접근");
		return sqlSession.selectOne("users.idCheck",id);
	}
}
