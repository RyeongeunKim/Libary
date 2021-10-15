<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List bookList = (List)request.getAttribute("bookList");
	%>

	<h1>책정보</h1>
	<c:choose>
		<c:when test="${fn:length(bookList) == 0}">
		검색 결과가 없습니다.
		</c:when>
		<c:otherwise>
		<table border="1">
			<tr>
				<th>이미지</th>
				<th>저자</th>
				<th>서명</th>	
				<th>분류</th>	
				<th>출판사</th>	
			</tr>
			<c:forEach var="i" items="${ bookList }" varStatus="deo">	
					<tr>
					
						<td><img src="${i.bookImage}" alt="Image" width="120px" height="120px"></td>
						<td>${i.bookWriter}</td>
						<td><a href="bookDetail?bookID=${i.bookID}">${i.bookName}</a></td>					
						<td>${i.bookCategory}</td>					
						<td>${i.bookPublisher}</td>		

					</tr>
			</c:forEach>	
		</c:otherwise>
	</c:choose>
</body>
</html>