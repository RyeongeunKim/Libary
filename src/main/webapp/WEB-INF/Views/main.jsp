<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	<!-- Header Section Begin -->
	<%@ include file="include/header.jsp" %>
	<!-- Header Section End -->
	
	<!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 200px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
    
 	<form mathod="post" action="search">
		<div>
 			<select name="bookInfo">
				<option value="bookName">서명</option>
				<option value="bookWriter">저자</option>
				<option value="bookPublisher">출판사</option>
			</select> 
			<input type="text" name="keyword">			
			<input type="submit" value="검색">
		</div>    	
    </form>
    
	<!-- Page Add Section Begin -->
    <section class="page-add" style="margin-bottom: 200px;">
        <div class="container">
        </div>
    </section>
    <!-- Page Add Section End -->
	
	<!-- Footer Section Begin -->
	<%@ include file="include/footer.jsp" %>
	<!-- Footer Section End -->
	
</body>
</html>