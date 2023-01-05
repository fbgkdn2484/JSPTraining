<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 브라우저에 저장된 쿠키 가져오기</title>
</head>
<body>
	<h3>웹 브라우저에 저장된 쿠키를 가져오는 페이지</h3>
	<hr>
<%
		Cookie[] cookies = request.getCookies();		//쿠키의 정보를 받아올 때 배열로 리턴받기 때문에 배열 선언 필요
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("id")){
%>
					쿠키의 이름은 "<%= cookies[i].getName() %>" 이고,<br>
					쿠키의 값은 "<%= cookies[i].getValue() %>" 이고,
<%					
				}
			}
		}
%>
</body>
</html>