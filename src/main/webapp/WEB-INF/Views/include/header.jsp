<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">

    <!-- Bootstrap core CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="${path}/resources/bootstrap/css/headers.css" rel="stylesheet"/> 	
  </head>
  
  <body>
  
  	<%
		String userID = (String)session.getAttribute("userID");
	%>


	<nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="main" class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">About</a></li>
      </ul>
     	<%
			if(session.getAttribute("userID") == null){
		%>
		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-primary me-2"
			onclick="location.href='login'">로그인</button>
			<button type="button" class="btn btn-primary"
			onclick="location.href='join'">회원가입</button>
		</div>
		<%} else if (userID != null && userID.equals("admin")) {%>
		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-primary me-2"
			onclick="location.href='userList'">회원목록</button>
			<button type="button" class="btn btn-primary"
			onclick="location.href='./logout' ">로그아웃</button>
		</div>
		<% } else if (session.getAttribute("userID") != null) {%>

		<div class="col-md-3 text-end">
			<button type="button" class="btn btn-outline-primary me-2"
			onclick="location.href='myLibrary'">내서재</button>
			<button type="button" class="btn btn-primary"
			onclick="location.href='./logout'">로그아웃</button>
		</div>
		<%} %>
    </div>
  </nav>
  <header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
    <a href="main"><img src="${path}/resources/img/logo2.png" alt="" style=" width:50px; height:50px "></a>
      <a href="main" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="15" height="32"><use xlink:href="#bootstrap"/></svg>
        <span class="fs-4" id="title">부산광역시립해운대도서관</span>
      </a>
    </div>
  </header>


	
  </body>
</html>
