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
<title>대출중도서</title>

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

	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->


	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->

	<%
	List rentalList = (List) request.getAttribute("rentalList");
	List bookList = (List) request.getAttribute("bookList");
	%>





	<div class="container">
		<div class="row">
			<div class="col-1">
				<!-- left -->
			</div>

			<div class="col-10">
				<!-- 본문 -->

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

								<li class="nav-item"><a class="nav-link" href="myLibrary">대출도서</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="rentalHistory">대출이력</a></li>
								<li class="nav-item"><a class="nav-link"
									onclick="openRepassword()">정보수정</a></li>
								<li class="nav-item"><a class="nav-link"
									onclick="secession()">회원탈퇴</a></li>
								<li class="nav-item"><a class="nav-link"
									onclick="resListPage()">예약목록확인</a></li>
							</ul>
						</div>
					</div>
				</nav>

				<!-- Page Add Section Begin -->
				<section class="page-add">
					<div class="container" id="add1"></div>
				</section>
				<!-- Page Add Section End -->

				<table class="table table-bordered">
					<th colspan="3">상세보기</th>
					<c:forEach var="i" items="${ rentalList }" varStatus="deo">
						<tr>
							<td width="9%"><img src="${bookList[deo.index].bookImage}"
								alt="Image" width="120px" height="160px"></td>
							<td width="20%"><b>청구기호</b><br> <b>제목</b><br> <b>저자</b><br>
								<b>대출일</b><br> <b>반납예정일</b><br></td>
							<td id="detail">
								${i.rentalID}<br>
								${bookList[deo.index].bookName}<br>
								${bookList[deo.index].bookWriter}<br> 
								${i.rentalDate}<br>
								${i.returnDate}<br>
							</td>
						</tr>
					</c:forEach>
				</table>

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



	<script>
		function secession() {
			if (confirm("회원탈퇴 하시겠습니까?")) {
				location.href = "deleteUser";
			} else {
				location.href = "myLibrary"
			}
		}

		function openRepassword() {
			window.open("reEnter", "", "width=582,height=360");
		}

		function aaa(userPwd) {
			location.href = "reConfirm?userPwd=" + userPwd
		}
		
		function resListPage(){
			location.href = "reserveList";
		}
	</script>





</body>
</html>