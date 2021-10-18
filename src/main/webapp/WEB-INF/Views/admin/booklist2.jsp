<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="Pack.RentalDTO"%>
<%@ page import="Pack.BookDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		String keyword = request.getParameter("keyword");
		List rentalList = (List)request.getAttribute("reantalList");
		List bookList = (List)request.getAttribute("bookList");
	%>
	
	<form mathod="post" action="bookSearch">
		<div>
 			<select name="bookInfo">
				<option value="bookName">제목</option>
				<option value="bookWriter">저자</option>
				<option value="bookPublisher">출판사</option>
			</select> 
			<input type="text" name="keyword">			
			<input type="submit" value="검색">
		</div>    	
    </form>
    
	<h1>책정보</h1>
	<c:choose>
		<c:when test="${fn:length(bookList) == 0}">
		검색 결과가 없습니다.
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>책 일련번호</th>
					<th>이미지</th>
					<th>저자</th>
					<th>서명</th>	
					<th>분류</th>	
					<th>출판사</th>	
				</tr>
				<c:forEach var="i" items="${ bookList }" varStatus="deo">	
						<tr>
							<td>${i.bookID}</td>
							<td><img src="${i.bookImage}" alt="Image" width="120px" height="120px"></td>
							<td>${i.bookWriter}</td>
							<td><a href="bookDetail?bookID=${i.bookID}">${i.bookName}</a></td>					
							<td>${i.bookCategory}</td>					
							<td>${i.bookPublisher}</td>		
							<td>
								<a href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a>
								<a href="B?bookID=${i.bookID}">수정</a>
								<a href="rental?bookID=${i.bookID}">대여</a>
							</td>
						</tr>
				</c:forEach>
			</table>	
		</c:otherwise>
	</c:choose>
	<a href="A">추가</a>
</body>
</html>