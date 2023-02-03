<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="reply.ReplyDAO" %>   

<% request.setCharacterEncoding("utf-8");%>

<% 
	System.out.println("---pageNum : " + 123125125);
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int num = Integer.parseInt(request.getParameter("num"));
	int rnum = Integer.parseInt(request.getParameter("rnum"));

	String id = (String) session.getAttribute("id");
	
	System.out.println("---Num12 : " + rnum);
	System.out.println("---pageNum12 : " + pageNum);
	
	if(id==null || id.equals("")) {
		response.sendRedirect("../main/main.jsp");	
	} else {
		ReplyDAO rDAO = ReplyDAO.getInstance();
		rDAO.deletereply(rnum);			
		
	}
%>	

<script>
	/* response.sendRedirect("content.jsp?num = " + num + "&pageNum=" + pageNum);	   */
	/* response.sendRedirect("../freeboard/list.jsp");	 */ 
	<%-- window.alert("content.jsp?num=" + <%=num%> + "&pageNum=" + <%=pageNum%>); --%>
	location.href = "content.jsp?num=" + <%=num%> + "&pageNum=" + <%=pageNum%>;
	
	
</script>		


		