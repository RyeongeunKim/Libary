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
	String bookID = request.getParameter("bookID");
	%>
	<%String userID1 = request.getParameter("userID1");%>
	<%= userID1%>
	



	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->

	<!-- Page Add Section Begin -->
	<section class="page-ad ㅡd">
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->





	<div class="container">
		<div class="row">
			<div class="col-1">
				<!-- left -->
			</div>

			<div class="col-10">
				<!-- 본문 -->


				<form action='C'>
					<div>
						<ul>
							<c:forEach var="i" items="${ bookList }">
								<li>이름 : <%=userID1%></li>
								<li>책 이름 : ${i.bookName}</li>
								<li>저자 : ${i.bookWriter}</li>
								<li>카테고리 : ${i.bookCategory}</li>
								<li>출판사 : ${i.bookPublisher}</li>
							</c:forEach>
						</ul>
					</div>
					<input type="hidden" name="rentalUserID" value=<%=userID%> /> <input
						type="hidden" name="rentalBookID" value=<%=bookID%> /> <input
						type='hidden' name='rentalKey' value='1' /> <input type='hidden'
						name='bookRentalKey' value='0' /> <input type='hidden'
						name='bookID' value=<%=bookID%> /> <label for="startDate">시작일
						: </label> <input type="date" id="startDate" name="rentalDate"> <label
						for="endDate">종료일 : </label> <input type="date" id="endDate"
						name="returnDate"> <input type='submit'>
				</form>



			</div>

			<div class="col-1">
				<!-- right -->
			</div>
		</div>
	</div>





	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->

	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->








	<script type="text/javascript">
		document.querySelector('#startDate').value = new Date().toISOString()
				.substring(0, 10);
		document.querySelector('#startDate').min = new Date().toISOString()
				.substring(0, 10);
		document.querySelector('#startDate').max = new Date().toISOString()
				.substring(0, 10);
		document.querySelector('#endDate').value = new Date().toISOString()
				.substring(0, 10);
		document.querySelector('#endDate').min = new Date().toISOString()
				.substring(0, 10);
		let date = new Date();
		date.setDate(date.getDate() + 14);
		console.log(date);
		document.querySelector('#endDate').max = date.toISOString().substring(
				0, 10);
	</script>
</body>
</html>