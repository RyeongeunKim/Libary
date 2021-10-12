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
	
	<form action="#" method="post">
    도서검색 <input type="search" name="search">
    <input type="submit">
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