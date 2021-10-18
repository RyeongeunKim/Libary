<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 책 리스트</title>

<link href="${path}/resources/bootstrap/css/booklist.css" rel="stylesheet">

</head>
<body>


	<%
		String keyword = request.getParameter("keyword");
		List bookList = (List)request.getAttribute("bookList");
	%>
	
	
		<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->
	
   <!-- Page Add Section Begin -->
    <section class="page-ad ㅡd">
        <div class="container" id="add">
        </div>
    </section>
    <!-- Page Add Section End -->
	

	<div class="container">
	  <div class="row">
	    <div class="col-1">
	    <!-- left -->
	    </div>
	    
	    <div class="col-10">
		<!-- 본문 -->
		
			
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
					<th>대출여부</th>	
				</tr>
				<c:forEach var="i" items="${ bookList }" varStatus="deo">	
						<tr>
							<td>${i.bookID}</td>
							<td><img src="${i.bookImage}" alt="Image" width="120px" height="120px"></td>
							<td>${i.bookWriter}</td>
							<td><a href="bookDetail?bookID=${i.bookID}">${i.bookName}</a></td>					
							<td>${i.bookCategory}</td>					
							<td>${i.bookPublisher}</td>
							<c:choose>
								<c:when test="${i.bookRentalKey == 1}">
									<td>대여가능</td>		
									<td>
										<a href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a><br/>
										<a href="B?bookID=${i.bookID}">수정</a><br/>
										<a href="rental?bookID=${i.bookID}">대여</a>
									</td>
								</c:when>
								<c:otherwise>
									<td>대여불가능</td>
									<td>
										<a href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a><br/>
										<a href="B?bookID=${i.bookID}">수정</a><br/>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
				</c:forEach>
			</table>	
		</c:otherwise>
	</c:choose>
	
	
	<a href="A">추가</a>
		
	    </div>
	    
	    <div class="col-1">
	    <!-- right -->
	    </div>
	  </div>
	</div>

	  <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container" id="add">
        </div>
    </section>
    <!-- Page Add Section End -->
	
	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->
	
	
	
</body>
</html>