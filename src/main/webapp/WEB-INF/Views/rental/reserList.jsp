<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Pack.BookDTO" %>
<%@ page import="Pack.ReserveDTO" %>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>예약목록 페이지 </h1>
 
 <%
	List bookList = (List)request.getAttribute("bookList"); // 책이름, 저자 
	List reserveList = (List)request.getAttribute("reserveList"); // 에약일
 %>


 
 
 	<table class="table table-bordered" border="1">
		<th colspan="3">상세보기</th>
		<c:forEach var="i" items="${ bookList }" varStatus="deo">
				<tr>
					<td width="9%"><img src="${i.bookImage}" alt="Image" width="120px" height="160px"></td>
					<td width="20%">
						<b>제목</b><br>
						<b>저자</b><br>
						<b>예약일</b><br>	
						<!-- <b>반납예정일</b><br> -->
					</td>
					<td><%-- ${i.rentalID}<br> --%>					
					${i.bookName}<br>
					${i.bookWriter}<br>		
					${reserveList[deo.index].reserveDate}<br>	
					<input type ="button" value="예약취소" onclick="vvv('${i.bookID}')">
					</td>
				</tr>
		</c:forEach>
		</table>
	
	<script type="text/javascript">
		function vvv(bookID){
			location.href="resCancel?bookID="+bookID;
		}
	
	</script>
</body>
</html>