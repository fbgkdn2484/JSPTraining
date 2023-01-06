<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "members.MembersDAO" %>	<!-- 호출해서 쓰려면 객체 생성 필요 -->
    
<% request.setCharacterEncoding("utf-8"); %>

<%
			
			//폼태그로 보낸 정보를 받아옴
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			MembersDAO mdao = MembersDAO.getInstance();		//DAO객체 만드는 방법
			int check = mdao.userCheck(id, passwd);			//호출하는 방법
			
			if(check == 1){
				
				session.setAttribute("id", id);		//세션 영역에 아이디 저장하겠다는 뜻, 세션이 내장객체라 객체 생성 필요 x
				response.sendRedirect("sessionMain.jsp");
				
			}
			else if(check == 0){
%>
				<script>
					alert("비밀번호가 맞지 않습니다.");
					history.go(-1);		//전으로 돌아가기
				</script>
<%
			}
			else if(check == -1){
				
%>
				<script>
					alert("등록된 아이디가 아니거나 아이디가 일치하지 않습니다.");
					history.go(-1);
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
<body>

</body>
</html>