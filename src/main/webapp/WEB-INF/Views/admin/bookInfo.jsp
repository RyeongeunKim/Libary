<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>책 정보</h1>
	<form action="" method="post">
		제목 : <input type="text" name="bookName" value="개미"><br>
		저자 : <input type="text" name="bookWriter" value="개미"><br>
		카테고리 : <input type="text" name="bookCategory" value="개미"><br>
		출판사 : <input type="text" name="bookPublisher" value="개미"><br>
		<input type="submit" value="확인"  onclick="javascript: form.action='bookInsert'">
	</form>

</body>
</html>