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
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->

	<%
	List bookList = (List) request.getAttribute("bookList");
	List rentalList = (List) request.getAttribute("rentalList");
	List reserveList = (List) request.getAttribute("reserveList");
	%>


	<!-- Page Add Section Begin -->
	<section class="page-add">
		<div class="container" id="add"></div>
	</section>
	<!-- Page Add Section End -->

	<div class="container">
		<div class="row">
			<div class="col-1">
				<!-- left -->
			</div>

			<div class="col-10">
				<table class="table table-bordered">
					<th colspan="3">상세보기</th>
					<c:forEach var="i" items="${ bookList }" varStatus="deo" end="0">
						<tr>
							<td width="9%"><img src="${i.bookImage}" alt="Image"
								width="120px" height="160px"></td>
							<td width="20%"><b>제목</b><br> <b>저자</b><br> <b>반납예정일</b><br>
								<b>대출상태</b><br> <b>예약상태</b><br> <c:choose>
									<c:when test="${fn:length(reserveList) == 0}">
										<b>예약</b>
									</c:when>
								</c:choose></td>
							<td id="detail">${i.bookName}<br> ${i.bookWriter}<br>
								${rentalList[deo.index].returnDate}<br> <c:choose>
									<c:when test="${i.bookRentalKey == 1}">
										<b id="p">대출가능(비치중)</b>
										<br>
									</c:when>
									<c:otherwise>
										<b id="i">대출불가(관외대출중 : ${rentalList[deo.index].returnDate}
											반납예정)</b>
										<br>
										<c:choose>
											<c:when test="${reserveList[deo.index].reserveKey != 1}">
							예약가능<br>
											</c:when>
											<c:otherwise>
							예약불가(예약이 되어있는 책입니다.)<br>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${reserveList[deo.index].reserveKey != 1}">
												<input type="button" class="btn btn-outline-primary me-2"
													value="예약"
													onclick="openReservation('${i.bookName}','${i.bookID }')" />
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
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

	<script type="text/javascript">
		 function openReservation(bookName, bookID) {
			const userID = '<%=(String) session.getAttribute("userID")%>
		'
			if (userID == 'null') {
				alert('로그인을 해주세요.')
			} else {
				window.open("reReserve?bookName=" + bookName + "&bookID="
						+ bookID, "", "width=582,height=360");
			}
		}
	</script>

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