<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    String bookId = request.getParameter("bookID");
    %>
	<h1>책 정보</h1>
	<form action="" method="post">
	<input type="hidden" name = "bookID" value=<%=bookId%>>
		제목 : <input type="text" name="bookName" value="개미1"><br>
		저자 : <input type="text" name="bookWriter" value="개미1"><br>
		카테고리 : <input type="text" name="bookCategory" value="개미1"><br>
		출판사 : <input type="text" name="bookPublisher" value="개미1"><br>
		<input type="submit" value="확인"  onclick="javascript: form.action='bookUpdate'">
	</form>
</body>
</html>