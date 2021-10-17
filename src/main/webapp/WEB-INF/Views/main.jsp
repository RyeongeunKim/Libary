<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>부산광역시립해운도서관</title>
	<link rel="stylesheet" hred="http://fonts.googleapis.com/icon?family=Material+Icons">
	<link href="${path}/resources/bootstrap/css/main.css" rel="stylesheet"/> 	
</head>

<body>
	
	<div id="wrap">
	
	
	<!-- Footer Section Begin -->
	<%@ include file="include/header.jsp" %>
	<!-- Footer Section End -->

	<!-- main영역 -->
	<div class="row">
		<div class="center">
			<div class="card">

				<!-- 검색 바 시작-->
				<div class="realbox">
				<div class="boxContainer">
					<table class="elementsContainer">
						<form mathod="post" action="search">
							<tr>
								<!-- 장르검색 -->
								<td class="selectbar_container">	
									<select class="selectbar" name="bookInfo">
										<option value="bookName">도서명</option>
										<option value="bookWriter">저자</option>
										<option value="bookPublisher">출판사</option>
									</select> 
								</td>

								<!-- 입력창 -->
								<td>
									<input class="input_text" type="text" name="keyword">
								</td> 
								<!-- 검색버튼 -->
								<td>
									<input class="main-search-botton" type="submit" value="검색">
								</td>
							</tr>
						</form>
					</table>
				</div>
				</div>
				<!-- 검색 바 끝-->
			</div>
		</div>
	</div>
		<!-- main영역 끝 -->

		<!-- footer 영역 시작 -->
			<%@ include file="include/footer.jsp" %>
		<!-- footer 영역 끝 -->
		
		
			
		
		</div>
</body>
</html>