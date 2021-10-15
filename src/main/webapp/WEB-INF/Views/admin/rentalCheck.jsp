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
	<%
	String userID = request.getParameter("userID");
	%>
	<%
	String bookID = request.getParameter("bookID");
	%>
	<form action='C'>
		<div>
			<ul>
				<c:forEach var="i" items="${ bookList }">
					<li>이름 : <%=userID%></li>
					<li>책 이름 : ${i.bookName}</li>
					<li>저자 : ${i.bookWriter}</li>
					<li>카테고리 : ${i.bookCategory}</li>
					<li>출판사 : ${i.bookPublisher}</li>
				</c:forEach>
			</ul>
		</div>
		<input type="hidden" name="rentalUserID" value=<%=userID%> />
		<input type="hidden" name="rentalBookID" value=<%=bookID%> />
		<input type='hidden' name='rentalKey' value='0' />
		<label for="startDate">시작일 : </label>
		<input type="date" id = "startDate" name= "rentalDate"> 
		<label for="endDate">종료일 : </label>
		<input type="date" id = "endDate" name= "returnDate"> 
		<input type='submit'>
	</form>
	<script type="text/javascript">
	document.querySelector('#startDate').value = new Date().toISOString().substring(0, 10);
	document.querySelector('#startDate').min = new Date().toISOString().substring(0, 10);
	document.querySelector('#startDate').max = new Date().toISOString().substring(0, 10);
	document.querySelector('#endDate').value = new Date().toISOString().substring(0, 10);
	document.querySelector('#endDate').min = new Date().toISOString().substring(0, 10);
	let date = new Date();
	date.setDate(date.getDate() + 14);
	console.log(date);
	document.querySelector('#endDate').max = date.toISOString().substring(0, 10);
	</script>
</body>
</html>