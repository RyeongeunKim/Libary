<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	

		<link href="${path}/resources/bootstrap/css/join.css" rel="stylesheet">
	
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



  <main>
    <div class="row g-5" id="totalt">
    
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3" id="signin">회원가입</h4>
        <form action="joinResult" method="post" id="form" name="form">
          <div class="row g-3" id="fontposition">


			<div class="col-12">
				<label for="username" class="form-label">아이디</label>
				<div class="input-group has-validation">
					<input type="text" class="form-control" id="userID" name="userID" placeholder="아이디를 입력해주세요" required>
				</div>
				<div>
					<span class="ckMsg_id"></span>
				</div>
			</div>

			<div class="col-12">
				<div>
             	 <label for="email" class="form-label">비밀번호</label>
              		<input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="비밀번호를 입력해주세요">
            	 </div>
            	 <div>
					<span class="ckMsg_pw"></span>
				</div>
            </div>

			<div>
           		<div class="col-12">
             	 <label for="address" class="form-label">비밀번호 확인</label>
              		<input type="password" class="form-control" name="pwConfirm" id="userPwd1" placeholder="비밀번호 확인" required>
           	 	</div>
            	<div>
					<span class="ckMsg_pw1"></span>
				</div>
            </div>

            <div>
            	<div class="col-12">
             	 <label for="address" class="form-label">이름</label>
              	<input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력해주세요" required>
           	 </div>
           	 <div>
				<span class="ckMsg_name"></span>
			</div>
            </div>

			<div>
            <div class="col-12">
              <label for="address" class="form-label">나이</label>
              <input type="text" class="form-control" name="userAge" id="userAge" placeholder="나이를 입력해주세요" required>
            </div>
            <div>
				<span class="ckMsg_age"></span>
			</div>
            </div>
            
            <div>
            <div class="col-12">
              <label for="address" class="form-label">전화번호</label>
              <input type="text" class="form-control" name="userPhone" id="userPhone"  placeholder="'-' 제외" required>
            </div>
            <div>
				<span class="ckMsg_phone"></span>
			</div>
            </div>
            
            <div>
            <div class="col-12">
   				<label for="address" class="form-label" id="address">주소</label>
            	<input type=button id="adresssearch" class="btn btn-primary" onclick="goPopup();" value="주소검색">
	
                <input type="text" class="form-control" name="userAddress" id="userAddress" placeholder="주소를 입력해주세요" required readonly>

            </div>
            <div>
				<span class="ckMsg_address"></span>
          	<button class="w-100 btn btn-primary btn-lg" id="buttonsign" type="submit">회원가입</button>
			</div>
            </div>

          	</div>
          </div>

          
          
          
        </form>
      </div>
    </div>
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 유효성 체크 시작 -->
	<script type="text/javascript">
	$(document).ready(function() {
		
		var ck1=false;			//userID
		var ck2=false;			//userPwd
		var ck3=false;			//userPwd1
		var ck4=false;			//userName
		var ck5=false;			//userPhone
		var ck6=false;			//userAge
		
			$("#form").submit(function(){
				
				 if($.trim($("#userID").val()) == ""){
					 $('.ckMsg_id').text("아이디를 입력하세요");     
		             $('.ckMsg_id').css("color","red"); 
		             $('.ckMsg_id').css("padding-left","1rem"); 
		             $("#userId").focus();
		             return false;
				 }
				 if($.trim($("#userPwd").val()) == ""){
					 $('.ckMsg_pw').text("비밀번호를 입력하세요");     
		             $('.ckMsg_pw').css("color","red"); 
		             $('.ckMsg_pw').css("padding-left","1rem"); 
		             $("#pw").focus();
		             return false;
				 }
				 if($.trim($("#userPwd1").val()) == ""){
					 $('.ckMsg_pw1').text("비밀번호 확인을 입력하세요");     
		             $('.ckMsg_pw1').css("color","red"); 
		             $('.ckMsg_pw1').css("padding-left","1rem"); 
		             $("#pw1").focus();
		             return false;
				 }
				 if($.trim($("#userName").val()) == ""){
					 $('.ckMsg_name').text("이름을 입력하세요");     
		             $('.ckMsg_name').css("color","red"); 
		             $('.ckMsg_name').css("padding-left","1rem"); 
		             $("#name").focus();
		             return false;
				 }
				 if($.trim($("#userPhone").val()) == ""){
					 $('.ckMsg_ph').text("연락처를 입력하세요");     
		             $('.ckMsg_ph').css("color","red"); 
		             $('.ckMsg_ph').css("padding-left","1rem"); 
		             $("#phone").focus();
		             return false;
				 }
				 
				 if(ck1 == false || ck2 == false || ck3 == false || ck4 == false || ck5 == false || ck6 == false
						 ){
					 return false;
				 }
			}); //form 공백체크
	

			$("#userID").keyup(function() {
				var userID = $("#userID").val();
				var check = /^[A-Za-z\d_-]{4,15}$/;
				
				$.ajax({
						url : './idcheck',
						type : 'post',
						data : {"userID" : userID},
						success : function(data) {
							
						if (data > 0) {
							$('.ckMsg_id').text("이미 존재하는 아이디입니다");
							$('.ckMsg_id').css("color","red"); 
							ck1 = false;} 
						else {
							if (userID.match(check) != null) {
								$('.ckMsg_id').text("사용가능한 아이디입니다");
								$('.ckMsg_id').css("color","green");
								ck1 = true;}
							else {$('.ckMsg_id').text("아이디는 4~15자리만 가능합니다");
								  $('.ckMsg_id').css("color","red"); 
								  ck1 = false;}
							}
						 },
						error : function() {alert("에러입니다");}
				});
			});//id 중복확인  

			$("#userPwd").keyup(function() {
				var userPwd = $("#userPwd").val();
				var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
						.test(userPwd);

				if (userPwd == null) {
					$('.ckMsg_pw').text(
							"비밀번호를 입력하세요");
					$('.ckMsg_pw').css("color",
							"red");
					$('.ckMsg_pw').css(
							"padding-left",
							"5px");
					ck2 = false;

				} else if (check) {
					$('.ckMsg_pw').text(
							"사용 가능한 비밀번호입니다");
					$('.ckMsg_pw').css("color",
							"green");
					$('.ckMsg_pw').css(
							"padding-left",
							"5px");
					ck2 = true;
				} else {
					$('.ckMsg_pw')
							.text("대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요");
					$('.ckMsg_pw').css("color",
							"red");
					$('.ckMsg_pw').css(
							"padding-left",
							"5px");
					ck2 = false;
				}

			});//pw

			$("#userPwd1").keyup(function() {

				if ($("#userPwd").val() != $("#userPwd1")
						.val()) {
					$('.ckMsg_pw1').text(
							"비밀번호가 일치하지 않습니다");
					$('.ckMsg_pw1').css(
							"color", "red");
					$('.ckMsg_pw1').css(
							"padding-left",
							"5px");
					ck3 = false;
				} else {
					$('.ckMsg_pw1').text(
							"비밀번호가 일치합니다");
					$('.ckMsg_pw1').css(
							"color", "green");
					$('.ckMsg_pw1').css(
							"padding-left",
							"5px");
					ck3 = true;
				}

			});//pw1 (pw확인)

			$("#userName").keyup(function() {

				var userName = $("#userName").val();
				var check = /^[A-Z|a-z|가-힣]{2,5}$/;
				
				if (userName.match(check) != null) {
					$('.ckMsg_name').text("");
					ck4 = true;
				} else {
					$('.ckMsg_name').text(
							"이름을 정확히 입력하세요");
					$('.ckMsg_name')
							.css("color", "red");
					$('.ckMsg_name').css(
							"padding-left", "5px");
					ck4 = false;
				}

			});//name

			$("#userPhone").keyup(function() {

					var phone = $("#userPhone").val();
					var check1 = /^010([0-9]{8})$/;
					var check2 = /^01([1|6|7|8|9])([0-9]{3})([0-9]{4})$/;
					if (phone.match(check1) != null
							|| phone.match(check2) != null) {
						$('.ckMsg_phone').text("");
						ck5 = true;
					} else {
						$('.ckMsg_phone').text(
								"연락처를 확인해주세요");
						$('.ckMsg_phone').css(
								"color", "red");
						$('.ckMsg_phone').css(
								"padding-left",
								"5px");
						ck5 = false;
					}

			});//phone
				
			$("#userAge").keyup(function() {

					var userAge = $("#userAge").val();
					var check = /^[0-9]{1,2}$/;
					if (userAge.match(check) != null) {
						$('.ckMsg_age').text("");
						ck6 = true;
					} else {
						$('.ckMsg_age').text(
								"나이를 확인해주세요");
						$('.ckMsg_age').css(
								"color", "red");
						$('.ckMsg_age').css(
								"padding-left",
								"5px");
						ck6 = false;
					}

			});//address3		
	
				
				
	});//form
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출
		var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	
	function jusoCallBack(roadFullAddr){
			var addressEI = document.querySelector("#userAddress");
			addressEI.value = roadFullAddr;
	}
	</script>
	<!-- 유효성 체크 끝 -->
</body>
</html>