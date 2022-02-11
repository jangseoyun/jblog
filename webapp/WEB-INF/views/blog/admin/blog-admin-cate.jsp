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
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/admin/basic">기본설정</a></li>
				<li class="tabbtn selected"><a href="${pageContext.request.contextPath}/admin/category">카테고리</a></li>
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/admin/writeForm">글작성</a></li>
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
		      		<button id="btnAddCate" class="btn_l" type="submit" data-id="${authUser.id}" >카테고리추가</button>
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
			url : "${pageContext.request.contextPath}/admin/cateList",
			type : "post",
			
			dataType : "json",
			success : function(cateList){
				/*성공 코드 */
				
				for(var i = 0; i<cateList.length; i++){
					render(cateList[i],postCount(),'down');
				}
			
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});

	});
	
	

	//----------------------------------------------------
	/* 1-1) 리스트 화면 html */
	function render(cateVo,postCount,updown){//cateList
		
		var str = '';
		str += ' <tr id="t"> ';
		str += ' 		<td>'+cateVo.cateNo+'</td> ';
		str += ' 		<td>'+cateVo.cateName+'</td> ';
		str += ' 		<td>'+postCount+'</td> ';
		str += ' 		<td>'+cateVo.description+'</td> ';
		str += ' 		<td class="text-center"> ';
		str += ' 			<img class="btnCateDel" data-cateno="'+cateVo.cateNo +'"src="${pageContext.request.contextPath}/assets/images/delete.jpg"> ';
		str += ' 		</td> ';
		str += ' </tr> ';
		
		 if(updown == 'down'){
			$('#cateList').append(str);
		}else if(updown == 'up'){
			$('#cateList').prepend(str);
		}else{
			console.log('잘못된 방향 입력');
		} 

	}; 
	
	//=================================================================
	
	/* 2) 카테고리 등록 */
	$('#btnAddCate').on('click', function(){

		console.log('카테고리 추가 클릭');

		//데이터 모으기
		var cateName = $('#cate-name').val();
		var description = $('#cate-desc').val();
		var id = $('#btnAddCate').data('id');
		
		var cateVo = {
			cateName : cateName, //카테고리명
			description : description, //카테고리 설명
			id : id //아이디
		};
		
		console.log(cateVo);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/cateAdd",
			type : "post",
			//contentType : "application/json",
			data : cateVo,
			
			dataType : "json",
			success : function(cateVo){
			/*성공시 처리해야될 코드 작성*/
				console.log(cateVo)
				
				//포스트 카운트 가져오기
				var postCount = postCount(cateVo.cateNo);
				console.log('그리기전:'+postCount);
				
				//그리기
				render(cateVo,postCount,'up');
			
				$('#cate-name').val("");
				$('#cate-desc').val("");
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});
		
	});
	
	//=================================================================
	/* 3) 포스트 카운트 */
	
	var postCount = function postCount(cateNo){
		
		var cateNo = cateNo;
		console.log("포스트카운트"+cateNo);

		$.ajax({
			url : "${pageContext.request.contextPath}/admin/postCount",
			type : "post",
			//contentType : "application/json",
			data : {cateNo : cateNo},
			
			dataType : "json",
			success : function(postCount){
			/*성공시 처리해야될 코드 작성*/
				console.log(postCount)
				
			},
			error : function(XHR, status, error) {
			console.error(status + " : " + error);
			}
		});
		
	}

	
	

</script>




</html>