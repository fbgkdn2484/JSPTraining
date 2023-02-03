<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "members.MembersDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import = "members.MembersVO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>						<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>		<!-- 파일 업로드를 위한 외부 라이브러리 -->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>

<%

		String id = (String) session.getAttribute("id");
		MembersDAO mdao = MembersDAO.getInstance();		//DAO객체 만드는 방법
		int check = mdao.idCheck(id);			//호출하는 방법
		
		if(check == 1){
			
			/*	이미지 삭제 후 업데이트 해야 이미지가 서버에 남지 않아 오버헤드가 준다 질문 할 것
			MembersDAO iDAO = MembersDAO.getInstance();
			MembersVO iBean = MembersDAO.getArticle(Integer.parseInt(id));		
			MembersDAO.updateimg(Integer.parseInt(id));	
			
			new File("C://WS-JSPMySQL/JobSite/src/main/webapp/userimg/" + iBean.getImg()).delete(); //저장되어 있는 이미지 삭제			*****************************
			*/
			
			//파일이 업로드되는 폴더를 지정한다.
			String saveFolder = "C://WS-JSPMySQL/JobSite/src/main/webapp/userimg"; 	/* 절대 경로 */
			//String saveFolder = "../bookimg"; //상대경로 X
			String encType = "utf-8"; //엔코딩타입
			int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb
			MultipartRequest multi = null;		/* 일반 리퀘스트 객체 사용 x */
			String filename = "";
			try{																/* 같은 이름일 경우 자동으로 넘버링 붙여 중복을 막아줌 덮어쓰기 방지 */
			   multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());	/* 코드문제가 아닌 외부 문제가 있을 수 있어서 try사용 */
			   out.println("업로드 성공");
			   filename = multi.getFilesystemName("img"); //서버에 저장된 파일 이름	//원본 파일 명도 기억하길 원한다면 db에 2개의 칼럼 필요 
			}catch(Exception e){
			 	System.out.println(e);
			}
		
%>

 <!-- ****************************************************************************************************************************************  -->
			<jsp:useBean id = "article" class = "members.MembersVO">	
				<%-- <jsp:setProperty name = "article" property = "*" />	multipart/form-data 방식이기 때문에 동작하지 않음 --%>	
			</jsp:useBean>
<!-- ****************************************************************************************************************************************  -->
<%


			article.setId(multi.getParameter("id"));
			article.setName(multi.getParameter("name"));
			article.setTel(multi.getParameter("tel"));
			article.setBirth(new Timestamp(Date.valueOf(multi.getParameter("birth")).getTime()));
			article.setAddr(multi.getParameter("addr"));
			article.setImg(filename);	


			MembersDAO mbdao = MembersDAO.getInstance();
			mbdao.updateMembers(article);
			System.out.println("---article 실행 : " + article);
			response.sendRedirect("../main/main.jsp");
		}
%>