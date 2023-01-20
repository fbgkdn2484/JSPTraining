<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="top">
	<h3><a href="../main/main.jsp">도서 소개 사이트</a></h3>
	<ul id="topmenu">
<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
		if (id==null || id.equals("")) { %>		<!-- 로그인이 되어 있는지 아닌지를 판별 -->
		
			<li><a href="../member/memberForm.jsp">회원 가입</a> </li>
	        <li> | </li>
	        <li><a href="../member/loginForm.jsp">로그인</a></li>		
<%		
		} else {
%>
			<li><%=id %> 님</li>
			<li> | </li>
			<li><a href="../member/logoutPro.jsp">로그 아웃</a></li>
	        <li> | </li>
	        <li><a href="../member/memberupdateForm.jsp">정보 수정</a></li>			
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

	</ul>
  </div> 
  <nav id="menubar">		<!-- 메뉴 바 -->
    <ul>
      <li><a href="../main/main.jsp">HOME</a></li>
      <li><a href="../book/booklist.jsp">도서 소개</a></li>
      <li><a href="../freeboard/list.jsp">자유게시판</a></li>
      <li><a href="#">Q & A</a></li>
      <li><a href="#">사이트맵</a></li>
    </ul>
  </nav>
</body>
</html>