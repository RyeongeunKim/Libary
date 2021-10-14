<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@ page import="Pack.RentalDTO" %>
<%@ page import="Pack.BookDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출이력</title>

<style>
.left {
	float: left;
	width: 10%;
}

.right {
	float: right;
	width: 90%;
}

.bottom {
	width: 100%;
	height: 150px;
	float: left;
}
</style>


</head>

<body>
	<div>

		<div>
			<!-- Header Section Begin -->
			<%@ include file="../include/header.jsp"%>
			<!-- Header Section End -->
		</div>


<%
	List rentalList = (List)request.getAttribute("reantalList");
	List bookList = (List)request.getAttribute("bookList");
%>

		<div>
			<div>
				<div>
					<h1>대출중도서</h1>
					<hr>
					<h3>지난 대출도서를 확인하세요.</h3>
					<hr>
				</div>
				<div class="left">
					<form action="" method="post">
						<input type="submit" value="대출중도서"
							onclick="javascript: form.action='myLibrary'"> <input
							type="submit" value="대출이력"
							onclick="javascript: form.action='rentalHistory'">
					</form>
				</div>

				<div class="right">
					<ul>
						<c:forEach var="i" items="${ bookList }" varStatus="deo">

							<li>
							책 이름 : ${i.bookName} 
							저자 : ${i.bookWriter} 
							출판사 : ${i.bookPublisher} 
							카테고리 : ${i.bookCategory} 
							청구기호 : ${rentalList[deo.index].rentalID}
							</li>

						</c:forEach>
					</ul>
				</div>
			</div>



			<div class="bottom">
				<!-- Footer Section Begin -->
				<%@ include file="../include/footer.jsp"%>
				<!-- Footer Section End -->
			</div>

		</div>
</body>
</html>