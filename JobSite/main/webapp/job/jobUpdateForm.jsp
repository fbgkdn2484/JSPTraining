<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="company.CompanyDAO" %>
<%@ page import="company.CompanyVO" %>
<%@ page import="job.JobDAO" %>
<%@ page import="job.JobVO" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.text.SimpleDateFormat" %>

<%

	String id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
	System.out.println("아이디 가져오나? : " + id);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
	
	CompanyDAO mdao1 = CompanyDAO.getInstance();
	CompanyVO article = mdao1.getArticle(id);
	
	JobDAO jdao = JobDAO.getInstance();
	JobVO article1 = jdao.getArticle(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>사용자 회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<script src = "../js/jquery-3.6.3.min.js"></script>
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.css" rel="stylesheet">
    
	<script>
	function check_input()
	   {
		   console.log("완료 버튼을 누르셨습니다.");
	       if (!document.member_form.job_subject.value) {
	          alert("제목 입력하세요!");    
	          document.member_form.job_subject.focus();
	          return;
	      }
	      if (!document.member_form.job_money.value) {
	          alert("급여를 입력하세요!");    
	          document.member_form.job_money.focus();
	          return;
	      }
	      if (!document.member_form.job_caeer.value) {
	          alert("경력구분을 입력하세요!");    
	          document.member_form.job_caeer.focus();
	          return;
	      }
	      if (!document.member_form.job_stu.value) {
	          alert("학력을 입력하세요!");    
	          document.member_form.job_stu.focus();
	          return;
	      }
	      
	      if (!document.member_form.job_empl.value) {
	          alert("근무형태 입력하세요!");    
	          document.member_form.job_empl.focus();
	          return;
	      }
	     
	      if (!document.member_form.job_edate.value || document.member_form.job_edate.value == "연도") {
	          alert("공고 마감일을 입력하세요!");    
	          document.member_form.job_edate.focus();
	          return;
	      }
	      if (!document.member_form.job_up.value) {
	          alert("우대사항을 입력하세요!");    
	          document.member_form.job_up.focus();
	          return;
	      }
	      if (!document.member_form.job_area.value) {
	          alert("근무지역을 입력해주세요!");    
	          document.member_form.job_area.focus();
	          return;
	      }
	      if (!document.member_form.job_cond.value) {
	          alert("근무조건을 입력해주세요!");    
	          document.member_form.job_cond.focus();
	          return;
	      }
	      if (!document.member_form.job_job.value) {
	          alert("담당업무를 입력해주세요!");    
	          document.member_form.job_job.focus();
	          return;
	      }
	
	      document.member_form.submit();
	   }
	
	   function reset_form() {
		   console.log("삭제 버튼을 누르셨습니다.");
	      /* document.member_form.id.value = "";  
	      document.member_form.passwd.value = "";
	      document.member_form.pass_confirm.value = "";
	      document.member_form.name.value = "";
	      document.member_form.id.focus();
	      return; */
	   }
	   
	   function check_id() {

	   }   
	   	   
	   $(document).ready(function(){
		   
		   
		   $("#selectedbox1").val("<%= article1.getJob_caeer()%>").prop("selected", true);
		   $("#selectedbox2").val("<%= article1.getJob_stu()%>").prop("selected", true);
		   $("#selectedbox3").val("<%= article1.getJob_empl()%>").prop("selected", true);
		   $("#selectedbox4").val("<%= article1.getJob_up()%>").prop("selected", true);
		   $("#selectedbox5").val("<%= article1.getJob_area()%>").prop("selected", true);

	   })
	   
	   
	   
	</script>
</head>
<body class="bg-gradient-primary">

    <br><br><br><br>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">공고 수정</h1>
                            </div>
                            <br>
                            	<h4>회사 정보</h4>
                            	<hr>
                            	<br>
                            	<div class="form-group row" style = "background-color:#fbfbfb; padding: 34px 30px 35px; ">
                                    <div class="col-sm-3 mb-3 mb-sm-0">
                                        <img src = "../compimg/<%= article.getComp_img()%>" style="width: 240px; height:180px">
                                    </div>

                                    <div class="col-sm-9">
                                        <h4>회사명 &nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getComp_name()%></h4>
                                        <h6>설립일 &nbsp;&nbsp; : &nbsp;&nbsp; <%= sdf.format(article.getCOMP_DATE())%></h6>
                                        <h6>이메일 &nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getComp_id()%></h6> 
                                        <h6>휴대폰 &nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getCOMP_TEL()%></h6>
                                        <h6>홈페이지 주소 &nbsp; : &nbsp;&nbsp; <%= article.getCOMP_HTTP()%></h6>  
                                        <h6>주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getCOMP_ADDR()%></h6> 
                                        
                                    </div>
                                </div>
                            <br>
                            
                            <form class="user" name="member_form" method="post" enctype="multipart/form-data" action="jobUpdateFormPro.jsp">
	                            	<br>
	                            	<input type="hidden" name="job_id" value="<%=id %>">		<!-- 넘길 것 히든으로 넘기기 ********************************************************** -->
	                            	
	                            	<div class="form-group row">
	                            		 <div class="col-sm-9 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "job_subject" value = "<%= article1.getJob_subject()%>"
		                                            placeholder="공고 제목">
			                             </div>
	                            		 <div class="col-sm-3 mb-3 mb-sm-0">
	                                    	 <input type="file" name = "job_image" value = "<%= article1.getJob_image()%>"
	                                         placeholder="이미지">
	                                     </div>
	                                </div>
	                                <br>
	                                <h4>공고 내용</h4>
	                            	<hr>
	                            	<br>
	                                    <div class="" style = "text-align:center; height: 600px;">										    
	                                        <textarea name="job_content" style = "width: 100%; height: 600px;" ><%= article1.getJob_content()%></textarea>
	                                    </div>
	                                    <br>
		                            	<hr>
		                            	<br>
		                            	<div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4">
		                                    	<label for = "exampleInputEmail">공고 마감일</label>
		                                        <input type="date" class="form-control form-control-user" id="exampleInputEmail"	name = "job_edate" value = ""
	                                         placeholder="">				
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox1">경력 구분</label>
		                                        <select name="job_caeer" class="combo" id=selectedbox1 >
													<option value="" selected disabled hidden>경력 구분</option>
								           			<option value="신입">신입</option>
								           			<option value="경력">경력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox1">학력 구분</label>
		                                        <select name="job_stu" class="combo" id=selectedbox2>
													<option value="" selected disabled hidden>학력 구분</option>
								           			<option value="1">고졸</option>
								           			<option value="2">대졸(2,3년제)이상</option>
								           			<option value="3">대졸(4년제)이상</option>
								           			<option value="4">석사이상</option>
								           			<option value="5">박사이상</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "selectedbox1">연봉</label>
		                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "job_money" value = "<%= article1.getJob_money()%>"
		                                            placeholder="급여(ex)3천만원 이상)">
			                             	</div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox1">근무 형태</label>
		                                        <select name="job_empl" class="combo" id=selectedbox3>
													<option value="" selected disabled hidden>근무 형태</option>
								           			<option value="정규직">정규직</option>
								           			<option value="비정규직">비정규직</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox1">우대사항</label>
		                                        <select name="job_up" class="combo" id=selectedbox4>
													<option value="" selected disabled hidden>우대사항</option>
								           			<option value="1">국가유공자</option>
								           			<option value="2">영어가능자</option>
								           			<option value="3">컴퓨터활용능력 우수</option>
								       			</select>
		                                    </div>
		                                </div>
		                                 <br>
		                            	<div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-2 mb-2 mb-sm-0">
		                                    	<label for = "selectedbox1">모집 인원</label>
		                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "job_head"  value = "<%= article1.getJob_head()%>"
		                                            placeholder="모집 인원">
			                             	</div>
			                             	<div class="col-sm-3">
			                             		<label for = "selectedbox1">근무 지역</label>
		                                        <select name="job_area" class="combo" id=selectedbox5>
													<option value="" selected disabled hidden>근무 지역</option>
								           			<option value="서울">서울</option>
								           			<option value="부산">부산</option>
								           			<option value="대구">대구</option>
								           			<option value="경기">경기</option>
								           			<option value="전남">전남</option>
								           			<option value="충북">충북</option>
								           			<option value="제주">제주</option>
								           			<option value="경기">경기</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-2 mb-sm-0">
		                                    	<label for = "selectedbox1">근무 조건</label>
		                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "job_cond"	value = "<%= article1.getJob_cond()%>"
		                                            placeholder="근무 조건(주 5일 오전 9시 ~ 오후 6시)">
			                             	</div>
		                                    <div class="col-sm-3 mb-2 mb-sm-0">
		                                    	<label for = "selectedbox1">담당 업무</label>
		                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "job_job"	value = "<%= article1.getJob_job()%>"
		                                            placeholder="담당 업무">
			                             	</div>
		                                </div>
	                            	<br>                                
	                                <div class="form-group row">
	                                    <div class="col-sm-4 mb-3 mb-sm-0">
	                                        <input type = "button" class="btn btn-primary btn-user btn-block" value = "수정" onclick="check_input()">
	                                    </div>
	                                    <div class="col-sm-4">
	                                        <input type = "button" class="btn btn-primary btn-user btn-block" value = "삭제" onclick="reset_form()">
	                                    </div>
	                                    <div class="col-sm-4">
	                                        <input type = "button" class="btn btn-primary btn-user btn-block" value = "돌아가기" onclick="location.href='../main/main.jsp'">
	                                    </div>
	                                </div>
                        	</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>
</html>