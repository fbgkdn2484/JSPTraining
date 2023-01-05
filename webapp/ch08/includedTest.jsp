<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	포함되는 페이지 includedTest.jsp입니다.<br> 
	페이지 이름은 <%= page %><br> 
	<%= name %> 님 오셨구려.... <br><br> 
</body>
</html>