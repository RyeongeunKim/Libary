<%@page import="java.util.List"%>
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

	<%
		List rentalList = (List)request.getAttribute("reantalList");
		List bookList = (List)request.getAttribute("bookList");
	%>

	<h1>책정보</h1>
	<table border="1">
		<tr>
			<th>저자</th>
			<th>서명</th>	
			<th>분류</th>	
			<th>출판사</th>	
			<th>대출여부</th>	
		</tr>
		<c:forEach var="i" items="${ bookList }" varStatus="deo">	
				<tr>
					<td>${i.bookWriter}</td>
					<td>${i.bookName}</td>					
					<td>${i.bookCategory}</td>					
					<td>${i.bookPublisher}</td>		
					<c:choose>
						<c:when test="${rentalList[deo.index].rentalKey == 1}">
						<td>대출가능(비치중)</td>	
						</c:when>
						<c:otherwise>
						<td>대출불가</td>	
						</c:otherwise>
					</c:choose>	
				</tr>
		</c:forEach>	
	</table>
</body>
</html>