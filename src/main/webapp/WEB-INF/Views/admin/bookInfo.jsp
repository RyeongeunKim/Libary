<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 추가</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@900&display=swap" rel="stylesheet">



    <!-- Bootstrap core CSS -->
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

<link href="${path}/resources/bootstrap/css/bookinfo.css" rel="stylesheet">




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
    






	<div class="container">
	  <div class="row">
	    <div class="col-3">
	    <!-- left -->
	    </div>
	    
	    <div class="col-6">
		<!-- 본문 -->
		
			<h1>책 추가하기</h1><br/>
			
			<main class="form-signin">
					<form action="" method="post">
						<div class="form-floating">
							<input type="text" name="bookName" class="form-control" id="floatingInput" placeholder="ID" value=""> 
							<label for="floatingInput">제목을 입력하세요</label>
						</div>
						
						<div class="form-floating">
							<input type="text" name="bookWriter" class="form-control" id="floatingPassword" placeholder="저자" value=""> 
							<label for="floatingPassword">저자를 입력하세요</label>
						</div>
						
						<div class="form-floating">
							<input type="text" name="bookCategory" class="form-control" id="floatingPassword" placeholder="카테고리" value=""> 
							<label for="floatingPassword">카테고리를 입력하세요</label>
						</div>
						
						<div class="form-floating">
							<input type="text" name="bookPublisher" class="form-control" id="floatingPassword" placeholder="출판사" value=""> 
							<label for="floatingPassword">출판사를 입력하세요</label>
						</div>

						
						<input class="w-100 btn btn-lg btn-primary" type="submit" value="확인" onclick="javascript: form.action='bookInsert'">

					</form>
				</main>
		
		
		
		
		
		
		
		
		
		
		
	    </div>
	    
	    <div class="col-3">
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