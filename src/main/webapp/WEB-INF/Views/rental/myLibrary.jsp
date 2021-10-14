<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출중도서</title>

<style>
.left {
	float: left;
	width: 10%;
}

.right {
	float: right;
	width: 90%;
}

.bottom {
	width: 100%;
	height: 150px;
	float: left;
}
</style>


</head>

<body>

	<div>

		<div>
			<!-- Header Section Begin -->
			<%@ include file="../include/header.jsp"%>
			<!-- Header Section End -->
		</div>




		<div>
			<div>
				<h1>대출중도서</h1>
				<hr>
				<h3>현재 대출중인 도서를 확인하세요.</h3>
				<hr>
			</div>
			<div class="left">
				<form action="" method="post">
					<input type="submit" value="대출중도서"
						onclick="javascript: form.action='myLibrary'"><br> <input
						type="submit" value="대출이력"
						onclick="javascript: form.action='rentalHistory'">
				</form>
			</div>

			<div class="right">
				<ul>
					<c:forEach var="i" items="${ rentaling }">
						<li>책 이름 : ${i.rentalBookName} 청구기호 : ${i.rentalID} 대출일 :
							${i.returnDate} 반납일 : ${i.rentalDate}</li>

					</c:forEach>
				</ul>
			</div>

			<!-- ///////////// -->

			<div>
				<script>
					function secession() {
						if (confirm("회원탈퇴 하시겠습니까?")) {
							location.href = "deleteUser";
						} else {
							location.href = "myLibrary"
						}
					}

					function openRepassword() {
						window.open("reEnter", "", "width=582,height=360");
					}

					function aaa(userPwd) {
						location.href = "reConfirm?userPwd=" + userPwd
					}
				</script>
			</div>
			<div>
				<button type="button" class="btn btn-outline-primary me-2"
					onclick="openRepassword()">정보수정</button>

				<button type="button" class="btn btn-outline-primary me-2"
					onclick="secession()">회원탈퇴</button>
			</div>


		</div>



		<div class="bottom">
			<!-- Footer Section Begin -->
			<%@ include file="../include/footer.jsp"%>
			<!-- Footer Section End -->
		</div>

	</div>

</body>
</html>