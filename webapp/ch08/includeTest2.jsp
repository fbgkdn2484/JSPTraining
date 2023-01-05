<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	//스크립트릿이기 때문에 전역변수 X 지역변수에 해당
	String name = "홍길동";
	String pageName = "includedTest2.jsp";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	포함하는 페이지 includeTest2.jsp입니다.
	포함되는 페이지에 파리미터 값을 전달합니다.
	<hr>
	<jsp:include page = "<%= pageName %>">
		<jsp:param name = "name" value = "<%= name %>" ></jsp:param>
	</jsp:include>
	<hr>
	includeTest2.jsp의 나머지 내용입니다.
</body>
</html>