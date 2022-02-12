package com.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jblog.dao.PostDao;
import com.jblog.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	// ----[포스트 등록]--------------------------------------------------------
	public int postAdd(PostVo postVo) {
		
		System.out.println("Controller.post.postAdd 접근");
		return postDao.postInsert(postVo);
	}
	

}
