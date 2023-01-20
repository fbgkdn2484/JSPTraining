<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="book.BookDAO" %>
<%@ page import="book.BookVO" %>
<%@ page import="java.io.File" %>     

<%
    request.setCharacterEncoding("utf-8");
    %>

<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	String managerId = (String) session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("main.jsp");	
	} else {
		BookDAO bookDAO = BookDAO.getInstance();
		BookVO bookBean = bookDAO.getArticle(bnum);		
		bookDAO.deleteBook(bnum);				
		
		new File("C://WS-JSPMySQL/BookSite/src/main/webapp/bookimg/" + bookBean.getBimage()).delete(); //저장되어 있는 이미지 삭제			*****************************

		response.sendRedirect("booklist.jsp?pageNum=" + pageNum);
	}
%>