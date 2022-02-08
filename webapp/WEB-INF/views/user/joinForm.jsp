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
	<div id="center-content">
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>

		<div>		
			<form id="joinForm" method="get" action="${pageContext.request.contextPath}/user/join">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id" value=""></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      		</tr>
		      		<tr>
		      			<td></td>
		      			<td id="tdMsg" colspan="2"></td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName"  value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="" value="">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
	      		
			</form>
			
		</div>
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	</div>

</body>

<script type="text/javascript">
	
	/* 아이디 중복 체크 */
	$('#btnIdCheck').on('click', function(){
		console.log('아이디 체크 버튼');
		
		//데이터 모으기
		var id = $('#txtId').val();
		console.log(id);
		
		$.ajax({
			//-------보낼때
			//요청할 컨트롤러 주소
			url : "${pageContext.request.contextPath}/user/idCheck",
			//주소창이 변하지 않기 때문에 post,get 방식 모두 동일 
			type : "post",
			//contentType : "application/json",
			data : {id:id}, 
			
			//-------받을때 
			dataType : "json",
			success : function(count){//json-->js로 변환되어 들어옴
				/*성공시 처리해야될 코드 작성*/
				console.log(count);
				
				if(count==1){
					$("#tdMsg").text("다른 아이디로 가입해 주세요.");
					$("#txtId").val("");
				}else{
					$("#tdMsg").text("사용할 수 있는 아이디 입니다.");
				}

			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
			
		})
	});

</script>


</html>