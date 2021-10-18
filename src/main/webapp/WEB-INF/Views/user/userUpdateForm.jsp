<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Pack.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- Header Section Begin -->
	<%@ include file="../include/header.jsp"%>
	<!-- Header Section End -->
	<h1>내 정보</h1>


	<form action="userUpdate" method="post" id="form" name="form">
		아이디 : ${userData.userID}
		<div>
			<div>
				비밀번호 <input type="password" id="userPwd" name="userPwd" value=""
					placeholder="비밀번호를 입력해주세요">
			</div>
			<div>
				<span class="ckMsg_pw"></span>
			</div>
		</div>
		<div>
			<div>
				비밀번호 확인 <input type="password" id="userPwd1" name="pwConfirm"
					value="" placeholder="비밀번호 확인">
			</div>
			<div>
				<span class="ckMsg_pw1"></span>
			</div>
		</div>
		<div>
			<div>
				이름 <input type="text" name="userName" id="userName"
					value="${userData.userName}" placeholder="이름을 입력해주세요">
			</div>
			<div>
				<span class="ckMsg_name"></span>
			</div>
		</div>
		<div>
			<div>
				나이 <input type="text" name="userAge" id="userAge"
					value="${userData.userAge }" placeholder="나이를 입력해주세요">
			</div>
			<div>
				<span class="ckMsg_age"></span>
			</div>
		</div>
		<div>
			<div>
				전화번호 <input type="text" name="userPhone" id="userPhone"
					value="${userData.userPhone }" placeholder="'-' 제외">
			</div>
			<div>
				<span class="ckMsg_phone"></span>
			</div>
		</div>
		<div>
			<div>
				주소 <input type="text" name="userAddress" id="userAddress" value=""
					placeholder="주소를 입력해주세요" required readonly>
				<button type=button class="btn btn-primary" onclick="goPopup();">주소검색</button>
			</div>
			<div>
				<span class="ckMsg_address"></span>
			</div>
		</div>
		<div>
			<input type="hidden" name=userID value="${userID}"> <input
				type="submit" value="수정하기">
		</div>
	</form>

	<!-- 유효성 체크 시작 -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var ch1 = false; //userID
							var ch2 = false; //userPwd
							var ch3 = false; //userPwd1
							var ch4 = false; //userName
							var ch5 = false; //userAge
							var ch6 = false; //userPhone
							var ch7 = false; //userAddress

							$("#form")
									.submit(
											function() {

												/* if($.trim($("#userID").val()) == ""){
													$('.ckMsg_id').text("아이디를 입력하세요");
												    $('.ckMsg_id').css("color","red"); 
													$("#userID").focus();
													return false;
												} */

												if ($.trim($("#userPwd").val()) == "") {
													$('.ckMsg_pw').text(
															"비밀번호를 입력하세요");
													$('.ckMsg_pw').css("color",
															"red");
													$("#userPwd").focus();
													return false;
												}

												if ($
														.trim($("#userPwd1")
																.val()) == "") {
													$('.ckMsg_pw1').text(
															"비밀번호 확인을 입력하세요");
													$('.ckMsg_pw1').css(
															"color", "red");
													$("#userPwd1").focus();
													return false;
												}

												if ($
														.trim($("#userName")
																.val()) == "") {
													$('.ckMsg_name').text(
															"이름을 입력하세요");
													$('.ckMsg_name').css(
															"color", "red");
													$("#userName").focus();
													return false;
												}

												if ($.trim($("#userAge").val()) == "") {
													$('.ckMsg_age').text(
															"나이를 입력하세요");
													$('.ckMsg_age').css(
															"color", "red");
													$("#userAge").focus();
													return false;
												}

												if ($.trim($("#userPhone")
														.val()) == "") {
													$('.ckMsg_phone').text(
															"전화번호를 입력하세요");
													$('.ckMsg_phone').css(
															"color", "red");
													$("#userPhone").focus();
													return false;
												}

												// 			if($.trim($("#userAddress").val()) == ""){
												// 				$('.ckMsg_address').text("주소를 입력하세요");
												// 				$('.ckMsg_phone').css("color","red"); 
												// 				$("#userAddress").focus();
												// 				return false;
												// 			}				

												if (ck1 == false
														|| ck2 == false
														|| ck3 == false
														|| ck4 == false
														|| ck5 == false
														|| ck6 == false) {
													return false;
												}
											}); // form 공백체크

							$("#userID")
									.keyup(
											function() {
												var userID = $("#userID").val();
												var check = /^[A-Za-z\d_-]{4,15}$/;

												$
														.ajax({
															url : './idcheck',
															type : 'post',
															data : {
																"userID" : userID
															},
															success : function(
																	data) {

																if (data > 0) {
																	$(
																			'.ckMsg_id')
																			.text(
																					"이미 존재하는 아이디입니다");
																	$(
																			'.ckMsg_id')
																			.css(
																					"color",
																					"red");
																	ck1 = false;
																} else {
																	if (userID
																			.match(check) != null) {
																		$(
																				'.ckMsg_id')
																				.text(
																						"사용가능한 아이디입니다");
																		$(
																				'.ckMsg_id')
																				.css(
																						"color",
																						"green");
																		ck1 = true;
																	} else {
																		$(
																				'.ckMsg_id')
																				.text(
																						"아이디는 4~15자리만 가능합니다");
																		$(
																				'.ckMsg_id')
																				.css(
																						"color",
																						"red");
																		ck1 = false;
																	}
																}
															},
															error : function() {
																alert("에러입니다");
															}
														});
											});//id 중복확인 

							$("#userPwd")
									.keyup(
											function() {
												var userPwd = $("#userPwd")
														.val();
												var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/
														.test(userPwd);

												if (userPwd == null) {
													$('.ckMsg_pw').text(
															"비밀번호를 입력하세요");
													$('.ckMsg_pw').css("color",
															"red");
													ck2 = false;
												} else if (check) {
													$('.ckMsg_pw').text(
															"사용 가능한 비밀번호입니다");
													$('.ckMsg_pw').css("color",
															"green");
													ch2 = true;
												} else {
													$('.ckMsg_pw')
															.text(
																	"대소문자,숫자,특수문자(@$!%*#?&) 세가지를 조합한 8~16자리를 입력하세요");
													$('.ckMsg_pw').css("color",
															"red");
													ck2 = false;
												}
											}); //pw

							$("#userPwd1")
									.keyup(
											function() {

												if ($("#userPwd").val() != $(
														"#userPwd1").val()) {
													$('.ckMsg_pw1').text(
															"비밀번호가 일치하지 않습니다");
													$('.ckMsg_pw1').css(
															"color", "red");
													ck3 = false;
												} else {
													$('.ckMsg_pw1').text(
															"비밀번호가 일치합니다");
													$('.ckMsg_pw1').css(
															"color", "green");
													ck3 = true;
												}
											}); //pw1 (pw확인)

							$("#userName").keyup(function() {

								var userName = $("#userName").val();
								var check = /^[A-Z|a-z|가-힣]{2,5}$/;

								if (userName.match(check) != null) {
									$('.ckMsg_name').text("");
									ck4 = true;
								} else {
									$('.ckMsg_name').text("이름을 정확히 입력하세요");
									$('.ckMsg_name').css("color", "red");
									ck4 = false;
								}
							});//name

							$("#userAge").keyup(function() {

								var userAge = $("#userAge").val();

								if (isNaN(userAge) == true) {
									$('.ckMsg_age').text("나이를 정확히 입력하세요");
									$('.ckMsg_age').css("color", "red");
									ck5 = false;
								} else {
									$('.ckMsg_age').text("");
									ck5 = true;
								}

							});//age

							$("#userPhone")
									.keyup(
											function() {

												var userPhone = $("#userPhone")
														.val();
												var check1 = /^010([0-9]{8})$/;
												var check2 = /^01([1|6|7|8|9])([0-9]{3})([0-9]{4})$/;
												if (userPhone.match(check1) != null
														|| userPhone
																.match(check2) != null) {
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
						}); //form

		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출
			var pop = window.open("jusoPopup", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}

		function jusoCallBack(roadFullAddr) {
			var addressEI = document.querySelector("#userAddress");
			addressEI.value = roadFullAddr;
		}
	</script>

	<!-- Footer Section Begin "location.href='deleteUser'"-->
	<%@ include file="../include/footer.jsp"%>
	<!-- Footer Section End -->
</body>
</html>