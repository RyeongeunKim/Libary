<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" items="${ rentalList }">
		<c:if test="${i.rentalID != null}">
			<tr>
				<td>${i.rentalID}</td>
				<td>${i.rentalBookID}</td>
				<td>${i.rentalDate}</td>
				<td>${i.returnDate}</td>
				<td>${i.rentalUserID}</td>
				<td>${i.rentalKey}</td>
			</tr>
		</c:if>
	</c:forEach>

	<h1>11</h1>
</body>
</html>