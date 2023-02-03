<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "user.UserDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>


<% request.setCharacterEncoding("utf-8"); %>

<% 
	String id = (String) session.getAttribute("id");
	if(id==null || id.equals("")) {
		response.sendRedirect("../main/main.jsp");	
	} 
	else {
%>
	<jsp:useBean id="article" class="user.UserVO">
		<jsp:setProperty name="article" property="*" />
	</jsp:useBean>
<%
	UserDAO udao = UserDAO.getInstance();
	udao.insertuser(article);

	
	response.sendRedirect("../main/main.jsp");
	
	}
%>		


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	<!-- ch10의 beanTestPro참고  -->

</body>
</html>