<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재입력</title>
</head>
<body>

	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->

	<h1>비밀번호 재입력 페이지</h1>

	<form action="#" method="post">
		비밀번호 <input type="password" name="userPwd" id="userPwd" value=""
					placeholder="비밀번호를 입력"> 
				<button type="button" onclick="bbb()">확인</button>
	</form>

	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->
	<script type="text/javascript">
	function bbb(){
		const temp = document.querySelector('#userPwd').value; 
		 opener.aaa(temp); 
		 window.close();
	}
		
	</script>
</body>
</html>