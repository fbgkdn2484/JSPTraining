<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	String pageName = request.getParameter("pageName");
	pageName += ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포함하는 페이지 includeTest.jsp입니다.
	<%= page %>
	<hr>
	<jsp:include page="<%= pageName %>">
		<jsp:param name="page" value="<%=pageName%>"/>
	</jsp:include>
	<hr>
	include.Test.Jsp의 나머지 내용입니다.
</body>
</html>