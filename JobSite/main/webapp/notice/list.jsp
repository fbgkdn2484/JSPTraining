<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "notice.NoticeVO" %>	<!-- 패키지명.클래스 -->   
<%@ page import = "notice.NoticeDAO" %> 	<!-- 패키지명.클래스 -->  
<%@ page import = "java.util.List" %>	<!-- 패키지명.클래스 -->   
<%@ page import = "java.text.SimpleDateFormat" %>	<!-- 패키지명.클래스 -->  

<%

	int count = 0;  //총 글수
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<NoticeVO> alist = null;			/* 값이 정해져 있지 않은데 값을 지정하면 오류가 발생할 수 도 있으므로 null값을 지정한다.  */
	NoticeDAO ndao = NoticeDAO.getInstance();
	count = ndao.getArticleCount();	 /* 갯수를 반환 */
	
	
	
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
		alist = ndao.getArticles(startRow, pageSize);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개</title>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/board.css" rel="stylesheet" type="text/css">
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
	<header>
	  <jsp:include page="../module/header.jsp" flush="false"/>
	</header>
	<section>
		<div>
		
			<h2>공지 사항</h2>
			<ul class="buttons">
			     <li>
		<%
			   	String id = (String) session.getAttribute("id");
				Integer rnk = (Integer)session.getAttribute("rnk");
			
			   	if ((id==null || id.equals("")) && rnk != 2) { %>
			      <a href="javascript:alert('관리자만 이용할 수 있습니다.')"><button>글쓰기</button></a>
		<%   	} 
			   	else 
				{ %>
		      	<button onclick="location.href='writeForm.jsp'">글쓰기</button>
		<%   	} %>
		   		</li>
		  	</ul>
		</div>
	  
	  <div id="board_box">
	  <ul id="board_list">
		   <li>
		      <span class="col1"><b>번호</b></span>
		      <span class="col2"><b>제 목</b></span>
		      <span class="col3"><b>글쓴이</b></span>
		      <span class="col4"><b>등록일</b></span>
		      <span class="col5"><b>조회</b></span>
		   </li>

<%
	for(int i = 0; i < alist.size(); i++){
		NoticeVO article = alist.get(i);				//레코드 한줄
%>	
		<li>
	      <span class="col1"><%=number--%></span>			<!-- 글번호 -->	<!-- 페이지 번호 -->
	      <span class="col2"><a href="content.jsp?num=<%=article.getNnum()%>&pageNum=<%=currentPage%>"><%=article.getNsubject()%></a>
	      </span>
	      <span class="col4"><%=sdf.format(article.getNreg_date())%></span>
	      <span class="col5"><%=article.getNreadcount()%></span>
	   </li>
<%			
	}
%>
	</ul>   
	<br>
	<div class="page">
	

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
	  </div>
	  
  </div>
</section>
<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>
</body>
</html>