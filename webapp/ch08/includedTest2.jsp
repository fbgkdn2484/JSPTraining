<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String name = request.getParameter("name");
	String pagename = request.getParameter("pagename");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파라미터 값을 전달 받아 실행되는<br>
	포함되는 페이지 <%= pagename %>입니다.<br>
	<%= name %> 님 오셨구려...
	 
</body>
</html>