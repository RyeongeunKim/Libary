<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<title>로그인</title>
</head>


<body>
	<h1>로그인</h1>
	<form action="" method="post">
		아이디 : <input type="text" name="userID" value="admin"><br>
		비밀번호 : <input type="password" name="userPwd" value="admin"><br>
		<input type="submit" value="로그인"  onclick="javascript: form.action='loginGo'" required="required">
		<input type="submit" value="회원가입"  onclick="javascript: form.action='join'" required="required">
	</form>
</body>