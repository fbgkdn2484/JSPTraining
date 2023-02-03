<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	$(".comp").on("click", function(){
		  alert("문장이 클릭되었습니다."); 
	});
	
</script>
</head>
<body>
  <div id="top">
	<h3><a href="../main/main.jsp">JobSite</a></h3>
	<ul id="topmenu">
<%
	String id = "";
	int rnk = -1;
	try {
		id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
		System.out.println("---header id : " + id);
		
		
		if (id==null || id.equals("")) { 		 /* 로그인이 되어 있는지 아닌지를 판별  */
%>
			<!-- <li><a href="../login/loginForm.jsp">로그인</a></li>	 -->
			<div class="dropdown">
		      <button class="dropbtn"> 
		        로그인
		      </button>
		      <div class="dropdown-content">
		        <a href="../userlogin/loginForm.jsp">개인 로그인</a>
		        <a href="../complogin/loginForm.jsp">기업 로그인</a>
		      </div>
		    </div>
	        <li> &nbsp&nbsp | &nbsp&nbsp</li>
	        <div class="dropdown">
		      <button class="dropbtn"> 
		        회원가입
		      </button>
		      <div class="dropdown-content">
		        <a href="../userlogin/userRegisterForm.jsp">개인 회원가입</a>
		        <a href="../complogin/compRegisterForm.jsp">기업 회원가입</a>
		      </div>
		    </div>
<%		
		} else {
%>
			
	        
<%			rnk = (Integer) session.getAttribute("rnk");	/* 세션에서 값을 가져옴 */
			System.out.println("---header rnk : " + rnk);

			if(rnk == 0)		//개인 회원
			{
%>
				<li><%=id %> 님</li>
				<li> &nbsp&nbsp | &nbsp&nbsp</li>
				<li><a href="../userlogin/logoutPro.jsp">로그 아웃</a></li>
				
		        <li> &nbsp&nbsp | &nbsp&nbsp</li>
		        <li><a href="#" onclick = "check_Mpass()">정보 수정</a></li>	
		        <!-- <li><a href="../userlogin/memberupdateForm.jsp">정보 수정</a></li>	 -->
        		<li> &nbsp&nbsp | &nbsp&nbsp</li>
        		
        		<div class="dropdown">
			      <button class="dropbtn"> 
			        사용자 관리
			      </button>
			      <div class="dropdown-content">
			        <a href="../user/userForm.jsp">이력서 등록</a>
			        <a href="../user/userUpdateForm.jsp">이력서 관리</a>
			        <li><hr class="dropdown-divider" /></li>
			        <a href="#">지원 내역</a>
			        <a href="#">받은 제안</a>
			      </div>
			    </div>
<%	        	
        	}
        	else if(rnk == 1)		//기업 회원
        	{
%>        		

				<li><%=id %> 님</li>
				<li> &nbsp&nbsp | &nbsp&nbsp</li>
				<li><a href="../complogin/logoutPro.jsp">로그 아웃</a></li>
		        <li> &nbsp&nbsp | &nbsp&nbsp</li>
		        
		        <li><a href="#"  onclick = "check_Cpass()">정보 수정</a></li>	
        		<li> &nbsp&nbsp | &nbsp&nbsp</li>
        		<div class="dropdown">
			      <button class="dropbtn"> 
			        기업 관리
			      </button>
			      <div class="dropdown-content">
			        <a href="../job/jobForm.jsp">공고 등록</a>
			        <a href="../job/jobUpdateForm.jsp">공고 관리</a>
			        <li><hr class="dropdown-divider" /></li>
			        <a href="#">지원자 관리</a>
			        <a href="#">기업 정보 수정</a>
			      </div>
			    </div>
<%        	
        	}
        	else if(rnk == 2)		//관리자
        	{
%>        	
				<li> &nbsp&nbsp | &nbsp&nbsp</li>
        		<div class="dropdown">
			      <button class="dropbtn"> 
			      	사이트 관리
			      </button>
			      <div class="dropdown-content">
			        <a href="#">공고 관리</a>
			        <a href="../freeboard/list.jsp">게시판 관리</a>
			        <a href="../freeboard/list.jsp">회원 관리</a>
			        <li><hr class="dropdown-divider" /></li>
			        <a href="#">공지사항 등록</a>
			        <a href="../notice/list.jsp">공지사항 관리</a>
			      </div>
			    </div>
<%
        	}
%> 	        

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
      <li><a href="../book/booklist.jsp">공고 검색</a></li>
      <li><a href="../freeboard/list.jsp">자유게시판</a></li>
      <li><a href="#">Q & A</a></li>
      <li><a href="#" >사이트맵</a></li>
    </ul>
  </nav>
  <script>

	function check_Mpass(id) {

	     window.open("../userlogin/memberCheckPass.jsp?id=" + "<%= id %>",  
	         		 "IDcheck",
	          		 "left=1000,top=500,width=550,height=400,scrollbars=no,resizable=yes");
	     
    }  
	
	function check_Cpass() {

	     window.open("../complogin/memberCheckPass.jsp?id=" + "<%= id %>", 
	         		 "IDcheck",
	          		 "left=1000,top=500,width=550,height=400,scrollbars=no,resizable=yes");
	     
   }  
	
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	
	$("#requestBtn").on("click", function(){
		  alert("문장이 클릭되었습니다.");
	});
	

	$(function() {

	    $("#requestBtn").on("click", function() {

	        $.ajax("../complogin/memberCheckPass.jsp")

	        .done(function() {

	            alert("요청 성공");

	        })

	        .fail(function() {

	            alert("요청 실패");

	        })

	        .always(function() {

	            alert("요청 완료");

	        });

	    });

	});
	
</script>
</body>

</html>