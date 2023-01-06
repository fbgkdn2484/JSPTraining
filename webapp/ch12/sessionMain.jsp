<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 사용한 간단한 회원 인증</title>
</head>
<body>
<%
	String id = "";
	try{
		
		id = (String)session.getAttribute("id");	//자료형을 맞추기 위해 형변환 필요
		if(id == null || id.equals("")){
			response.sendRedirect("sessionLoginForm.jsp");
		}
		else{
%>
				<b><%= id %></b>님이 로그인 하셨습니다.
				<form method = "post" action="sessionLogout.jsp">
					<input type = "submit" value = "로그아웃">
				</form>
<%				
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>