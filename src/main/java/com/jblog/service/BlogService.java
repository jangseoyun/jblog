package com.jblog.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.dao.BlogDao;

@Service
public class BlogService {
	
	@Autowired
	private BlogDao blogDao;
	
	String saveDir = "c:\\javaStudy\\jblog-file";
	
	// ----[블로그 기본 정보(타이틀,로고)]--------------------------------------------------------
	public Map<String,Object> getBlogVo(String id) {

		Map<String,Object> blogMap  = new HashMap<String, Object>();
		blogMap.put("getBlogVo", blogDao.getBlogVo(id));

		return blogMap ;
	}
	
	// ----[내블로그 관리]--------------------------------------------------------
	public String basicUpdate(String blogTitle, MultipartFile file, String id) {
		
		System.out.println("Service.blog.basicUpdate");

		//운영 내용 추출
		//1) 원본파일명
		String orgFile = file.getOriginalFilename();
		//2) 확장자
		String exName = orgFile.substring(orgFile.lastIndexOf("."));
		//3) 저장파일명
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		//4) 파일 저장 위치
		String filePath = saveDir+"\\"+saveName;
		
		Map<String, String> basicMap = new HashMap<String, String>();
		basicMap.put("blogTitle",blogTitle);
		basicMap.put("saveName",saveName);
		basicMap.put("id", id);
		
		//5) DB저장
		blogDao.basicUpdate(basicMap);
		
		//6) 파일 업로드
		try {
			byte[] fileDate = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			bout.write(fileDate);
			bout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return saveName;
	}
	
	
	
	
	
	
	
	
	
	
}
