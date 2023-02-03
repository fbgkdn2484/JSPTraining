<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "job.JobDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import = "job.JobVO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>						<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>		<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
			//폼태그로 보낸 정보를 받아옴
			String id = request.getParameter("id");		

			JobDAO jdao = JobDAO.getInstance();		//DAO객체 만드는 방법

				//파일이 업로드되는 폴더를 지정한다.
				String saveFolder = "C://WS-JSPMySQL/JobSite/src/main/webapp/jobimg"; 	/* 절대 경로 */
				//String saveFolder = "../bookimg"; //상대경로 X
				String encType = "utf-8"; //엔코딩타입
				int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb
				MultipartRequest multi = null;		/* 일반 리퀘스트 객체 사용 x */
				String filename = "";

				try{																/* 같은 이름일 경우 자동으로 넘버링 붙여 중복을 막아줌 덮어쓰기 방지 */
				   multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());	/* 코드문제가 아닌 외부 문제가 있을 수 있어서 try사용 */
				   out.println("업로드 성공");
				   filename = multi.getFilesystemName("job_image"); //서버에 저장된 파일 이름	//원본 파일 명도 기억하길 원한다면 db에 2개의 칼럼 필요 
				}catch(Exception e){
				 	System.out.println(e);
				}
				
%>				
 <!-- ****************************************************************************************************************************************  -->
			<jsp:useBean id = "article" class = "job.JobVO">	
				<%-- <jsp:setProperty name = "article" property = "*" />	multipart/form-data 방식이기 때문에 동작하지 않음 --%>	
			</jsp:useBean>
<!-- ****************************************************************************************************************************************  -->
<%

			article.setJob_id(multi.getParameter("job_id"));
			article.setJob_subject(multi.getParameter("job_subject"));
			article.setJob_content(multi.getParameter("job_content"));
			article.setJob_caeer(multi.getParameter("job_caeer"));
			article.setJob_stu(multi.getParameter("job_stu"));
			article.setJob_empl(multi.getParameter("job_empl"));
			article.setJob_money(multi.getParameter("job_money"));
			article.setJob_up(multi.getParameter("job_up"));
			article.setJob_area(multi.getParameter("job_area"));
			article.setJob_cond(multi.getParameter("job_cond"));
			article.setJob_job(multi.getParameter("job_job"));
			article.setJob_image (filename);
			article.setJob_head(Integer.parseInt(multi.getParameter("job_head")));
			article.setJob_edate(new Timestamp(Date.valueOf(multi.getParameter("job_edate")).getTime()));

			
			


			JobDAO jbdao = JobDAO.getInstance();
			jbdao.updatejob(article);
			response.sendRedirect("../main/main.jsp");
			



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