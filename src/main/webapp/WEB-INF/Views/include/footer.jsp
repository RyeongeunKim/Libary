<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
    <!-- Bootstrap core CSS -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/footers/">
	<!-- Custom styles for this template -->
    <link href="${path}/resources/bootstrap/css/footers.css" rel="stylesheet">
	
	<body>

	<div class="container" id="footer">
	  <footer class="py-3 my-4">
	    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
	    </ul>
	    <p class="text-center text-muted">&copy; 
	    (46949) 부산광역시 사상구 사상로310번길 33(덕포동) 전화 051-310-5400 Copyright  <br>
	    © Busan Metropolitan Library, All rights reserved.</p>
	  </footer>
	</div>

	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 --> 
	<script src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>
