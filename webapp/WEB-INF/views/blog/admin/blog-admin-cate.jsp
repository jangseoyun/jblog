<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">
		
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">
			<ul id="admin-menu" class="clearfix">
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">기본설정</a></li>
				<li class="tabbtn selected"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/category">카테고리</a></li>
				<li class="tabbtn"><a href="">글작성</a></li>
			</ul>
			<!-- //admin-menu -->
			
			<div id="admin-content">
			
				<table id="admin-cate-list">
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col>
						<col style="width: 50px;">
					</colgroup>
		      		<thead>
			      		<tr>
			      			<th>번호</th>
			      			<th>카테고리명</th>
			      			<th>포스트 수</th>
			      			<th>설명</th>
			      			<th>삭제</th>      			
			      		</tr>
		      		</thead>
		      		<tbody id="cateList">
		      			<!-- 리스트 영역 -->
						<!-- 리스트 영역 -->
					</tbody>
				</table>
      	
		      	<table id="admin-cate-add" >
		      		<colgroup>
						<col style="width: 100px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input id="cate-name" type="text" name="name" value=""></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input id="cate-desc" type="text" name="desc" value=""></td>
		      		</tr>
		      	</table> 
			
				<div id="btnArea">
		      		<button id="btnAddCate" class="btn_l" type="submit" >카테고리추가</button>
		      	</div>
			
			</div>
			<!-- //admin-content -->
		</div>	
		<!-- //content -->
		
		
		<!-- 개인블로그 푸터 -->
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
	
	
	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">
	/*1) 카테고리 리스트 가져오기 */
	$(document).ready(function(){
		
		
		console.log("리스트요청");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/RequestMapping/admin/cateList",
			type : "post",
			
			dataType : "json",
			success : function(cateList){
				/*성공 코드 */
	
				for(var i = 0; i<cateList.length; i++){
					render(cateList[i]);
				}
			
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});

	});
	
	//----------------------------------------------------
	/* 1-1) 리스트 화면 그리기 */
	function render(cateVo){//cateList
		
		var str = '';
		str += ' <tr> ';
		str += ' 		<td>'+cateVo.cateNo+'</td> ';
		str += ' 		<td>'+cateVo.cateName+'</td> ';
		str += ' 		<td>5</td> ';
		str += ' 		<td>'+cateVo.description+'</td> ';
		str += ' 		<td class="text-center"> ';
		str += ' 			<img class="btnCateDel" src="${pageContext.request.contextPath}/assets/images/delete.jpg"> ';
		str += ' 		</td> ';
		str += ' </tr> ';
		
		$('#cateList').html(str);
		
	}; 
	
	//=================================================================
	
	/* 2) 카테고리 등록 */
	$('#btnAddCate').on('click', function(){

		console.log('카테고리 추가 클릭');
		
		//데이터 모으기
		var cateVo = {
			catename : $('#cate-name').val(), //카테고리명
			description : $('#cate-desc').val() //카테고리 설명
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/RequestMapping/admin/cateAdd",
			type : "post",
			contentType : "application/json",
			data : cateVo,
			
			dataType : "json",
			success : function(result){
			/*성공시 처리해야될 코드 작성*/
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});
		
	});
	
	


</script>




</html>