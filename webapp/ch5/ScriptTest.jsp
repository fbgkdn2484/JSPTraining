<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%!
	//선언문 - 전역변수, 메서드 선언
	String str1 = "전역변수입니다~";	//전역변수
	String getStr() {
		return str1;
	}
%>
<body>
<h3>선언문, 스크립트릿, 표현식의 쓰임을 알아보는 예제</h3>
<hr>
<%
	//스크립트릿
	String str2 = "지역변수입니다~"; 	//지역변수
%>
스크립트릿에서 선언한 변수 str2는 <%= str2 %> <br> <!-- 표현식 -->
선언문에서 선언한 변수 str1은 <%= getStr() %>
</body>
</html>