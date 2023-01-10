<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>	<!-- 액션 태그를 사용하면 VO파일 import필요 없음 -->
    
<% request.setCharacterEncoding("utf-8"); %>
<%
/* 	updatePro는 액션태그를 사용하기 때문에 히든으로 값을 넘기고 받을 때에도 따로 선언필요 */
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	<!-- ch10의 beanTestPro참고  * 모든 값 저장-->
	<jsp:useBean id = "article" class = "board.BoardVO">	
		<jsp:setProperty name = "article" property = "*" />		
	</jsp:useBean>
<%
			/* BoardDAO bdao = new  	//private으로 설정해서 객체생성 사용불가 */
			BoardDAO bdao = BoardDAO.getInstance();
			int check = bdao.updateBoard(article);
			
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