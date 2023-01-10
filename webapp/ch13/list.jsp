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
	count = bdao.getArticleCount();	 /* 갯수를 반환 */
	
	//-------------------------------페이지 처리
	
	int pageSize = 10; 		//end부분		한페이제 몇개를 출력할 지
	int number = 0;			//현재 페이지의 시작 번호
	String pageNum = null;
	
	pageNum = request.getParameter("pageNum");
	if(pageNum == null){		//처음 페이지는 전달 받은게 없으므로
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);	//계산을 위해서 형변환  	//1				//2
	int startRow = (currentPage-1) * pageSize + 1;						//(1-1)*10+1=1	
	//int endRow = currentPage * pageSize;			//오라클일 때 사용
	
	number = count - (currentPage - 1) * pageSize;	//14-(1-1)*10 = 14	//14-(2-1)*10 = 4
	//-------------------------------
	
	if(count > 0){
		alist = bdao.getArticles(startRow, pageSize);
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
			<td align = "center" class = "tdcolor1"><%= number-- %></td>	<!-- 현재 페이지 시작번호인 number 사용 -->
			<td align = "center" class = "tdcolor">
				<a href = "content.jsp?num=<%= article.getNum() %>&pageNum=<%= currentPage %>"><%= article.getSubject() %></a>
			</td>		<!-- content.jsp?뒤에 값을 전달 할 수 있다. -->
			<td align = "center" class = "tdcolor1"><%= article.getWriter() %></td>
			<td align = "center" class = "tdcolor1"><%= sdf.format(article.getReg_date()) %></td>
			<td align = "center" class = "tdcolor1"><%= article.getReadcount() %></td>
		</tr>	
<%	
	}
%>
	</table><br><br>
<%	
		
	}
%>
<%
//-------------------------------페이지 번호 목록

	if(count > 0){		//글이 하나라도 있을 때 표시
		int pageCount = count / pageSize + (count%pageSize==0 ? 0 : 1);		//10개 이상이면 페이지 1, 2가 나오게 만듬
		int startPage = 1;
		if(currentPage % 10 != 0){
			startPage = (int)(currentPage/10) * 10 + 1;						//1페이지인지 11페이지인지
		}
		else{
			startPage = ((int)(currentPage/10)-1) * 10 + 1;
		}
		
		int pageBlock = 10;  	//페이지 개수 10개만 보이게
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > 10){
%>
			<a href = "list.jsp?pageNum=<%= startPage-10 %>">[이전]</a>
<%
		}
		
		for(int i = startPage; i<= endPage; i++){
%>
			<a href = "list.jsp?pageNum=<%= i %>">[ <%= i %> ]</a>
<%
		}
		if(endPage < pageCount){
%>
			<a href = "list.jsp?pageNum=<%= startPage+10 %>">[다음]</a>
<%
		}
	}

//-------------------------------
%>
</body>
</html>