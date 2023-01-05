<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cookieName = "id";
	Cookie cookie = new Cookie(cookieName, "hongkd"); 	//쿠키 생성
	cookie.setMaxAge(60 * 2); 	//쿠키 지속 시간 : 2분
	response.addCookie(cookie);// 웹 브라우저에 쿠키 등록
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
	<h3>쿠키를 생성하는 페이지</h3>
	<hr>
	"<%= cookieName %>" 쿠키가 생성되었습니다. <br>
	<form method = "post" action="useCookie.jsp">
		<input type = "submit" value = "생성된 쿠키 확인"> 
	</form>
</body>
</html>