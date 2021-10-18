<%@page import="java.util.List"%>
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

	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->

	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="container" id="add">
			<div class="row">
				<div class="col-lg-4">
					<div class="page-breadcrumb">
						<h2>
							<img src="${path}/resources/img/search2.png" alt=""
								style="width: 50px; height: 50px"></a>검색결과<span>.</span>
						</h2>
					</div>
				</div>
				<div class="col-lg-8"></div>
			</div>
		</div>
	</section>
	<!-- Page Add Section End -->

	<%
	List bookList = (List) request.getAttribute("bookList");
	%>

	<div class="container">
		<div class="row">
			<div class="col-1">
				<!-- left -->
			</div>

			<div class="col-10">
				<c:choose>
					<c:when test="${fn:length(bookList) == 0}">
						<p>
							<img src="${path}/resources/img/sign.png" alt="result">
						</p>
						<br>
						<p id="coment">검색 결과가 없습니다.</p>
			</c:when>
					<c:otherwise>
						<table class="table table-bordered">
							<tr>
								<th width=8%>청구기호</th>
								<th>저자</th>
								<th>도서명</th>
								<th>분류</th>
								<th>출판사</th>
							</tr>
							<c:forEach var="i" items="${ bookList }" varStatus="deo">
								<tr>
									<td>${i.bookID}</td>
									<td>${i.bookWriter}</td>
									<td><a id="bookName" href="bookDetail?bookID=${i.bookID}">${i.bookName}</a></td>
									<td>${i.bookCategory}</td>
									<td>${i.bookPublisher}</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
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
</body>
</html>