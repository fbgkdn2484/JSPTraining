<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h3>로그인 폼</h3>
	<hr><br>
	<form method = "post" action="sessionLoginPro.jsp">
		아이디 : <input type = "text" name = "id" maxlength="50"><br><br>
		비밀번호 : <input type = "password" name = "passwd" maxlength="20"><br><br>
		<input type = "submit" value = "로그인">
		<input type = "button" value = "회원가입" onclick="location.href = '../ch11/insertForm.jsp'">
	</form>
</body>
</html>