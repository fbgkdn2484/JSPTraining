<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="freeboard.FreeboardDAO" %>
<%@ page import="freeboard.FreeboardVO" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="reply.ReplyVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	System.out.println("---01 : " + Integer.parseInt(request.getParameter("num")));
	System.out.println("---02 : " + Integer.parseInt(request.getParameter("pageNum")));

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");	
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");		/* 댓글은 날짜만 */
	FreeboardDAO fbDAO = FreeboardDAO.getInstance();
	FreeboardVO article = fbDAO.getArticle(num);
	
	List<ReplyVO> replyList = null;
	int count = 0; //총 댓글수
	
	ReplyDAO rDAO = ReplyDAO.getInstance();
	count = rDAO.getArticleCount(num);
	
	if (count > 0) {
		replyList = rDAO.getArticles(num);
	}
	
	/* num이 rnum */
%>

<html>
<head>
<title>도서 소개</title>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/board.css" rel="stylesheet" type="text/css">
<script>
  function check_input() {
      if (!document.reply_form.reply.value)
      {
          alert("댓글을 입력하세요!");    
          document.reply_form.reply.focus();
          return;
      }
      document.reply_form.submit();
   }
  
   function del(num, pageNum) {	  
	  if (confirm("삭제하시겠습니까?")) {
		  location.href="deletePro.jsp?num=" + num + "&pageNum=" + pageNum;
	  } else {
		  location.href="list.jsp?pageNum=" + pageNum;
	  }
   }
</script>
</head>
<body>
<header>
  <jsp:include page="../module/header.jsp" flush="false"/>
</header>
<div class ="container">
<section>
  <h2>자유 게시판 > 내용 보기</h2>
  <div id="board_box">
    <ul id="view_content">
		<li>
			<span class="col1"><b>제 목 :</b> <%=article.getSubject()%> </span>
			<span class="col2"> <%=article.getWriter()%> | <%=sdf.format(article.getReg_date())%> </span>
		</li>
		<li>
			<%=article.getContent().replace("\r\n", "<br><br>")%>
		</li>		
    </ul>
    
    <ul class="buttons">
<%
	String id = (String) session.getAttribute("id");
	Integer rnk = (Integer)session.getAttribute("rnk");

	System.out.println("---rnk : " + rnk);
	
	if ((!(id==null) && id.equals(article.getWriter())) || rnk == 2) {		//현재 글쓴이와 같으면 
%>			
		<li><button onclick="location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">수정</button></li>
		<li><button onclick="del(<%=article.getNum()%>,<%=pageNum%>)">삭제</button></li>
		<li><button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">목록</button></li>
<%
} else {
%>
		<li><button onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">목록</button></li>
<%
}
%>			
	</ul>
<%
if (count > 0) {
%>
	  <ul id="reply_content">
<%
for(int i=0; i<replyList.size(); i++) {
  		ReplyVO reply = replyList.get(i);
%>	
		<li>
			<span class="col1" style = "width: 180px;"><%=reply.getRwriter()%></span>
			<span class="col2" style = ";"><%=reply.getReply().replace("\r\n", "<br>")%></span>
			<span class="col3"><%=sdf2.format(reply.getRreg_date())%></span>
<%		  if ((!(id==null) && id.equals(reply.getRwriter())) || rnk == 2) { %>

<%
System.out.println("---Num6 : " + article.getNum());
System.out.println("---Num7 : " + pageNum);
System.out.println("---Num8 : " + reply.getRnum());
%>
			
			<span class="col4"><button onclick="location.href='replyDeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&rnum=<%=reply.getRnum()%>'">삭제</button></span>
 	   <% } %>
		</li>	
<%    } %>
    </ul>
<%  } %>
  <form  name="reply_form" method="post" action="replyPro.jsp">		<!-- 댓글을 입력하는 부분  -->
    <input type="hidden" name="rwriter" value="<%=id %>">
  	<input type="hidden" name="ref" value="<%=article.getNum() %>">
    <input type="hidden" name="pageNum" value="<%=pageNum %>">
	<ul id="reply_form">
<%	if (id==null || id.equals("")) { %>
		<li> * 댓글은 회원만 가능합니다 * </li>
<%	} else { %>
	
   		<li>	
   			<span class="col1" style = "width: 180px;"><%=id%></span>
   			<span class="col2"><textarea name="reply"></textarea></span>
   			<span class="col3"><button onclick="check_input()">입력</button></span>
   		</li>
<%	} %>		
    </ul>
  </form>
  </div>
  <br><br><br>
</section>
</div>
<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>      
</body>
</html>