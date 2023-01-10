<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "board.BoardDAO" %>	<!-- 패키지명.클래스 -->
<%@ page import = "board.BoardVO" %>	<!-- 패키지명.클래스 -->  
<%@ page import = "java.text.SimpleDateFormat" %>	<!-- 패키지명.클래스 -->  

 

<%
	
	int num = Integer.parseInt(request.getParameter("num"));	//request는 항상 문자열로 반환하기 때문에 형변환 필요 네트워크로 전달 받는 숫자는 항상 문자열
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.getArticle(num);			/* 값이 정해져 있지 않은데 값을 지정하면 오류가 발생할 수 도 있으므로 null값을 지정한다.  */

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel = "stylesheet" type = "text/css" href = "style.css">
<!-- <script type="text/javascript" src = "script.js"></script>		//내용 입력해 주세요 -->
<style>
	th {
		width: 110pt;
		}
		
	td {
		width: 110pt;
		}
</style>
</head>
<body>
	<p>글 내용 보기</p>
		<table>
			<tr>
				<th class = "thcolor">글번호</th>
				<td align = "center" class = "tdcolor1"><%= article.getNum() %></td> 
				<th class = "thcolor">조회수</th>
				<td align = "center" class = "tdcolor1"><%= article.getReadcount() %></td> 
				
			</tr>
			<tr>
				<th class = "thcolor">작성자</th>
				<td align = "center" class = "tdcolor1"><%= article.getWriter() %></td>  
				<th class = "thcolor">작성일</th>
				<td align = "center" class = "tdcolor1"><%= sdf.format(article.getReg_date()) %></td>  
			</tr>											
			<tr>
				<th class = "thcolor">글제목</th>
				<td align = "center" colspan = "3" class = "tdcolor"><%= article.getSubject() %></td>  
			</tr>
			<tr>
				<th class = "thcolor">글내용</th>
				<td align = "center" colspan = "3" class = "tdcolor"><%= article.getContent()%></td>  
			</tr>
			<tr>
				<th colspan = "4" class = "thcolor">
					<input type = "button" value = "글수정" onclick="window.location = 'updateForm.jsp?num=<%= article.getNum()%>&pageNum=<%= pageNum %>'">
					<input type = "button" value = "글삭제" onclick="window.location = 'deleteForm.jsp?num=<%= article.getNum()%>&pageNum=<%= pageNum %>'">
					<input type = "button" value = "글목록" onclick="window.location = 'list.jsp?pageNum=<%= pageNum %>'">
				</th> 
			</tr>
		</table>
</body>
</html>