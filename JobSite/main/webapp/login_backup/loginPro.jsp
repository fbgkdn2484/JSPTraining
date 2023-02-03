<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="members.MembersDAO" %> 

<% request.setCharacterEncoding("utf-8");%>

<%
	String id = request.getParameter("id");
	String passwd= request.getParameter("passwd");

	MembersDAO mdao = MembersDAO.getInstance();
	int check = mdao.userCheck(id, passwd);
	
	if(check == 1) {
		session.setAttribute("id", id);			/* 세션에 id 값 저장 */
		
		MembersDAO mdao1 = MembersDAO.getInstance();
		/* int rnk = mdao1.rnkCheck(id);
		
		System.out.println("---select 실행 : " + rnk);
		
		session.setAttribute("rnk", rnk);*/		/* 세션에 rnk 값 저장 */ 
		response.sendRedirect("../main/main.jsp");
	} else if(check == 0) {
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%
	} else {
%>
	<script>
		alert("등록된 아이디가 아닙니다.");
		history.go(-1);
	</script>
<%		
	}
%>