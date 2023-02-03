<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="members.MembersDAO" %>
<%@ page import="members.MembersVO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.text.SimpleDateFormat" %>

<%

	String id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
	//System.out.println("ididid : " + id);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
	MembersDAO mdao1 = MembersDAO.getInstance();
	MembersVO article = mdao1.getArticle(id);

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
	      /* if (!document.member_form.id.value) {
	          alert("아이디를 입력하세요!");    
	          document.member_form.id.focus();
	          return;
	      }
	      */
	
	      document.member_form.submit();
	   }
	
	   function reset_form() {
		   console.log("취소 버튼을 누르셨습니다.");
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
		   /* alert("test"); */
		   
			$('#middle').hide();
		    $('#high').hide();	   
		   
		    $('#uni2').hide();
		    $('#uni3').hide();
		    
		    $('#car').hide();
		    
		    $('#lic2').hide();
		    $('#lic3').hide();
		    
		   	
		    
		  //###################################	학력사항 버튼 컨트롤
		  
		    $("input:button[name=unibtn_1]").click(function(){	//첫번째 추가버튼 클릭
		    	
		    	$('#uni2').show();
			    $('.unibtn_1').hide();
		   
		    });
		   
		    $("input:button[name=unibtn_2_add]").click(function(){	//두번째 추가버튼 클릭
		    	
		    	$('#uni3').show();
			    $('.unibtn_2').hide();
		   
		    });
		   
 			$("input:button[name=unibtn_2_del]").click(function(){	//두번째 삭제버튼 클릭

		    	$('#uni2').hide();
		    	$(".input_uni_class2 option:eq(0)").prop("selected", true);
	        	$(".input_uni_class2").prop('checked',false);
	        	$('.input_uni_class2').val('');
 			
	        	$('.unibtn_1').show();
		   
		    });
 			
 			$("input:button[name=unibtn_3]").click(function(){	//세번째 삭제버튼 클릭

		    	$('#uni3').hide();
		    	$(".input_uni_class3 option:eq(0)").prop("selected", true);
	        	$(".input_uni_class3").prop('checked',false);
	        	$('.input_uni_class3').val('');
 			
	        	$('.unibtn_2').show();
		   
		    });

 			//###################################
 			
 			
 			//###################################	경력사항 버튼 컨트롤
 			
 			$("input:button[name=carbtn_1]").click(function(){	//첫번째 추가버튼 클릭
		    	
		    	$('#car2').show();
			    $('.carbtn_1').hide();
		   
		    });
		   
		    $("input:button[name=carbtn_2_add]").click(function(){	//두번째 추가버튼 클릭
		    	
		    	$('#car3').show();
			    $('.carbtn_2').hide();
		   
		    });
		   
 			$("input:button[name=carbtn_2_del]").click(function(){	//두번째 삭제버튼 클릭

		    	$('#car2').hide();
		    	$(".input_car2 option:eq(0)").prop("selected", true);
	        	$(".input_car2").prop('checked',false);
	        	$('.input_car2').val('');
 			
	        	$('.carbtn_1').show();
		   
		    });
 			
			$("input:button[name=carbtn_3_add]").click(function(){	//세번째 추가버튼 클릭
		    	
				$('#car4').show();
			    $('.carbtn_3').hide();
		   
		    });
		   
 			$("input:button[name=carbtn_3_del]").click(function(){	//세번째 삭제버튼 클릭

		    	$('#car3').hide();
		    	$(".input_car3 option:eq(0)").prop("selected", true);
	        	$(".input_car3").prop('checked',false);
	        	$('.input_car3').val('');
 			
	        	$('.carbtn_2').show();
		   
		    });
 			
 			$("input:button[name=carbtn_4_del]").click(function(){	//네번째 삭제버튼 클릭

 				$('#car4').hide();
		    	$(".input_car4 option:eq(0)").prop("selected", true);
	        	$(".input_car4").prop('checked',false);
	        	$('.input_car4').val('');
 			
	        	$('.carbtn_3').show();
		   
		    });
 			
 			//###################################
 			
 			//################################### 경력 사항 버튼 컨트롤
 			
			$("input:button[name=li_1]").click(function(){	//첫번째 추가버튼 클릭
		    	
		    	$('#lic2').show();
			    $('.li_1').hide();
		   
		    });
		   
		    $("input:button[name=li_2_add]").click(function(){	//두번째 추가버튼 클릭
		    	
		    	$('#lic3').show();
			    $('.li_2').hide();
		   
		    });
		   
 			$("input:button[name=li_2_del]").click(function(){	//두번째 삭제버튼 클릭

		    	$('#lic2').hide();
		    	$(".input_li2 option:eq(0)").prop("selected", true);
	        	$(".input_li2").prop('checked',false);
	        	$('.input_li2').val('');
 			
	        	$('.li_1').show();
		   
		    });
 			
 			$("input:button[name=li_3]").click(function(){	//세번째 삭제버튼 클릭

		    	$('#lic3').hide();
		    	$(".input_li3 option:eq(0)").prop("selected", true);
	        	$(".input_li3").prop('checked',false);
	        	$('.input_li3').val('');
 			
	        	$('.li_2').show();
		   
		    });
 			
		 	//###################################
			
			//편입 체크 버튼 클릭시 동작
		    $("input:checkbox[name=user_high_GED]").click(function(){
		    
			   if($("input:checkbox[name='user_high_GED']").is(":checked") == true){

		       		$('#GED_bot').hide();
		       		$(".high_bot option:eq(0)").prop("selected", true);
		        	$(".high_bot").prop('checked',false);
		        	$('.high_bot').val('');
		       		
		   	   }
			   
			   else{
				   $('#GED_bot').show();
			   }
		   
		    });
		    
			// 라디오버튼 클릭시 이벤트 발생
		    $("input:radio[name=user_stu]").click(function(){
		 
		        if($("input[name=user_stu]:checked").val() == "300"){
		        	
		        	$('#uni').show();
		        	
		        	$('#middle').hide();
		        	$(".input_middle_class option:eq(0)").prop("selected", true);
		        	$('.input_middle_class').val('');
		        	
		        	
		        	$('#high').hide();
		        	$(".input_high_class option:eq(0)").prop("selected", true);
		        	$(".input_high_class").prop('checked',false);
		        	$('.input_high_class').val('');

		            
		        }else if($("input[name=user_stu]:checked").val() == "200"){
		        	      		
		        	
		        	$('#high').show();

		        	
		        	$('#uni').hide();
		        	$(".input_uni_class option:eq(0)").prop("selected", true);
		        	$(".input_uni_class").prop('checked',false);
		        	$('.input_uni_class').val('');
		        	
		        	$('#middle').hide();
		        	$(".input_middle_class option:eq(0)").prop("selected", true);
		        	$('.input_middle_class').val('');
		        	

		        }else if($("input[name=user_stu]:checked").val() == "100"){

		        	$('#middle').show();
		        	
		        	$('#uni').hide();
		        	$(".input_uni_class option:eq(0)").prop("selected", true);
		        	$(".input_uni_class").prop('checked',false);
		        	$('.input_uni_class').val('');
		        	
		        	
		        	$('#high').hide();
		        	$(".input_middle_class option:eq(0)").prop("selected", true);
		        	$('.input_middle_class').val('');
			    }
		    });
		   
		    $("input:radio[name=user_caeer]").click(function(){
				 
		        if($("input[name=user_caeer]:checked").val() == "100"){

		        	$('#car').hide();
		        	$(".input_car option:eq(0)").prop("selected", true);
		        	$(".input_car").prop('checked',false);
		        	$('.input_car').val('');
		        	

		        }else if($("input[name=user_caeer]:checked").val() == "200"){
		        	
		        	$('#car').show();
		        	$('#car2').hide();
		        	$('#car3').hide();
		        	$('#car4').hide();

		        }
		    });
		    
		    
		    $("#mil_type").change(function(){ //엑스 클릭시 상세 내역 슬라이드 업
		    	
		    	if($("#mil_type option:selected").val() == "군필"){

		    		$(".mil").removeAttr("disabled");s
		        }
		    	else{
		    		
		    		 $(".mil").attr("disabled","true");
		    	}

		    });
		    
		    
		    
		    
		    
		});
	   

	   
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
                                <h1 class="h4 text-gray-900 mb-4">이력서</h1>
                            </div>
                            <br>
                            	<h4>기본정보</h4>
                            	<hr>
                            	<br>
                            	<div class="form-group row" style = "background-color:#fbfbfb; padding: 34px 30px 35px; ">
                            		
                                    <div class="col-sm-3 mb-3 mb-sm-0">
                                        <img src = "../userimg/<%= article.getImg()%>" style = "width 50px;">
                                    </div>
                                    <div class="col-sm-9">
                                    	<br>
                                        <h4><%= article.getName()%></h6>
                                        <%= sdf.format(article.getBirth())%>
                                        <br><br>
                                        <h6>이메일 &nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getId()%></h6> 
                                        <br>
                                        <h6>휴대폰 &nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getTel()%></h6> 
                                        <br>
                                        <h6>주소 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp; <%= article.getAddr()%></h6> 
                                    </div>
                                </div>
                            <br>
                            <form class="user" name="member_form" method="post" action="userFormPro.jsp">
                            	<h4>병역사항</h4>
                            	<hr>
                            	<br>
                            	<input type="hidden" name="user_id" value="<%=id %>">		<!-- 넘길 것 히든으로 넘기기 ********************************************************** -->
                            	<div class="form-group row">
                            		 <div class="col-sm-2 mb-3 mb-sm-0">
	                            		 <select name="user_sex" class="combo" id=selectedbox>
												<option value="" selected disabled hidden>성별</option>
							           			<option value="남">남</option>
							           			<option value="여">여</option>
							       		 </select>
                                     </div>
                                     <div class="col-sm-4 mb-3 mb-sm-0">
	                            		 <select name="user_mil_mil" class="combo mil_type" id=mil_type >
												<option value="" selected disabled hidden >병역 구분</option>
							           			<option value="해당사항없음">해당사항없음</option>
							           			<option value="면제">면제</option>
							           			<option value="군필">군필</option>
							           			<option value="미필">미필</option>
							           			
							       		 </select>
                                     </div>
                                     <div class="col-sm-3 mb-3 mb-sm-0">
	                            		 <select name="user_mil_type" class="combo mil" id=mil disabled>
												<option value="" selected disabled hidden>병역 군별</option>
							           			<option value="육군">육군</option>
							           			<option value="해군">해군</option>
							           			<option value="공군">공군</option>
							       		 </select>
                                     </div>
                                     <div class="col-sm-3 mb-3 mb-sm-0">
	                            		 <select name="user_mil_rnk" class="combo mil" id=mil disabled>
												<option value="" selected disabled hidden>병역 계급</option>
							           			<option value="병장">병장</option>
							           			<option value="하사">하사</option>
							           			<option value="중사">중사</option>
							           			<option value="상사">상사</option>
							           			<option value="소위">소위</option>
							           			<option value="중위">중위</option>
							           			<option value="대위">대위</option>
							       		 </select>
                                     </div>
                                </div>
                                <br><br>
                                <h4>학력 사항</h4>
                            	<br>
	                                <div class="form-group row" >
	                                    <div class="col-sm-12 mb-3 mb-sm-0" style = "text-align:center;">										    
	                                        <label class="test_obj">
											    <input type="radio" name="user_stu" value="100">
											    <span>중학교 졸업</span>
											</label>
											 
											<label class="test_obj">
											    <input type="radio" name="user_stu" value="200">
											    <span>고등학교 졸업</span>
											</label>
											 
											<label class="test_obj">
											    <input type="radio" name="user_stu" value="300" id = "uni_radio" checked>
											    <span>대학·대학원 이상 졸업</span>
											</label>
											
	                                    </div>
	                                </div>
	                            	<div id = "middle">
	                            		<br>
	                                	<hr>
	                            		<h5>중학교 정보 입력</h5>
	                            		<br>
	                            		<div class="form-group row">
		                                    <div class="col-sm-6 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_middle_class" id="input_middle"	name = "user_mid_name"
		                                            placeholder="중학교 명">
		                                    </div>
		                                    <div class="col-sm-6">
		                                        <select name="user_mid_area" class="combo input_middle_class" id=input_middle1>
													<option value="" selected disabled hidden>지역 선택</option>
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
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-5 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입학 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_middle_class" id="input_middle"	name = "user_mid_sdate"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<label for = "exampleInputEmail">졸업 연도</label>
		                                        <input type="date" class="form-control form-control-user input_middle_class" id="input_middle"	name = "user_mid_edate"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-2">
		                                    	<label for = "selectedbox">&nbsp;&nbsp;</label>
		                                        <select name="user_mid_grad" class="combo input_middle_class" id=input_middle2>
													<option value="" selected disabled hidden>졸업 여부</option>
								           			<option value="졸업">졸업</option>
								           			<option value="중퇴">중퇴</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
	                            	</div>
	                            	<div id = "high">
	                            	<br>
	                                <hr>
	                            		<h5>고등학교 정보 입력</h5>
	                            		<br>
	                            		 <div class="form-group row" style = "background-color : #f5f5f5; padding : 20px;" id = "GED_top">
	                                	 	<div class="col-sm-1 mb-1 mb-sm-0" style = "padding-top: 30px;">
		                                    	<label>&nbsp;&nbsp;</label>
		                                    </div>
		                                    <div class="col-sm-4 mb-1 mb-sm-0" style = "padding-top: 30px;">
		                                    	<label>&nbsp;&nbsp;</label>
		                                    	<input type="checkbox" class="form-control form-control-user input_high_class" id="user_high_GED" name="user_high_GED" 
		                                    	style = "width:100px; display: inline-block; vertical-align: middle;" /><span class = "font">대입 검정고시</span> 
		                                    	<!-- <label for = "check">대입 검정고시</label> -->
	<!-- 	                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "user_high_name"
		                                            placeholder="고등학교 명"> -->
		                                    </div>
		                                    <div class="col-sm-6">
			                                    	<label for = "exampleInputEmail">합격 연도</label>
			                                       	<input type="date" class="form-control form-control-user input_high_class" id="exampleInputEmail"	name = "user_high_Gdate"
		                                         placeholder="">
		                                    </div>
	                                	</div>
	                                	 <br>
	                                	<div id = "GED_bot">
		                            		<div class="form-group row" >
			                                    <div class="col-sm-4 mb-3 mb-sm-0">
			                                        <input type="text" class="form-control form-control-user input_high_class high_bot" id="exampleFirstName"	name = "user_high_name"
			                                            placeholder="고등학교 명">
			                                    </div>
			                                    <div class="col-sm-4">
			                                        <select name="user_high_area" class="combo input_high_class high_bot" id=selectedbox>
														<option value="" selected disabled hidden>지역 선택</option>
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
			                                    <div class="col-sm-4">
			                                        <select name="user_high_major" class="combo input_high_class high_bot" id=selectedbox>
														<option value="" selected disabled hidden>전공 선택</option>
									           			<option value="문과">문과</option>
									           			<option value="이과">이과</option>
									           			<option value="예체능">예체능</option>
									       			</select>
			                                    </div>
		                                	</div>
		                                	 <br>
		                                	 <br>
				                                <div class="form-group row" id = "datelabel">
				                                    <div class="col-sm-4 mb-3 mb-sm-0">
				                                    	<label for = "exampleInputEmail">입학 연도</label>
				                                       	<input type="date" class="form-control form-control-user input_high_class high_bot" id="exampleInputEmail"	name = "user_high_sdate"
			                                         placeholder="">
				                                    </div>
				                                    <div class="col-sm-4">
				                                    	<label for = "exampleInputEmail">졸업 연도</label>
				                                        <input type="date" class="form-control form-control-user input_high_class high_bot" id="exampleInputEmail"	name = "user_high_edate"
			                                         placeholder="">
				                                    </div>
				                                    <div class="col-sm-2 mb-1 mb-sm-0" style = "padding-top: 40px;">
				                                    	<label>&nbsp;&nbsp;</label>
				                                    	<input type="checkbox" class="form-control form-control-user input_high_class high_bot" id="check" name="user_high_trans" 
				                                    	style = "width:100px; display: inline-block; vertical-align: middle;" /><span class = "font">편입</span>
			                                    	</div>
				                                    <div class="col-sm-2">
				                                    	<label for = "selectedbox">&nbsp;&nbsp;</label>
				                                        <select name="user_high_grad" class="combo input_high_class high_bot" id=selectedbox>
															<option value="" selected disabled hidden>졸업 여부</option>
										           			<option value="졸업">졸업</option>
										           			<option value="중퇴">중퇴</option>
										       			</select>
				                                    </div>
				                                </div>
			                             </div>
	                                	 <hr>
	                                	 <br>
	                                </div> 

	                                <div id = "uni">
	                                <br>
	                                <hr>
	                                	<div id = "uni1">
	                            		<h5>대학·대학원 정보 입력</h5>
	                            		<br>
		                            		<div class="form-group row">
		                            			<div class="col-sm-4">
			                                        <select name="user_univ_type1" class="combo input_uni_class" id=selectedbox>
														<option value="" selected disabled hidden>대학 구분</option>
									           			<option value="10">대학(2,3년)</option>
									           			<option value="11">대학교(4년)</option>
									           			<option value="12">대학원(석사)</option>
									           			<option value="13">대학원(박사)</option>
									       			</select>
			                                    </div>
			                                    <div class="col-sm-4 mb-3 mb-sm-0">
			                                        <input type="text" class="form-control form-control-user input_uni_class" id="exampleFirstName"	name = "user_univ_name1"
			                                            placeholder="대학·대학교 명">
			                                    </div>
			                                    <div class="col-sm-4">
			                                        <select name="user_univ_area1" class="combo input_uni_class" id=selectedbox>
														<option value="" selected disabled hidden>지역 선택</option>
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
		                                	</div>
		                                	 <br>
			                                <div class="form-group row" id = "datelabel">
			                                    <div class="col-sm-5 mb-3 mb-sm-0">
			                                    	<label for = "exampleInputEmail">입학 연도</label>
			                                       	<input type="date" class="form-control form-control-user input_uni_class" id="exampleInputEmail"	name = "user_univ_sdate1"
		                                         placeholder="">
			                                    </div>
			                                    <div class="col-sm-5">
			                                    	<label for = "exampleInputEmail">졸업 연도</label>
			                                        <input type="date" class="form-control form-control-user input_uni_class" id="exampleInputEmail"	name = "user_univ_edate1"
		                                         placeholder="">
			                                    </div>
			                                    <div class="col-sm-2">
			                                    	<label for = "selectedbox">&nbsp;&nbsp;</label>
			                                        <select name="user_univ_grad1" class="combo input_uni_class" id=selectedbox>
														<option value="" selected disabled hidden>졸업 여부</option>
									           			<option value="졸업">졸업</option>
									           			<option value="중퇴">중퇴</option>
									       			</select>
			                                    </div>
			                                </div>
			                                <br>
			                                <div class="form-group row" id = "datelabel">
			                                    <div class="col-sm-5">
			                                        <select name="user_univ_major1" class="combo input_uni_class" id=selectedbox>
														<option value="" selected disabled hidden>전공</option>
									           			<option value="1">영어/영문</option>
									           			<option value="2">중어/중문</option>
									           			<option value="3">일어/일문</option>
									           			<option value="4">인문과학</option>
									           			<option value="5">사회과학</option>
									           			<option value="6">상경계열</option>
									           			<option value="7">회계학</option>
									           			<option value="8">법학계열</option>
									           			<option value="9">종교학</option>
									           			<option value="10">예체능</option>
									           			<option value="11">자연과학계열</option>
									           			<option value="12">농수산/해양/축산</option>
									           			<option value="13">수학/통계학</option>
									           			<option value="14">물리/천문/기상학</option>
									           			<option value="15">화학</option>
									           			<option value="16">공학계열</option>
									           			<option value="17">컴퓨터/시스템공학</option>
									           			<option value="18">생명</option>
									           			<option value="19">에너지/원자력공학</option>
									           			<option value="20">기계/조선</option>
									           			<option value="21">의학계열</option>
									           			<option value="22">식품/유전/안전공학</option>
									           			<option value="23">직접입력</option>
									       			</select>
			                                    </div>
			                                    <div class="col-sm-4 mb-2 mb-sm-0">
			                                        <input type="text" class="form-control form-control-user input_uni_class" id="exampleFirstName"	name = "user_univ_cdit1"
			                                            placeholder="학점입력(4.5기준)">
			                                    </div>
			                                    <div class="col-sm-3">
			                                        <select name="user_univ_nm1" class="combo input_uni_class" id=selectedbox>
			                                        	<option value="" selected disabled hidden>주/야간</option>
									           			<option value="주간">주간</option>
									           			<option value="야간">야간</option>
									       			</select>
			                                    </div>   
			                                </div>
			                                <br>
			                                <hr>
			                                <div class="form-group row">
			                            		<div class="col-sm-10 mb-3 mb-sm-0">
			                                    </div>
			                                    <div class="col-sm-2 mb-3 mb-sm-0">
			                                        <input type = "button" class="btn btn-primary btn-user btn-block unibtn_1" name = "unibtn_1" value = "추가" >
			                                    </div>
			                                </div>
			                                <br>
		                            	</div>
		                            	
	                            		<div id = "uni2">
	                            		<h5>대학·대학원 정보 입력</h5>
	                            		<br>
		                            		<div class="form-group row">
		                            			<div class="col-sm-4">
			                                        <select name="user_univ_type2" class="combo input_uni_class input_uni_class2" id=selectedbox>
														<option value="" selected disabled hidden>대학 구분</option>
									           			<option value="10">대학(2,3년)</option>
									           			<option value="11">대학교(4년)</option>
									           			<option value="12">대학원(석사)</option>
									           			<option value="13">대학원(박사)</option>
									       			</select>
			                                    </div>
			                                    <div class="col-sm-4 mb-3 mb-sm-0">
			                                        <input type="text" class="form-control form-control-user input_uni_class input_uni_class2" id="exampleFirstName"	name = "user_univ_name2"
			                                            placeholder="대학·대학교 명">
			                                    </div>
			                                    <div class="col-sm-4">
			                                        <select name="user_univ_area2" class="combo input_uni_class input_uni_class2" id=selectedbox>
														<option value="" selected disabled hidden>지역 선택</option>
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
		                                	</div>
		                                	 <br>
			                                <div class="form-group row" id = "datelabel">
			                                    <div class="col-sm-5 mb-3 mb-sm-0">
			                                    	<label for = "exampleInputEmail">입학 연도</label>
			                                       	<input type="date" class="form-control form-control-user input_uni_class input_uni_class2" id="exampleInputEmail"	name = "user_univ_sdate2"
		                                         placeholder="">
			                                    </div>
			                                    <div class="col-sm-5">
			                                    	<label for = "exampleInputEmail">졸업 연도</label>
			                                        <input type="date" class="form-control form-control-user input_uni_class input_uni_class2" id="exampleInputEmail"	name = "user_univ_edate2"
		                                         placeholder="">
			                                    </div>
			                                    <div class="col-sm-2">
			                                    	<label for = "selectedbox">&nbsp;&nbsp;</label>
			                                        <select name="user_univ_grad2" class="combo input_uni_class input_uni_class2" id=selectedbox>
														<option value="" selected disabled hidden>졸업 여부</option>
									           			<option value="졸업">졸업</option>
									           			<option value="중퇴">중퇴</option>
									       			</select>
			                                    </div>
			                                </div>
			                                <br>
			                                <div class="form-group row" id = "datelabel">
			                                    <div class="col-sm-5">
			                                        <select name="user_univ_major2" class="combo input_uni_class input_uni_class2" id=selectedbox>
														<option value="" selected disabled hidden>전공</option>
									           			<option value="1">영어/영문</option>
									           			<option value="2">중어/중문</option>
									           			<option value="3">일어/일문</option>
									           			<option value="4">인문과학</option>
									           			<option value="5">사회과학</option>
									           			<option value="6">상경계열</option>
									           			<option value="7">회계학</option>
									           			<option value="8">법학계열</option>
									           			<option value="9">종교학</option>
									           			<option value="10">예체능</option>
									           			<option value="11">자연과학계열</option>
									           			<option value="12">농수산/해양/축산</option>
									           			<option value="13">수학/통계학</option>
									           			<option value="14">물리/천문/기상학</option>
									           			<option value="15">화학</option>
									           			<option value="16">공학계열</option>
									           			<option value="17">컴퓨터/시스템공학</option>
									           			<option value="18">생명</option>
									           			<option value="19">에너지/원자력공학</option>
									           			<option value="20">기계/조선</option>
									           			<option value="21">의학계열</option>
									           			<option value="22">식품/유전/안전공학</option>
									           			<option value="23">직접입력</option>
									       			</select>
			                                    </div>
			                                    <div class="col-sm-4 mb-2 mb-sm-0">
			                                        <input type="text" class="form-control form-control-user input_uni_class input_uni_class2" id="exampleFirstName"	name = "user_univ_cdit2"
			                                            placeholder="학점입력(4.5기준)">
			                                    </div>
			                                    <div class="col-sm-3">
			                                        <select name="user_univ_nm2" class="combo input_uni_class input_uni_class2" id=selectedbox>
			                                        	<option value="" selected disabled hidden>주/야간</option>
									           			<option value="주간">주간</option>
									           			<option value="야간">야간</option>
									       			</select>
			                                    </div>   
			                                </div>
			                                <br>
			                                <hr>
			                                <div class="form-group row">
			                            		<div class="col-sm-8 mb-3 mb-sm-0">
			                                    </div>
			                                    <div class="col-sm-2 mb-3 mb-sm-0">
			                                        <input type = "button" class="btn btn-primary btn-user btn-block unibtn_2" name = "unibtn_2_add" value = "추가" >
			                                    </div>
			                                    <div class="col-sm-2">
			                                        <input type = "button" class="btn btn-primary btn-user btn-block unibtn_2" name = "unibtn_2_del" value = "삭제" >
			                                    </div>
			                                </div>
			                                
                            			<br>
		                            	</div>

                            		<div id = "uni3">
                            		<h5>대학·대학원 정보 입력</h5>
                            		<br>
	                            		<div class="form-group row">
	                            			<div class="col-sm-4">
		                                        <select name="user_univ_type3" class="combo input_uni_class input_uni_class3" id=selectedbox>
													<option value="" selected disabled hidden>대학 구분</option>
								           			<option value="10">대학(2,3년)</option>
								           			<option value="11">대학교(4년)</option>
								           			<option value="12">대학원(석사)</option>
								           			<option value="13">대학원(박사)</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_uni_class input_uni_class3" id="exampleFirstName"	name = "user_univ_name3"
		                                            placeholder="대학·대학교 명">
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <select name="user_univ_area3" class="combo input_uni_class input_uni_class3" id=selectedbox>
													<option value="" selected disabled hidden>지역 선택</option>
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
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-5 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입학 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_uni_class input_uni_class3" id="exampleInputEmail"	name = "user_univ_sdate3"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<label for = "exampleInputEmail">졸업 연도</label>
		                                        <input type="date" class="form-control form-control-user input_uni_class input_uni_class3" id="exampleInputEmail"	name = "user_univ_edate3"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-2">
		                                    	<label for = "selectedbox">&nbsp;&nbsp;</label>
		                                        <select name="user_univ_grad3" class="combo input_uni_class input_uni_class3" id=selectedbox>
													<option value="" selected disabled hidden >졸업 여부</option>
								           			<option value="졸업">졸업</option>
								           			<option value="중퇴">중퇴</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-5">
		                                        <select name="user_univ_major3" class="combo input_uni_class input_uni_class3" id=selectedbox>
													<option value="" selected disabled hidden>전공</option>
								           			<option value="1">영어/영문</option>
								           			<option value="2">중어/중문</option>
								           			<option value="3">일어/일문</option>
								           			<option value="4">인문과학</option>
								           			<option value="5">사회과학</option>
								           			<option value="6">상경계열</option>
								           			<option value="7">회계학</option>
								           			<option value="8">법학계열</option>
								           			<option value="9">종교학</option>
								           			<option value="10">예체능</option>
								           			<option value="11">자연과학계열</option>
								           			<option value="12">농수산/해양/축산</option>
								           			<option value="13">수학/통계학</option>
								           			<option value="14">물리/천문/기상학</option>
								           			<option value="15">화학</option>
								           			<option value="16">공학계열</option>
								           			<option value="17">컴퓨터/시스템공학</option>
								           			<option value="18">생명</option>
								           			<option value="19">에너지/원자력공학</option>
								           			<option value="20">기계/조선</option>
								           			<option value="21">의학계열</option>
								           			<option value="22">식품/유전/안전공학</option>
								           			<option value="23">직접입력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-2 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_uni_class input_uni_class3" id="exampleFirstName"	name = "user_univ_cdit3"
		                                            placeholder="학점입력(4.5기준)">
		                                    </div>
		                                    <div class="col-sm-3">
		                                        <select name="user_univ_nm3" class="combo input_uni_class input_uni_class3"  id=selectedbox>
		                                        	<option value="" selected disabled hidden>주/야간</option>
								           			<option value="주간">주간</option>
								           			<option value="야간">야간</option>
								       			</select>
		                                    </div>   
		                                </div>
		                                <br>
		                                <hr>
		                                <div class="form-group row">
		                            		<div class="col-sm-10 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block unibtn_3" name = "unibtn_3" value = "삭제" >
		                                    </div>
		                                </div>
	                            	</div>
                            	</div>
                                <h4>경력 사항</h4>
                            	<hr>
                            	<br>
                            	<div class="form-group row" id = "car_sel" >
                                    <div class="col-sm-12 mb-3 mb-sm-0" style = "text-align:center;">										    
                                        <label class="test_obj">
										    <input type="radio" name="user_caeer" value="100" checked>
										    <span>신입</span>
										</label>
										 
										<label class="test_obj">
										    <input type="radio" name="user_caeer" value="200">
										    <span>경력</span>
										</label>									
                                    </div>
                                </div>
                            	<hr>
                            	<div id = "car">
                                	<div id = "car1">
                            		<h5>경력사항 입력1</h5>
                            		<br>
	                            		<div class="form-group row">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car1" id="exampleFirstName"	name = "user_caeer_name1"
		                                            placeholder="회사 명">
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_area1" class="combo input_car input_car1" id=selectedbox>
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
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_leave1" class="combo input_car input_car1" id=selectedbox>
													<option value="" selected disabled hidden>퇴사사유</option>
								           			<option value="20">계약만료</option>
								           			<option value="21">경영악화</option>
								           			<option value="22">근무조건</option>
								           			<option value="23">출산/육아</option>
								           			<option value="24">학업</option>
								           			<option value="25">개인사정</option>
								           			<option value="26">직접입력</option>
								       			</select>
		                                    </div>
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입사 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_car input_car1" id="exampleInputEmail"	name = "user_caeer_sdate1"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "exampleInputEmail">퇴사 연도</label>
		                                        <input type="date" class="form-control form-control-user input_car input_car1" id="exampleInputEmail"	name = "user_caeer_edate1"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_car input_car1" id="exampleFirstName"	name = "user_caeer_sale1"
		                                            placeholder="연봉">
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_jobt1" class="combo input_car input_car1" id=selectedbox>
													<option value="" selected disabled hidden>직위</option>
								           			<option value="1">인턴/수습</option>
								           			<option value="2">사원</option>
								           			<option value="3">주임</option>
								           			<option value="4">계장</option>
								           			<option value="5">대리</option>
								           			<option value="6">과장</option>
								           			<option value="7">차장</option>
								           			<option value="8">부장</option>
								           			<option value="9">이사</option>
								           			<option value="10">상무</option>
								           			<option value="11">전무</option>
								           			<option value="23">직접입력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car1" id="exampleFirstName"	name = "user_caeer_dept1"
		                                            placeholder="근무부서">
		                                    </div><div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car1" id="exampleFirstName"	name = "user_caeer_linc1"
		                                            placeholder="담당업무">
		                                    </div> 
		                                </div>
		                                <div class="form-group row">
		                            		<div class="col-sm-10 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2 mb-3 mb-sm-0">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_1" name = "carbtn_1" value = "추가" >
		                                    </div>
		                                </div>
	                                <br>
	                                <hr>
	                                <br>
                            	</div>

                            	<div id = "car2">
                            		<h5>경력사항 입력2</h5>
                            		<br>
	                            		<div class="form-group row">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car" id="exampleFirstName"	name = "user_caeer_name2"
		                                            placeholder="회사 명">
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_area2" class="combo input_car input_car2" id=selectedbox>
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
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_leave2" class="combo input_car input_car2" id=selectedbox>
													<option value="" selected disabled hidden>퇴사사유</option>
								           			<option value="20">계약만료</option>
								           			<option value="21">경영악화</option>
								           			<option value="22">근무조건</option>
								           			<option value="23">출산/육아</option>
								           			<option value="24">학업</option>
								           			<option value="25">개인사정</option>
								           			<option value="26">직접입력</option>
								       			</select>
		                                    </div>
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입사 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_car input_car2" id="exampleInputEmail"	name = "user_caeer_sdate2"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "exampleInputEmail">퇴사 연도</label>
		                                        <input type="date" class="form-control form-control-user input_car input_car2" id="exampleInputEmail"	name = "user_caeer_edate2"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_car input_car2" id="exampleFirstName"	name = "user_caeer_sale2"
		                                            placeholder="연봉">
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_jobt2" class="combo input_car input_car2" id=selectedbox>
													<option value="" selected disabled hidden>직위</option>
								           			<option value="1">인턴/수습</option>
								           			<option value="2">사원</option>
								           			<option value="3">주임</option>
								           			<option value="4">계장</option>
								           			<option value="5">대리</option>
								           			<option value="6">과장</option>
								           			<option value="7">차장</option>
								           			<option value="8">부장</option>
								           			<option value="9">이사</option>
								           			<option value="10">상무</option>
								           			<option value="11">전무</option>
								           			<option value="23">직접입력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car2" id="exampleFirstName"	name = "user_caeer_dept2"
		                                            placeholder="근무부서">
		                                    </div><div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car2" id="exampleFirstName"	name = "user_caeer_linc2"
		                                            placeholder="담당업무">
		                                    </div> 
		                                </div>
		                                <div class="form-group row">
		                            		<div class="col-sm-8 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2 mb-3 mb-sm-0">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_2" name = "carbtn_2_add" value = "추가" >
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_2" name = "carbtn_2_del" value = "삭제" >
		                                    </div>
		                                </div>
	                                <br>
	                                <hr>
	                                <br>
                            	</div>
                            	
                            	
                            	<div id = "car3">
                            		<h5>경력사항 입력3</h5>
                            		<br>
	                            		<div class="form-group row">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car3" id="exampleFirstName"	name = "user_caeer_name3"
		                                            placeholder="회사 명">
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_area3" class="combo input_car input_car3" id=selectedbox>
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
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_leave3" class="combo input_car input_car3" id=selectedbox>
													<option value="" selected disabled hidden>퇴사사유</option>
								           			<option value="20">계약만료</option>
								           			<option value="21">경영악화</option>
								           			<option value="22">근무조건</option>
								           			<option value="23">출산/육아</option>
								           			<option value="24">학업</option>
								           			<option value="25">개인사정</option>
								           			<option value="26">직접입력</option>
								       			</select>
		                                    </div>
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입사 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_car input_car3" id="exampleInputEmail"	name = "user_caeer_sdate3"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "exampleInputEmail">퇴사 연도</label>
		                                        <input type="date" class="form-control form-control-user input_car input_car3" id="exampleInputEmail"	name = "user_caeer_edate3"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_car input_car3" id="exampleFirstName"	name = "user_caeer_sale3"
		                                            placeholder="연봉">
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_jobt3" class="combo input_car input_car3" id=selectedbox>
													<option value="" selected disabled hidden>직위</option>
								           			<option value="1">인턴/수습</option>
								           			<option value="2">사원</option>
								           			<option value="3">주임</option>
								           			<option value="4">계장</option>
								           			<option value="5">대리</option>
								           			<option value="6">과장</option>
								           			<option value="7">차장</option>
								           			<option value="8">부장</option>
								           			<option value="9">이사</option>
								           			<option value="10">상무</option>
								           			<option value="11">전무</option>
								           			<option value="23">직접입력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car3" id="exampleFirstName"	name = "user_caeer_dept3"
		                                            placeholder="근무부서">
		                                    </div><div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car3" id="exampleFirstName"	name = "user_caeer_linc3"
		                                            placeholder="담당업무">
		                                    </div> 
		                                </div>
										<div class="form-group row">
		                            		<div class="col-sm-8 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2 mb-3 mb-sm-0">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_3" name = "carbtn_3_add" value = "추가" >
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_3" name = "carbtn_3_del" value = "삭제" >
		                                    </div>
		                                </div>
	                                <br>
	                                <hr>
	                                <br>
                            	</div>

                            	<div id = "car4">
                            		<h5>경력사항 입력4</h5>
                            		<br>
	                            		<div class="form-group row">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car4" id="exampleFirstName"	name = "user_caeer_name4"
		                                            placeholder="회사 명">
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_area4" class="combo input_car input_car4" id=selectedbox>
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
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_leave4" class="combo input_car input_car4" id=selectedbox>
													<option value="" selected disabled hidden>퇴사사유</option>
								           			<option value="20">계약만료</option>
								           			<option value="21">경영악화</option>
								           			<option value="22">근무조건</option>
								           			<option value="23">출산/육아</option>
								           			<option value="24">학업</option>
								           			<option value="25">개인사정</option>
								           			<option value="26">직접입력</option>
								       			</select>
		                                    </div>
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">입사 연도</label>
		                                       	<input type="date" class="form-control form-control-user input_car input_car4" id="exampleInputEmail"	name = "user_caeer_sdate4"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "exampleInputEmail">퇴사 연도</label>
		                                        <input type="date" class="form-control form-control-user input_car input_car4" id="exampleInputEmail"	name = "user_caeer_edate4"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_car input_car4" id="exampleFirstName"	name = "user_caeer_sale4"
		                                            placeholder="연봉">
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row" id = "datelabel">
		                                    <div class="col-sm-4">
		                                        <select name="user_caeer_jobt4" class="combo input_car input_car4" id=selectedbox>
													<option value="" selected disabled hidden>직위</option>
								           			<option value="1">인턴/수습</option>
								           			<option value="2">사원</option>
								           			<option value="3">주임</option>
								           			<option value="4">계장</option>
								           			<option value="5">대리</option>
								           			<option value="6">과장</option>
								           			<option value="7">차장</option>
								           			<option value="8">부장</option>
								           			<option value="9">이사</option>
								           			<option value="10">상무</option>
								           			<option value="11">전무</option>
								           			<option value="23">직접입력</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car4" id="exampleFirstName"	name = "user_caeer_dept4"
		                                            placeholder="근무부서">
		                                    </div><div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_car input_car4" id="exampleFirstName"	name = "user_caeer_linc4"
		                                            placeholder="담당업무">
		                                    </div> 
		                                </div>
		                                <div class="form-group row">
		                            		<div class="col-sm-10 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block carbtn_4" name = "carbtn_4_del" value = "삭제" >
		                                    </div>
		                                </div>
	                                <br>
	                                <hr>
                            		</div>
                            	</div>
                            	<br>
                                <h4>자격증</h4>
                            	<hr>
                            	<br>
                                <div id = "lic1">
                            		<h5>자격증 입력1</h5>
                            		<br>
	                            		<div class="form-group row">
	                            			<div class="col-sm-4">
		                                        <select name="user_licen_type1" class="combo input_li1" id=selectedbox>
													<option value="" selected disabled hidden>항목 선택</option>
								           			<option value="자격증/면허증">자격증/면허증</option>
								           			<option value="어학시험">어학시험</option>
								           			<option value="수상내역/공모전">수상내역/공모전</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_li1" id="exampleFirstName"	name = "user_licen_name1"
		                                            placeholder="자격증 명">
		                                    </div>
		                                    
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                	<div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_li1" id="exampleFirstName"	name = "user_licen_publ1"
		                                            placeholder="발행처/기관">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">취득일</label>
		                                       	<input type="date" class="form-control form-control-user input_li1" id="exampleInputEmail"	name = "user_licen_date1"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox">&nbsp;</label>
		                                        <select name="user_licen_pass1" class="combo input_li1" id=selectedbox>
													<option value="" selected disabled hidden>합격 구분</option>
								           			<option value="1차합격">1차합격</option>
								           			<option value="2차합격">2차합격</option>
								           			<option value="필기합격">필기합격</option>
								           			<option value="실기합격">실기합격</option>
								           			<option value="최종합격">최종합격</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
		                                <div class="form-group row">
		                            		<div class="col-sm-10 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2 mb-3 mb-sm-0">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block li_1" name = "li_1" value = "추가" >
		                                    </div>
		                                </div>
	                                
	                                <hr>
                            	</div>
                            	<br>
                            	<div id = "lic2">
                            		<h5>자격증 입력2</h5>
                            		<br>
	                            		<div class="form-group row">
	                            			<div class="col-sm-4">
		                                        <select name="user_licen_type2" class="combo input_li2" id=selectedbox>
													<option value="" selected disabled hidden>항목 선택</option>
								           			<option value="자격증/면허증">자격증/면허증</option>
								           			<option value="어학시험">어학시험</option>
								           			<option value="수상내역/공모전">수상내역/공모전</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_li2" id="exampleFirstName"	name = "user_licen_name2"
		                                            placeholder="자격증 명">
		                                    </div>
		                                    
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                	<div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_li2" id="exampleFirstName"	name = "user_licen_publ2"
		                                            placeholder="발행처/기관">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">취득일</label>
		                                       	<input type="date" class="form-control form-control-user input_li2" id="exampleInputEmail"	name = "user_licen_date2"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox">&nbsp;</label>
		                                        <select name="user_licen_pass2" class="combo input_li2" id=selectedbox>
													<option value="" selected disabled hidden>합격 구분</option>
								           			<option value="1차합격">1차합격</option>
								           			<option value="2차합격">2차합격</option>
								           			<option value="필기합격">필기합격</option>
								           			<option value="실기합격">실기합격</option>
								           			<option value="최종합격">최종합격</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
										<div class="form-group row">
		                            		<div class="col-sm-8 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2 mb-3 mb-sm-0">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block li_2" name = "li_2_add" value = "추가" >
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block li_2" name = "li_2_del" value = "삭제" >
		                                    </div>
		                                </div>
	                                <hr>
                            	</div>
                            	<br>
                            	
                            	<div id = "lic3">
                            		<h5>자격증 입력3</h5>
                            		<br>
	                            		<div class="form-group row">
	                            			<div class="col-sm-4">
		                                        <select name="user_licen_type3" class="combo input_li3" id=selectedbox>
													<option value="" selected disabled hidden>항목 선택</option>
								           			<option value="자격증/면허증">자격증/면허증</option>
								           			<option value="어학시험">어학시험</option>
								           			<option value="수상내역/공모전">수상내역/공모전</option>
								       			</select>
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                        <input type="text" class="form-control form-control-user input_li3" id="exampleFirstName"	name = "user_licen_name3"
		                                            placeholder="자격증 명">
		                                    </div>
		                                    
	                                	</div>
	                                	 <br>
		                                <div class="form-group row" id = "datelabel">
		                                	<div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleFirstName">&nbsp;&nbsp;</label>
		                                        <input type="text" class="form-control form-control-user input_li3" id="exampleFirstName"	name = "user_licen_publ3"
		                                            placeholder="발행처/기관">
		                                    </div>
		                                    <div class="col-sm-4 mb-3 mb-sm-0">
		                                    	<label for = "exampleInputEmail">취득일</label>
		                                       	<input type="date" class="form-control form-control-user input_li3" id="exampleInputEmail"	name = "user_licen_date3"
	                                         placeholder="">
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<label for = "selectedbox">&nbsp;</label>
		                                        <select name="user_licen_pass3" class="combo input_li3" id=selectedbox>
													<option value="" selected disabled hidden>합격 구분</option>
								           			<option value="1차합격">1차합격</option>
								           			<option value="2차합격">2차합격</option>
								           			<option value="필기합격">필기합격</option>
								           			<option value="실기합격">실기합격</option>
								           			<option value="최종합격">최종합격</option>
								       			</select>
		                                    </div>
		                                </div>
		                                <br>
										<div class="form-group row">
		                            		<div class="col-sm-10 mb-3 mb-sm-0">
		                                    </div>
		                                    <div class="col-sm-2">
		                                        <input type = "button" class="btn btn-primary btn-user btn-block li_3" name = "li_3" value = "삭제" >
		                                    </div>
		                                </div>
	                                <hr>
                            	</div>
                            	<br>                                
                                <div class="form-group row">
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                        <input type = "button" class="btn btn-primary btn-user btn-block" value = "완료" onclick="check_input()">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type = "button" class="btn btn-primary btn-user btn-block" value = "취소" onclick="reset_form()">
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