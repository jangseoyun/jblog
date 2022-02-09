package com.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.UserDao;
import com.jblog.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	// ----[회원가입 등록]--------------------------------------------------------
	public int joinInsert(UserVo userVo) {
		
		System.out.println("Service.user.join 접근");
		return userDao.joinInsert(userVo);
		
	}
	
	// ----[아이디 중복 체크]--------------------------------------------------------
	public int idCheck(String id) {
		
		System.out.println("Service.user.idCheck 접근");
		return userDao.idCheck(id);
	}
	
	// ----[로그인]--------------------------------------------------------
	public UserVo getUser(UserVo userVo) {

		System.out.println("Service.user.login 접근");
		UserVo getUser = userDao.getUser(userVo);
		System.out.println(getUser);
		
		return getUser;
		
	}
}
