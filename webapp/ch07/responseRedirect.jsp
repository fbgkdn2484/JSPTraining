<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 내장 객체</title>
</head>
<body>
	<h3>response 내장 객체 - 리다이렉트 예제</h3>
	<hr>
	현재 페이지는 <b>responseRedirect.jsp</b>페이지입니다.
	<%
		response.sendRedirect("responseRedirected.jsp");
	%>
</body>
</html>