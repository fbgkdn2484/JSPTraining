<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="job.JobDAO" %>
<%@ page import="job.JobVO" %>
<%@ page import="company.CompanyDAO" %>
<%@ page import="company.CompanyVO" %>
<%@ page import="company.JoinCompanyVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%

	String id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
	System.out.println("아이디 가져오나? : " + id);
	
	int num = 0;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	

	if(id != null)
	{
		JobDAO jobdao = JobDAO.getInstance();
		JobVO jobarticle = jobdao.getArticle(id);
	}
	

	//------------------ 페이지 처리
	int pageSize = 8;
	int number = 0; //현재 페이지의 시작 번호
	String pageNum = null;
	
	pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);   //1			 //2
	int startRow = (currentPage - 1)* pageSize + 1;//(1-1)*10+1=1, (2-1)*10+1=11 
	int endRow = currentPage * pageSize;		   //1*10=10,      2*20=20
	
	//number = count - (currentPage - 1) * pageSize; //12-(1-1)*10=12, 12-(2-1)*10=2	/number 글 번호 / 필요하면 주석 해제
	//------------------
	
	int count = 0; //회사수	
	int count1 = 0; //공고수

	List<CompanyVO> clist = null;
	CompanyDAO cdao = CompanyDAO.getInstance();
	
	List<JobVO> jlist = null;
	JobDAO jdao = JobDAO.getInstance();
	
	count = cdao.getArticleCount();		//회사수
	
	count1 = jdao.getArticleCount();		//공고수
	
    //if(count > 0) {
        // clist = cdao.getArticles(startRow, pageSize); 
         
         List<JoinCompanyVO> jclist = null;
         jclist = cdao.getArticlesJ(startRow, pageSize);
      //}
	
	/*
	String sword = request.getParameter("sword");
	   if (sword==null || sword.equals("")) {
		   
	      count = cdao.getArticleCount();   
	      
	      count1 = jdao.getArticleCount();   
	      
	      if(count > 0) {
	        //  clist = cdao.getArticles(startRow, pageSize); 
	         
	         List<JoinCompanyVO> jclist = null;
	         jclist = cdao.getArticlesJ(startRow, pageSize);
	      }
	      
	   } else {
		   
	      count = cdao.getArticleCount("%"+sword+"%");   //특수기호 인식 못하기 때문에 %%를 붙여서 전달해줌
	      if(count > 0) {
	         clist = cdao.getArticles(startRow, pageSize, "%"+sword+"%");
	      }
	      
	   }
	   */
	   
	   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 소개</title>
<link href="../css/common.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src = "../js/jquery-3.6.3.min.js"></script>
<!-- <span class="star"><a href="https://www.flaticon.com/kr/free-icons/" title="별 아이콘">별 아이콘  제작자: rizky adhitya pradana - Flaticon</a></span> -->

<!-- slider *********************************************************************************************  -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script>
function search_input() {
    if (!document.search_form.sword.value) {
        alert("검색어를 입력하세요");    
        document.login_form.id.focus();
        return;
    }    
    document.search_form.submit();
}
</script>
<script>
  
  $( document ).ready( function() {
    $( '.slider' ).bxSlider( {
	      
	    auto: true, // 자동으로 애니메이션 시작

		speed: 500,  // 애니메이션 속도
	
		pause: 10000,  // 애니메이션 유지 시간 (1000은 1초)
	
		mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
	
		/* autoControls: true, // 시작 및 중지버튼 보여짐 */
	
		pager: false, // 페이지 표시 보여짐
	
		/* captions: true,  */
    } );
  } );

</script>
<!-- slider *********************************************************************************************  -->
</head>
<body>
<header>
  <jsp:include page="../module/header.jsp" flush="false"/>
</header>
<br>
<div id = "wrapper">
<div class="container">
	<section class="section1">
		<%-- <jsp:include page="introList.jsp" flush="false"/> --%>
	    <div class="slider">
		    <div><img src="../img/b1.png" alt=""></div>
		    <div><img src="../img/b2.png" alt=""></div>
		    <div><img src="../img/b1.png" alt=""></div>
		    <div><img src="../img/b2.png" alt=""></div>
		    <div><img src="../img/b1.png" alt=""></div>
	  	</div>
	</section>
</div>
<br><br><br>
<div class="container">
	<section class="notice">
		<h3>공지사항</h3>
		<p>[당첨자 발표]경력 없지만 빠릿빠릿 신입으로 소문 나는 방법</p>
		<div class="arrow">
			<span class="left"></span>
			<span class="right"></span>
		</div>
	</section>
</div>
<br><br>
<div class="container">
	<section class="searchSection">
		<%-- <jsp:include page="introList.jsp" flush="false"/> --%>
	    <div class="search">
	    	<div class="form-group row">
                	 <input type="email" class="form-control sort" id="exampleInputEmail"	name = "search"
                     placeholder="검색">
                	 <input type="email" class="form-control" id="exampleInputEmail"	name = "search"
                     placeholder="검색">
                 	<input type = "button" class="btn btn-primary btn-user btn-block" value = "중복확인" onclick="check_id()">
            </div>
	  	</div>
	</section>
</div>
<br><br>
<div class="container">
	<section class="section2" style = "height: auto; display: block;">
	<!--
		 <div class="search_box">
			 <form name="search_form" method="get" action="booklist.jsp">
				   <input type="text" name="sword" placeholder="Search" />
				   <a href="#"><span onclick="search_input()"><b>검 색</b></span></a>
			 </form>
		 </div>
	  -->
		<ul>
<%
			if(jclist != null){
			for(int i=0; i<jclist.size(); i++) {				//회사 사각형 하나
					JoinCompanyVO Carticle = jclist.get(i);
					/* CompanyVO Jarticle = jlist.get(i); */
					
					num = Carticle.getJob_num();
					
			System.out.println("Carticle.getJob_num() : " + Carticle.getJob_num() );
%> 
			  	
			  
				<li class = "ll"><<a href="#" onclick = "check_Mpass()">
					<img class="logo" src="../compimg/<%=Carticle.getComp_img()%>" alt="상세보기" /></a>
					<h5><%=Carticle.getComp_name()%> (<%=Carticle.getJob_area()%>)</h5>
					<h6>2023 <%=Carticle.getJob_caeer()%>직 이상 인재채용</h6>
					<div class="info">
						<span class="star"><img class="star" src="../img/hstar.png" ></a></span>
						<span class="date">마감일 : <%= sdf.format(Carticle.getJob_edate()) %></span>

						
					</div>
				</a></li>
				
				
				
<% 	}
			}
%>
					
		</ul>
	</section>
</div>
</div>
<footer>
  <jsp:include page="../module/footer.jsp" flush="false"/>
</footer>


<script>

	function View(id) {

	     window.open("../userlogin/memberCheckPass.jsp?id=" + "<%= id %>" + "&" + "<%= num %>",  
	         		 "IDcheck",
	          		 "left=1000,top=500,width=550,height=400,scrollbars=no,resizable=yes");
	     
    }  
	
</script>

</body>
</html>