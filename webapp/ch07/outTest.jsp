<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 내장 객체</title>
</head>
<body>
	<h3>out 내장 객체 - out.println() 활용</h3>
	<%
		String name = "hong";
		out.println("출력되는 내용은 <b>" + name + "</b> 입니다.");
	%>
	<hr>
	<h3>위와 같은 내용 출력 - 표현식</h3>
	출력되는 내용은 <b><%= name %></b> 입니다.
</body>
</html>