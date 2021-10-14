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
		String keyword = request.getParameter("keyword");
	%>
	<%= keyword %>

	<form mathod="post" action="bookSearch">
		<div>
 			<select name="bookvalue">
				<option value="bookName">제목</option>
				<option value="bookWriter">저자</option>
				<option value="bookPublisher">출판사</option>
			</select> 
			<input type="text" name="keyword">			
			<input type="submit" value="검색">
		</div>    	
    </form>

	<h1>책 리스트</h1>

	<table border="1">
		<tr>
			<th>책 일련번호</th>
			<th>저자</th>	
			<th>책 제목</th>	
			<th>책 카테고리</th>	
			<th>출판사</th>		
		</tr>
		<c:forEach var="i" items="${ booklist }">	
			<c:if test="${i.bookID != null}">
				<tr>
					<td>${i.bookID}</td>
					<td>${i.bookWriter}</td>					
					<td>${i.bookName}</td>					
					<td>${i.bookCategory}</td>		
					<td>${i.bookPublisher}</td>
					<td>
						<a href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a>
						<a href="B?bookID=${i.bookID}">수정</a>
					</td>				
				</tr>
			</c:if>
		</c:forEach>	
	</table>
	<a href="A">추가</a>
	
	
</body>
</html>