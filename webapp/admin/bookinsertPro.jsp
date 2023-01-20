<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="book.BookDAO" %>   
<%@ page import="com.oreilly.servlet.MultipartRequest"%>						<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>		<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
	String managerId = (String) session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("main.jsp");	
	} else {
		//파일이 업로드되는 폴더를 지정한다.
		String saveFolder = "C://WS-JSPMySQL/BookSite/src/main/webapp/bookimg"; 	/* 절대 경로 */
		//String saveFolder = "../bookimg"; //상대경로 X
		String encType = "utf-8"; //엔코딩타입
		int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb
		MultipartRequest multi = null;		/* 일반 리퀘스트 객체 사용 x */
		String filename = "";

		try{																/* 같은 이름일 경우 자동으로 넘버링 붙여 중복을 막아줌 덮어쓰기 방지 */
		   multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());	/* 코드문제가 아닌 외부 문제가 있을 수 있어서 try사용 */
		   out.println("업로드 성공");
		   filename = multi.getFilesystemName("bimage"); //서버에 저장된 파일 이름	//원본 파일 명도 기억하길 원한다면 db에 2개의 칼럼 필요 
		}catch(Exception e){
		 	System.out.println(e);
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- ****************************************************************************************************************************************  -->
	<jsp:useBean id="article" class="book.BookVO">
		<!--<jsp:setProperty name="article" property="*" /> multipart/form-data 방식이기 때문에 동작하지 않음-->
	</jsp:useBean>
 <!-- ****************************************************************************************************************************************  -->
<%
	article.setBkind(multi.getParameter("bkind"));
	article.setBtitle(multi.getParameter("btitle"));
	article.setAuthor(multi.getParameter("author"));
	article.setPubcom(multi.getParameter("pubcom"));
	article.setPubdate(new Timestamp(Date.valueOf(multi.getParameter("pubdate")).getTime()));
	article.setPage(Integer.parseInt(multi.getParameter("page")));
	article.setBimage(filename);	
	article.setBcontent(multi.getParameter("bcontent"));
	
	BookDAO bdao = BookDAO.getInstance();
	bdao.insertBook(article);
	
	response.sendRedirect("booklist.jsp");
%>	
</body>
</html>
<%} %>