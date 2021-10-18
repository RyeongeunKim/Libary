<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="1">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>제목</th>
			<th>저자</th>
			<th>카테고리</th>
			<th>출판사</th>
		</tr>
		<c:forEach var="i" items="${ bookList }">
			<tr>
				<td>${i.bookID}</td>
				<td><img src="${i.bookImage}" alt="Image" width="120px"
					height="120px"></td>
				<td>${i.bookName}</td>
				<td>${i.bookWriter}</td>
				<td>${i.bookCategory}</td>
				<td>${i.bookPublisher}</td>
				<c:choose>
					<c:when test="${i.bookRentalKey != 0}">
						<td>대여가능</td>
						<td><a
							href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a><br />
							<a href="B?bookID=${i.bookID}">수정</a><br /> <a
							href="rental?bookID=${i.bookID}">대여</a></td>
					</c:when>
					<c:otherwise>
						<td>대여불가능</td>
						<td><a
							href="bookDelete?bookID=${i.bookID}&keyword=${keyword}&bookvalue=0">삭제</a><br />
							<a href="B?bookID=${i.bookID}">수정</a><br /></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>


	<table border="1">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
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
	</table>

	<h1>11</h1>
</body>
</html>