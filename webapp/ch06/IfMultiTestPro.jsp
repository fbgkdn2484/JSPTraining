<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	String name = request.getParameter("name");
	String loc = request.getParameter("Local");
	String tel = request.getParameter("tel");
	String locNum = "";
	
	if(loc.equals("서울")){
		locNum = "02";
	}
	else if(loc.equals("경기")){
		locNum = "031";
	}
	else if(loc.equals("강원")){
		locNum = "033";
	}
	else {
		locNum = "051";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%= name %></b>님의 전화번호는 <%=locNum %>-<%=tel %> 입니다.
	
</body>
</html>