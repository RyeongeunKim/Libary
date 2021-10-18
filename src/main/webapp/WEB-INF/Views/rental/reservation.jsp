
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


	<%
	String uID = (String) session.getAttribute("userID");
	%>

	<h1>예약 페이지</h1>

	<!-- action="reserveData" -->
	<form action="reserveData" method="post" >
		아이디:
		<%=uID%>
		</p>

		예약가능 날짜: <input id="rtDate" name="rtDate" value="${rtDate}"
			style="width: 215px; height: 45px; font-size: 15px;">
		</p>

		예약할 책 이름: <input type="bn" id="bn" name="bn" value="${bn}">
		</p>

		예약일자 선택 : <input type="date" id="endDate" name="returnDate"> <input
			type="hidden" name="bIdNum" value="${bIdNum}" />

		<!--<input type="button" value="예약하기" onclick="mySubmit()" /> -->

		<input type="submit" value="예약하기" />

	</form>
	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->


	<script type="text/javascript">
		
 		document.querySelector('#endDate').value = new Date().toISOString()
				.substring(0, 10);
		document.querySelector('#endDate').min = new Date().toISOString()
				.substring(0, 10);
		let date = new Date();
		date.setDate(${rtDate} + 14);
		console.log(date);
		document.querySelector('#endDate').max = date.toISOString().substring(
				0, 10);  
		
		function mySubmit(){
			const formooo = document.querySelector('#ooo');
			formooo.submit(); 
		}
		
	
			 
	</script>

</body>
</html>