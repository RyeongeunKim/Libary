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
	<h1>책정보</h1>
	<table border="1">
		<tr>
			<th>저자</th>
			<th>서명</th>	
			<th>분류</th>	
			<th>출판사</th>	
		</tr>
		<c:forEach var="i" items="${ searchList }">	
				<tr>
					<td>${i.bookWriter}</td>
					<td>${i.bookName}</td>					
					<td>${i.bookCategory}</td>					
					<td>${i.bookPublisher}</td>		
				</tr>
		</c:forEach>	
	</table>
</body>
</html>