<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); //한글을 전달 받게하게 하기 위한 코드 %>

<%
	//네트워크에서 전달한 내용을 받는 곳
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));		//숫자를 전달받을 때에는 형변환 필요!! 항상 문자로 받아오기 때문에
	String result = "";
	
	if(age >= 20){
		result = "성년";
	}
	else{
		result = "미성년";
	}
	
	out.println("<b>" + name + "</b> 님은 " + result + " 입니다!<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름과 나이를 받아와 처리하는 곳</title>
</head>
<body>
<b><%= name %></b> 님은 <%= result %> 입니다.
</body>
</html>