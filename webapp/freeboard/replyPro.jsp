<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="reply.ReplyDAO" %>

<% request.setCharacterEncoding("utf-8");%>

<!-- 댓글을 등록하는 기능 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));	//페이지 번호

	String id = (String) session.getAttribute("id");
	if(id==null || id.equals("")) {
		response.sendRedirect("../main/main.jsp");	
	} else {
%>
	<jsp:useBean id="reply" class="reply.ReplyVO">
		<jsp:setProperty name="reply" property="*" />		<!--  -->
	</jsp:useBean>
<%
	ReplyDAO replyDAO = ReplyDAO.getInstance();
	replyDAO.insertReply(reply);
	
	response.sendRedirect("content.jsp?num=" + reply.getRef() + "&pageNum=" + pageNum);		//현재 글번호와 페이지 번호가 뭔지
	
	}
%>	
</body>
</html>