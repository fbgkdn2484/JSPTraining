<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "members.MembersDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import = "members.MembersVO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = (String) session.getAttribute("id");
%>

			<jsp:useBean id = "article" class = "members.MembersVO">	
				<jsp:setProperty name = "article" property = "*" />		
			</jsp:useBean>
<%
			MembersDAO mdao = MembersDAO.getInstance();
			mdao.updateMembers(article);
			response.sendRedirect("../main/main.jsp");
%>