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
		List rentalList = (List)request.getAttribute("rentalList");
		List reserveList = (List)request.getAttribute("reserveList");
	%>
	
	<h1>책상세보기</h1>

	<table border="1">
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>저자</th>
			<th>반납예정일</th>	
			<th>대출상태</th>	
			<th>예약상태</th>
			<c:choose>
				<c:when test="${rtDate == true}">
				</c:when>
				<c:otherwise>
				<th>예약</th>	
				</c:otherwise>
			</c:choose>

		</tr>
		<c:forEach var="i" items="${ bookList }" varStatus="deo" end="0">	
				<tr>
					<td><img src="${i.bookImage}" alt="Image" width="120px" height="120px"></td>
					<td>${i.bookName}</td>					
					<td>${i.bookWriter}</td>
					<td>${rentalList[deo.index].returnDate}</td>					
					<c:choose>
						<c:when test="${rentalList[deo.index].rentalKey == 1}">
						<td>대출가능(비치중)</td>	
						</c:when>
						<c:otherwise>
						<td>대출불가</td>	
						</c:otherwise>
					</c:choose>	
					<c:choose>
						<c:when test="${fn:length(reserveList) == 0}">
						<td>예약가능</td>	
						</c:when>	
						<c:otherwise>
						<td>예약불가</td>	
						</c:otherwise>										
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(reserveList) == 0}">
						<td>
						<input type = "button" class="btn btn-outline-primary me-2"  value="예약"
						onclick="openReservation('${i.bookName}','${i.bookID }')"/>						
						</td>	
						</c:when>	
						<c:otherwise>
						<td>예약불가</td>	
						</c:otherwise>										
					</c:choose>
				</tr>
		</c:forEach>	
		
	<script type="text/javascript">
		 function openReservation(bookName, bookID) {
			const userID = '<%=(String)session.getAttribute("userID")%>'
			if(userID == 'null')
				{ alert('로그인을 해주세요.') }
			else{
				window.open("reReserve?bookName="+ bookName+"&bookID="+ bookID,"", "width=582,height=360");
			}
		}
	</script>

</body>
</html>