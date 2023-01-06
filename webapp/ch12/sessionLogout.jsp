<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate(); //현재 세션에 저장하고 있는 정보를 초기화
%>

<script>
	alert("로그아웃 되었습니다.");
	location.href = "sessionMain.jsp";
</script>
				
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>