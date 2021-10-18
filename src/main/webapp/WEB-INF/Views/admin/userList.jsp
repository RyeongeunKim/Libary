<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 목록</title>


<link href="${path}/resources/bootstrap/css/userList.css"
	rel="stylesheet">


</head>
<body>

	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->

	<!-- Page Add Section Begin -->
	<section class="page-ad ㅡd">
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->



	<div>


		<div class="container">
			<div class="row">
				<div class="col-1">
					<!-- left -->
				</div>





				<div class="col-10">
					<!-- 본문 -->




					<div>
						<h1 class="list12">회원정보 목록</h1>
						<br>
					</div>


					<!-- 네비게이션 바 -->
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="container-fluid">
							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse" data-bs-target="#navbarNav"
								aria-controls="navbarNav" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarNav">
								<ul class="navbar-nav">

									<li class="nav-item"><a class="nav-link" href="main">메인페이지로
											가기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
									<li class="nav-item"><a class="nav-link" href="booklist">도서
											리스트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
									<li class="nav-item"><a class="nav-link" href="userList">회원정보
											목록 </a>
								</ul>
							</div>
						</div>
					</nav>


					<div class="table-responsive">

						<table class="table">

							<tr>
								<th>아이디</th>
								<th>패스워드</th>
								<th>이름</th>
								<th>나이</th>
								<th>전화번호</th>
								<th>주소</th>
							</tr>
							<c:forEach var="i" items="${ userList }">
								<c:if test="${i.userID != null}">
									<tr>
										<td>${i.userID}</td>
										<td>${i.userPwd}</td>
										<td>${i.userName}</td>
										<td>${i.userAge}</td>
										<td>${i.userPhone}</td>
										<td>${i.userAddress}</td>

										<td><a href="userPrivacy?userID=${i.userID}">수정</a><br />
											<a href="userInfoDelete?userID=${i.userID}">삭제</a><br />
										<a href="return?userID2=${i.userID}">대출기록</a><br /></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>



				</div>





				<div class="col-1">
					<!-- right -->
				</div>
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