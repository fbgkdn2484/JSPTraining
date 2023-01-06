<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>
    
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	<!-- ch10의 beanTestPro참고  -->
	<jsp:useBean id = "article" class = "board.BoardVO">	
		<jsp:setProperty name = "article" property = "*" />		
	</jsp:useBean>
<%
			/* BoardDAO bdao = new  	//private으로 설정해서 객체생성 사용불가 */
			BoardDAO bdao = BoardDAO.getInstance();
			bdao.insertBoard(article);
			response.sendRedirect("list.jsp");
%>

</body>
</html>