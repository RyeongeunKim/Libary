<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ page import="Pack.RentalDTO"%>
<%@ page import="Pack.BookDTO"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${path}/resources/bootstrap/css/booklist3.css" rel="stylesheet">

</head>
<body>




	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->

	
   <!-- Page Add Section Begin -->
    <section class="page-ad ㅡd">
        <div class="container" id="add">
        </div>
    </section>
    <!-- Page Add Section End -->
	
	
	
	
	<%
	List rentalList = (List) request.getAttribute("reantalList");
	List bookList = (List) request.getAttribute("bookList");
	%>
	
	
	
	
	
	
		<div class="container">
	  <div class="row">
	    <div class="col-1">
	    <!-- left -->
	    </div>
	    
	    <div class="col-10">
		<!-- 본문 -->
		

		
		
		<div class="userlist1111">

			<h1 class="list12">회원 책 목록</h1><br>

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


								<li class="nav-item"><a class="nav-link" href="main">메인페이지로 가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<li class="nav-item"><a class="nav-link" href="booklist">도서 리스트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<li class="nav-item"><a class="nav-link" href="userList">회원정보 목록 </a>

							</ul>
						</div>
					</div>
				</nav>


		
		

	<form action="D" method="post">
		<div class="table-responsive">
		<table class="table">
			<tr>
				<th>책 일련번호</th>
				<th>대출 날짜</th>
				<th>반납 예정일</th>
				<th>대출자</th>
			</tr>

        <c:forEach var="i" items="${ rentalList }" varStatus="deo">
            <tr>
                <td>${bookList[deo.index].bookName}</td>
                <td>${i.rentalDate}</td>
                <td>${i.returnDate}</td>
                <td>${i.rentalUserID}</td>
                <td>${i.rentalBookID}</td>
                <form action="D" method="post">
                <td>
                <input type="hidden" name="rentalUserID"
                    value="<%=userID%>"><input type="hidden" name="userID"
                    value="<%=userID%>"> <input type="hidden"
                    name="rentalBookID" value="${i.rentalBookID}"> 
                <input type="submit">
                </td>
                </form>

            </tr>
			</c:forEach>
		</table>

		</form>
	</div>

		
		

		
		
		
		
		
		
		
		
		
		
		
	    </div>
	    
	    <div class="col-1">
	    <!-- right -->
	    </div>
	  </div>
	</div>
	
	

		
			
	  <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container" id="add">
        </div>
    </section>
    <!-- Page Add Section End -->
	
	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->
		
		
		
		
</body>
</html>