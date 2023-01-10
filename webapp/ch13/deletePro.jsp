<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>	<!-- 액션 태그를 사용하면 VO파일 import필요 없음 -->
    
<% request.setCharacterEncoding("utf-8"); %>

<%	
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	

<%
			/* BoardDAO bdao = new  	//private으로 설정해서 객체생성 사용불가 */
			BoardDAO bdao = BoardDAO.getInstance();
			int check = bdao.deleteBoard(num, passwd);
			
			if(check == 1) {
				response.sendRedirect("list.jsp?pageNum=" + pageNum);
			}
			else{
%>
				<script type = "text/javascript">
					alert("비밀번호가 맞지 않습니다.");
					history.go(-1);
				</script>
<%
			}
			
%>

</body>
</html>