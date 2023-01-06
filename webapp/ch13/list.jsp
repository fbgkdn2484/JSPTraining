<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>	<!-- 패키지명.클래스 -->
<%@ page import = "board.BoardVO" %>	<!-- 패키지명.클래스 -->   
<%@ page import = "java.util.List" %>	<!-- 패키지명.클래스 -->   
<%@ page import = "java.text.SimpleDateFormat" %>	<!-- 패키지명.클래스 -->  

<%

	int count = 0;  //총 글수
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	List<BoardVO> alist = null;			/* 값이 정해져 있지 않은데 값을 지정하면 오류가 발생할 수 도 있으므로 null값을 지정한다.  */
	BoardDAO bdao = BoardDAO.getInstance();
	count = bdao.getArticleCount();
	
	if(count > 0){
		alist = bdao.getArticles();
	}
	
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
		
		}
		
	td {
		text-align = "center";
		}
</style>
</head>
<body>
<p>글목록 (전체 글 : <%= count %>)</p>
<table>
	<tr>
		<td width = "620" align = "right">
			<input type = "button" value = "글쓰기" onclick="window.location = 'insertForm.jsp'">		<!-- location 소문자 'l'사용할 것 -->
		</td>
	</tr>
</table>

<%
	if(count == 0){
%>
	<table>
		<tr>
			<td align = "center"> 게시판에 저장된 글이 없습니다.</td> 
		</tr>
	</table>
<%		
	}
	else{	
%>
	<table>
		<tr>
			<th width = "50" class = "thcolor">번 호</th> 
			<th width = "250" class = "thcolor">제 목</th> 
			<th width = "100" class = "thcolor">작성자</th> 
			<th width = "150" class = "thcolor">작성일</th> 
			<th width = "50" class = "thcolor">조 회</th> 
		</tr>
<%
	for(int i = 0; i < alist.size(); i++){
		BoardVO article = alist.get(i);
%>	
		<tr>
			<td align = "center" class = "tdcolor1"><%= count-- %></td>	<!-- 게시판 번호로 총 갯수에서 하나씩 빼서 번호를 표현 -->
			<td align = "center" class = "tdcolor"><a href = "content.jsp?num=<%= article.getNum() %>"><%= article.getSubject() %></a></td>		<!-- content.jsp?뒤에 값을 전달 할 수 있다. -->
			<td align = "center" class = "tdcolor1"><%= article.getWriter() %></td>
			<td align = "center" class = "tdcolor1"><%= sdf.format(article.getReg_date()) %></td>
			<td align = "center" class = "tdcolor1"><%= article.getReadcount() %></td>
		</tr>	
<%	
	}
%>
	</table>
<%	
		
	}
%>

</body>
</html>