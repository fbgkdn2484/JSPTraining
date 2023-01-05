<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
</head>
<body>
	<h3>members 테이블에 회원 추가</h3>
	<hr><br>
	<form method = "post" action="insertPro.jsp">
		아이디 : <input type = "text" name = "id" maxlength = "50"> <br><br>
		패스워드 : <input type = "password" name = "passwd" maxlength = "20"> <br><br>
		이름 : <input type = "text" name = "name" maxlength = "30"> <br><br>
		<input type = "submit" value = "입력완료">
	</form>
</body>
</html>