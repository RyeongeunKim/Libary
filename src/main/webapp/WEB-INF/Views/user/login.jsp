<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>


<head>
	<title>로그인</title>

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
	
	<link href="${path}/resources/bootstrap/css/login.css" rel="stylesheet">
	   
	   
	   
	   
	   
</head>






<body>
	
	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->
	
   <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container" id="add">
        </div>
    </section>
    <!-- Page Add Section End -->






	<div class="container">
	  <div class="row">
	    <div class="col-1">
	    <!-- left -->
	    </div>
	    
	    
	    
	    
	    
	    <div class="col-10">
		<!-- 본문 -->


				<main class="form-signin">
					<form action="" method="post">
						<h1 class="h3 mb-3 fw-normal" >로그인</h1>

						<div class="form-floating">
							<input type="text" name="userID" class="form-control" id="floatingInput" placeholder="ID"> 
							<label for="floatingInput">ID</label>
						</div>
						
						<div class="form-floating">
							<input type="password" name="userPwd" class="form-control" id="floatingPassword" placeholder="Password"> 
							<label for="floatingPassword">Password</label>
						</div>
						
						<div class="sign-in" > 
						<div class="sign">
						<img class="people" src="https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-6.png">
						<input  class="boot" type="submit" value="회원가입" onclick="javascript: form.action='join'" required="required">
						</div>
						</div>
						
						<input class="w-100 btn btn-lg btn-primary" type="submit" value="로그인" onclick="javascript: form.action='loginGo'" required="required">

					</form>
				</main>





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