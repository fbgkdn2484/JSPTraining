<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<tr>
			<th width = "100">글내용</th>
			<th width = "100">글제목</th>
			<th width = "100">글내용</th>
		</tr>
		<% for(int i=1; i<=num; i++) {%>
		<tr>
			<td><%= i %></td>
			<td>제목<%= i %></td>
			<td>내용<%= i %></td>
		</tr>
		<% } %>
		
		<% 
		//for(int i=num; i>=1; i--) {
			//거꾸로 조건문
		//}
		%>
		
	</table>
</body>
</html>