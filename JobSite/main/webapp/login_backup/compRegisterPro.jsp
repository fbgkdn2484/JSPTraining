<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "members.MembersDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
<%@ page import = "members.MembersVO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
    
<% request.setCharacterEncoding("utf-8"); %>

<%
			
			//폼태그로 보낸 정보를 받아옴
			String id = request.getParameter("id");		
			
			MembersDAO mdao = MembersDAO.getInstance();		//DAO객체 만드는 방법
			int check = mdao.idCheck(id);			//호출하는 방법
			
			if(check == -1){
				
%>				
			<jsp:useBean id = "article" class = "members.MembersVO">	
				<jsp:setProperty name = "article" property = "*" />		
			</jsp:useBean>
<%
			MembersDAO mbdao = MembersDAO.getInstance();
			System.out.println("---comp 실행 : " + article.getId());
			mbdao.insertCompMembers(article);
			response.sendRedirect("loginForm.jsp");
			
			System.out.println("---comp 실행 : " + article.getId());

			}
			else{
%>
				<script>
					alert("이미 존재하는 이메일 입니다.");
					history.go(-1);		//전으로 돌아가기
				</script>
<%
			}

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