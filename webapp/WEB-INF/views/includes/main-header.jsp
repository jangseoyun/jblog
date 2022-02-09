<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<!-- 메인 로고 이미지를 링크하세요 logo.jpg -->
	 	<a href="${pageContext.request.contextPath}/">
			<img class="logo" src="${pageContext.request.contextPath}/assets/images/logo.jpg">
		</a>
		<ul class="menu">

 			<c:choose>
 			
 				<c:when test="${authUser == null}">
 					<!-- 로그인 전 메뉴 -->
					<li><a href="${pageContext.request.contextPath}/user/loginForm">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/user/joinForm">회원가입</a></li>
 				</c:when>
 				<c:otherwise>
 					<!-- 로그인 후 메뉴 -->
					<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}">내블로그</a></li>
 				</c:otherwise>
 			
 			</c:choose>
 			
 		</ul>