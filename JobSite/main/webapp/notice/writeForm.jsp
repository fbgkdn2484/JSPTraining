<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개</title>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/board.css" rel="stylesheet" type="text/css">
<script>
  function check_input() {
      if (!document.board_form.subject.value)
      {
          alert("제목을 입력하세요!");
          document.board_form.subject.focus();
          return;
      }
      if (!document.board_form.content.value)
      {
          alert("내용을 입력하세요!");    
          document.board_form.content.focus();
          return;
      }
      /* if (!document.board_form.nimage.value)
      {
          alert("도서 이미지를 입력하세요!");    
          document.board_form.nimage.focus();
          return;
      } */
      document.board_form.submit();
   }
</script>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	Integer rnk = (Integer)session.getAttribute("rnk");;
	if(rnk!=2) {
		response.sendRedirect("../main/main.jsp");	
	} else {
%>
<header>
  <jsp:include page="../module/header.jsp" flush="false"/>
</header>
<section>
  <h2>공지사항 > 글 쓰기</h2>
  <div id="board_box">
  <form  name="board_form" method="post" enctype="multipart/form-data" action="writePro.jsp">
   	 <ul id="board_form">
		<li>
			<span class="col1">&nbsp;&nbsp;작성자</span>
			<span class="col2"><input name="writer" type="text" value="<%=id%>"></span>
		</li>		
   		<li>
   			<span class="col1">&nbsp;&nbsp;제&nbsp;&nbsp;목</span>
   			<span class="col2"><input name="subject" type="text"></span>
   		</li>	    	
   		<li id="text_area">	
   			<span class="col1">&nbsp;&nbsp;내&nbsp;&nbsp;용</span>
   			<span class="col2">
   				<textarea name="content"></textarea>
   			</span>
   		</li>
   		<li>
		     <span class="col1">&nbsp;&nbsp;공지사항 이미지</span>
		     <span class="col2"><input type="file" name="nimage"></span>
		</li>
    </ul>
   	<ul class="buttons">
		<li><button type="button" onclick="check_input()">완료</button></li>
		<li><button type="button" onclick="location.href='list.jsp'">목록</button></li>
	</ul>
  </form>
  </div>
</section>
<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>
<% } %>
</body>
</html>