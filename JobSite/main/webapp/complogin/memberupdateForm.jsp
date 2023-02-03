<%@ page language="java" contentType="text/html; charset=UTF-8"		
    pageEncoding="UTF-8"%>
    
<%-- company --%>

<%@ page import="company.CompanyDAO" %> 
<%@ page import="company.CompanyVO" %> 
<%@ page import="java.util.List" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Arrays" %>

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
	<script src = "../js/jquery-3.6.3.min.js"></script> <!-- jquery 사용 시 필요!!! -->
    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.css" rel="stylesheet">
<%
	/* String id = (String) session.getAttribute("id"); */
%>

<%

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	/* System.out.println("비밀번호 찾기 실행 pass : " + passwd); */
	
	CompanyDAO Cdao = CompanyDAO.getInstance();
	int check = Cdao.userCheck(id, passwd);
	
	if(check == 1) {
		

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	CompanyDAO Cmdao = CompanyDAO.getInstance();
	CompanyVO article = Cmdao.getArticle(id);

	String[] Addr = article.getCOMP_ADDR().split("/");



%>
	<script>
	
		$(document).ready(function(){
	       
/* 			alert("test"); */
	       
	   	   $("#COMP_EMPL").val("<%= article.getCOMP_EMPL() %>").prop("selected", true);
	   	   $("#COMP_TYPE").val("<%= article.getCOMP_TYPE()%>").prop("selected", true);

	   	 		    
	   	});
	
	   function check_input()
	   {
		  console.log("완료 버튼을 누르셨습니다.");
	      if (!document.member_form.comp_user_name.value) {
	          alert("이름을 입력하세요!");    
	          document.member_form.comp_user_name.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_TEL.value) {
	          alert("전화번호를 입력하세요!");    
	          document.member_form.COMP_TEL.focus();
	          return;
	      }
	      
	      if (!document.member_form.comp_img.value) {
	          alert("증명사진을 입력해주세요!");    
	          document.member_form.comp_img.focus();
	          return;
	      }
	
	      var str1 = '/';
	      var addrs = document.member_form.COMP_ADDR.value.concat(str1, document.member_form.COMP_ADDR1.value, str1, document.member_form.COMP_ADDR2.value)		// 문자열 합쳐서 주소값 넘겨주기 
	      
	      document.member_form.COMP_ADDR.value = addrs;
	      
	      document.member_form.submit();
	   }
	

	   

	   
	   
	   function reset_form() {
		   console.log("취소 버튼을 누르셨습니다.");
	      document.member_form.passwd.value = "";
	      document.member_form.pass_confirm.value = "";
	      document.member_form.name.value = "";
	      document.member_form.id.focus();
	      return;
	   }
	   
	   
	   function findAddr() {
			new daum.Postcode({
	        	oncomplete: function(data) {
	            	// 사용자 주소를 받아올 변수를 정의한다.
	            	var postaddr = '';
	                var addr = '';
	                
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                
	                // 부모창의 주소칸에 받아온 주소를 넣는다.
	                $("#c_main_address").val(addr);
	        	}
	     	}).open();
		}
	   
	</script>
	
</head>
<body class="bg-gradient-primary">

    <br><br><br><br>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회사 정보를 수정해 주세요!</h1>
                            </div>
                            <br>
                            <form class="user" name="member_form" method="post" enctype="multipart/form-data" action="memberupdatePro.jsp">
                            
                            	<input type = "hidden" name = "comp_id" value = "<%= id %>">	<!-- 필요한 값이 있을 때 hidden으로 전달  -->
                            	<br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "comp_user_name"		value = <%= article.getComp_user_name() %>
                                            placeholder="대표자 명">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"	name = "COMP_TEL"	value = <%= article.getCOMP_TEL() %>
                                            placeholder="휴대폰( - 없이 숫자만 입력해 주세요.)">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"	name = "comp_num"	value = <%= article.getComp_num() %>
                                            id="exampleInputPassword" placeholder="사업자 등록 번호">
                                    </div>
                                    <div class="col-sm-6">
											<select name="COMP_EMPL" class="combo" id=COMP_EMPL>
												<option value="0" selected disabled hidden>기업 형태</option>
							           			<option value="100">합명회사</option>
							           			<option value="200">합자회사</option>
							           			<option value="300">주식회사</option>
							           			<option value="400">유한회사</option>
							           			<option value="500">유한책임회사</option>
							       			</select>		

                                        <!-- <input type="text" class="form-control form-control-user"	name = "COMP_EMPL"
                                            id="exampleRepeatPassword" placeholder="기업 형태(ex 중소기업)"> -->
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="exampleInputEmail"	name = "comp_name"		value = <%= article.getComp_name() %>
                                         placeholder="회사명">
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "회사 찾기" onclick="#">		
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="file" name = "comp_img"
                                         placeholder="이미지">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"	name = "COMP_HEAD"	value = <%= article.getCOMP_HEAD() %>
                                            id="exampleInputPassword" placeholder="사원 수">
                                    </div>
                                    <div class="col-sm-6">
                                    	<select name="COMP_TYPE" class="combo" id=COMP_TYPE>
												<option value="0" selected disabled hidden>업종</option>
							           			<option value="100">기획·전략</option>
							           			<option value="200">마케팅·홍보</option>
							           			<option value="300">회계·세무·재무</option>
							           			<option value="400">디자인</option>
							           			<option value="500">IT개발·데이터</option>
							           			<option value="600">영업·판매·무역</option>
							           			<option value="700">건설·건축</option>
							           			<option value="800">서비스</option>
							           			<option value="900">생산</option>
							       		</select>	
                                        <!-- <input type="text" class="form-control form-control-user"	name = "COMP_TYPE"
                                            id="exampleRepeatPassword" placeholder="업종"> -->
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                            		 	 <label for = "exampleInputEmail">설립일</label>
                                    	 <input type="date" class="form-control form-control-user" id="exampleInputEmail"	name = "COMP_DATE"	value = <%= article.getCOMP_DATE() %>
                                         placeholder="설립일">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"	name = "COMP_SALE"	value = <%= article.getCOMP_SALE() %>
                                            id="exampleInputPassword" placeholder="매출액">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"	name = "COMP_HTTP"	value = <%= article.getCOMP_HTTP() %>
                                            id="exampleRepeatPassword" placeholder="회사 홈페이지 주소">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="sample4_postcode"	name = "COMP_ADDR"	value = "<%= Addr[0] %>"
                                         placeholder="회사 우편번호" readonly>
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "우편번호 찾기" onclick="findAddr()">
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="c_main_address"	name = "COMP_ADDR1"		value = "<%= Addr[1] %>"
                                         placeholder="회사 주소" readonly>
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="exampleInputEmail"	name = "COMP_ADDR2"		value = "<%= Addr[2] %>"
                                         placeholder="상세 주소">
                                     </div>
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


<%	
	
	} 
	
	else if(check == 0) {
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%
	}
	
%>
</body>
</html>