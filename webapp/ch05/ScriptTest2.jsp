<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Script 예제 - 활용</title>
</head>
<body>
<h3>Script 예제 - 활용</h3>
<hr>
<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
%>
현재는 <%=now.getHours() %>시 <%=now.getMinutes() %>분 <%=now.getSeconds() %>초 입니다.
</body>
</html>