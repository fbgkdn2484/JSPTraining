<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>	<!-- 패키지명.클래스 -->
<%@ page import = "board.BoardVO" %>	<!-- 패키지명.클래스 -->  

<%
	//업데이트를 위해 몇번 글인지를 알아야 함
	int num = Integer.parseInt(request.getParameter("num"));	//request는 항상 문자열로 반환하기 때문에 형변환 필요 네트워크로 전달 받는 숫자는 항상 문자열
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.getArticleUpdate(num);			/* getArticleUpdate을 지정하여 조회수 증가를 막고 글만 가지고 온다  */

	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel = "stylesheet" type = "text/css" href = "style.css">
<script type="text/javascript" src = "script.js"></script>
<style>
	th {
		width: 80pt;
		}
		
	td {
		width: 300pt;
		}
</style>
</head>
<body>
	<p>글수정</p>					 <!-- insertform 자바스크립트를 사용하기 위해 일단 이 이름으로 사용  -->
	<form method = "post" name = "insertform" action="updatePro.jsp" onsubmit = "return writeSave()">	<!-- onsubmit submit되기 전에 실회되게 하는 코드  -->
		<table>
			<tr>
				<th class = "thcolor">이 름</th>
				<td class = "tdcolor">
					<input type = "text" size = "10" maxlength = "20" name = "writer" value = "<%= article.getWriter() %>">
					<input type = "hidden" name = "num" value = "<%= article.getNum() %>">	<!-- 필요한 값이 있을 때 hidden으로 전달  -->
					<input type = "hidden" name = "pageNum" value = "<%= pageNum %>">		<!-- updatePro는 액션태그를 사용하기 때문에 히든으로 값을 넘기고 받을 때에도 따로 선언필요 -->
				</td> 
			</tr>
			<tr>
				<th class = "thcolor">제 목</th>
				<td class = "tdcolor">
					<input type = "text" size = "40" maxlength = "50" name = "subject" value = "<%= article.getSubject() %>">
				</td> 
			</tr>
			<tr>
				<th class = "thcolor">Email</th>
				<td class = "tdcolor">
					<input type = "text" size = "40" maxlength = "30" name = "email" value = "<%= article.getEmail() %>">
				</td> 
			</tr>
			<tr>
				<th class = "thcolor">내 용</th>
				<td class = "tdcolor">
					<textarea name = "content" rows = "13" cols = "42"><%= article.getContent() %></textarea>
				</td> 
			</tr>
			<tr>
				<th class = "thcolor">비밀번호</th>
				<td class = "tdcolor">
					<input type = "password" size = "8" maxlength = "15" name = "passwd">
				</td> 
			</tr>
			<tr>
				<th colspan = 2 class = "thcolor">
					<input type = "submit" value = " 수 정 ">
					<input type = "reset" value = "다시작성">
					<input type = "button" value = "목록보기" onclick="window.location = 'list.jsp?pageNum=<%= pageNum %>'">
				</th> 
			</tr>
		</table>
	</form>
</body>
</html>