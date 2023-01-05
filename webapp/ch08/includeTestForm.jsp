<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 액션태그</title>
</head>
<body>
	<h3>include 액션태그</h3>
	<hr>
	<form method = "post" action = "includeTest.jsp">
		이름 : <input type = "text" name = "name"><br>
		페이지 이름 : <input type = "text" name = "pageName" value = "includedTest"><br>
		<input type = "submit" value = "입력완료"><br>
	</form>
</body>
</html>