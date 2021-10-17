<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
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
	String userID = request.getParameter("userID");
	%>
	<form action="D" method="post">
		<table border="1">
			<tr>
				<th>책 일련번호</th>
				<th>대출 날짜</th>
				<th>반납 예정일</th>
				<th>대출자</th>
			</tr>
			<c:forEach var="i" items="${ rentalList }">
				<tr>
					<%-- <td><c:forEach var="j" items="${ bookList }">
							<c:if test="${j.bookID == i.rentalBookID}">
								${j.bookName}
							</c:if>
						</c:forEach></td> --%>
					<td>${i.rentalDate}</td>
					<td>${i.returnDate}</td>
					<td>${i.rentalUserID}</td>
					<td><input type="hidden" name="rentalBookID"
						value="${i.rentalBookID}"><input type="submit"></td>
				</tr>

			</c:forEach>
		</table>
	</form>


</body>
</html>