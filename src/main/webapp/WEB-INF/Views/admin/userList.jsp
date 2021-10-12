<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보</h1>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>	
			<th>이름</th>	
			<th>나이</th>	
			<th>전화번호</th>	
			<th>주소</th>	
		</tr>
		<c:forEach var="i" items="${ userList }">	
			<c:if test="${i.userID != null}">
				<tr>
					<td>${i.userID}</td>
					<td>${i.userPwd}</td>					
					<td>${i.userName}</td>					
					<td>${i.userAge}</td>		
					<td>${i.userPhone}</td>		
					<td>${i.userAddress}</td>		
				</tr>
			</c:if>
		</c:forEach>	
	</table>
	<p><a href="main">메인페이지로 가기</a></p>
</body>
</html>