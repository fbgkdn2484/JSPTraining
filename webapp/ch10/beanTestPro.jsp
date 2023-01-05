<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈을 사용하는 JSP페이지</title>
</head>
<body>	
	<!-- ch10.TestBean testBean = new ch10.TestBean();라는 의미 -->
	<jsp:useBean id="testBean" class="ch10.TestBean">
		<!-- testBean.setName(name);라는 의미 -->
		<jsp:setProperty name = "testBean" property="name" />
	</jsp:useBean>
	<h3>자바빈을 사용하는 jsp페이지</h3>
	<hr>
			   <!-- testBean.getName(); -->
	입력된 이름은 <jsp:getProperty property="name" name="testBean"/>
</body>
</html>
