<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="" method="post">
		<c:forEach var="i" items="${ userPrivacy }">
	이름 : <input type="text" name="userName" value="${i.userName}"><br/>
	비밀번호 : <input type="password" name="userPwd" value="${i.userName}"><br/>
	나이 : <input type="text" name="userAge" value="${i.userAge}"><br/>
	폰번호 : <input type="text" name="userPhone" value="${i.userPhone}"><br/>
	<input type="hidden" name="userID" value="${i.userID}">
			<input type="submit" value="확인" onclick="javascript: form.action='userInfoUpdate'">
		</c:forEach>
		</form>

</body>
</html>