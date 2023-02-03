<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	   function check_input()
	   {
		   console.log("완료 버튼을 누르셨습니다.");
	      if (!document.member_form.comp_id.value) {
	          alert("아이디를 입력하세요!");    
	          document.member_form.comp_id.focus();
	          return;
	      }
	      if (!document.member_form.comp_passwd.value) {
	          alert("비밀번호를 입력하세요!");    
	          document.member_form.comp_passwd.focus();
	          return;
	      }
	      if (!document.member_form.pass_confirm.value) {
	          alert("비밀번호 확인을 입력하세요!");    
	          document.member_form.pass_confirm.focus();
	          return;
	      }
	      if (!document.member_form.comp_user_name.value) {
	          alert("대표자 명을 입력하세요!");    
	          document.member_form.comp_user_name.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_TEL.value) {
	          alert("전화번호 입력하세요!");    
	          document.member_form.COMP_TEL.focus();
	          return;
	      }
	      
	      if (!document.member_form.comp_num.value) {
	          alert("사업자 등록 번호를 입력하세요!");    
	          document.member_form.comp_num.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_EMPL.value || document.member_form.COMP_EMPL.value == "0") {
	          alert("기업형태를 입력하세요!");    
	          document.member_form.COMP_EMPL.focus();
	          return;
	      }
	      

	      
	      if (!document.member_form.comp_name.value) {
	          alert("회사명을 입력하세요!");    
	          document.member_form.comp_name.focus();
	          return;
	      }
	      
	      
	      if (!document.member_form.comp_img.value) {
	          alert("회사 로고를 선택해주세요!");    
	          document.member_form.comp_img.focus();
	          return;
	      }
	      
	      
	      if (!document.member_form.COMP_HEAD.value) {
	          alert("사원 수를 입력하세요!");    
	          document.member_form.COMP_HEAD.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_TYPE.value || document.member_form.COMP_TYPE.value == "0") {
	          alert("업종을 입력하세요!");    
	          document.member_form.COMP_TYPE.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_DATE.value || document.member_form.COMP_DATE.value == "연도") {
	          alert("설립일을 입력하세요!");    
	          document.member_form.COMP_DATE.focus();
	          return;
	      }
	      
	      if (!document.member_form.COMP_SALE.value) {
	          alert("매출액을 입력하세요!");    
	          document.member_form.COMP_SALE.focus();
	          return;
	      }
	     

	      if (!document.member_form.COMP_HTTP.value) {
	          alert("홈페이지 주소를 입력하세요!");    
	          document.member_form.COMP_HTTP.focus();
	          return;
	      }
	      if (!document.member_form.COMP_ADDR.value) {
	          alert("회사 주소를 입력해주세요!");    
	          document.member_form.COMP_ADDR.focus();
	          return;
	      }
	
	      if (document.member_form.comp_passwd.value != 
	            document.member_form.pass_confirm.value) {
	          alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요!");
	          document.member_form.comp_passwd.focus();
	          document.member_form.comp_passwd.select();
	          return;
	      }
	
	      
	      var str1 = ' / ';
	      var addrs = document.member_form.COMP_ADDR.value.concat(str1, document.member_form.COMP_ADDR1.value, str1, document.member_form.COMP_ADDR2.value)		// 문자열 합쳐서 주소값 넘겨주기 
	      
	      document.member_form.COMP_ADDR.value = addrs;
	
	      document.member_form.submit();
	   }
	
	   function reset_form() {
		   console.log("취소 버튼을 누르셨습니다.");
	      document.member_form.id.value = "";  
	      document.member_form.passwd.value = "";
	      document.member_form.pass_confirm.value = "";
	      document.member_form.name.value = "";
	      document.member_form.id.focus();
	      return;
	   }
	   
	   function check_id() {
		     window.open("memberCheckId.jsp?id=" + document.member_form.comp_id.value,  /*  */
		         		 "IDcheck",
		          		 "left=700,top=300,width=350,height=200,scrollbars=no,resizable=yes");
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
                                <h1 class="h4 text-gray-900 mb-4">기업 회원 정보를 입력해 주세요!</h1>
                            </div>
                            <br>
                            <form class="user" name="member_form" method="post" enctype="multipart/form-data" action="compRegisterPro.jsp">
                            	<div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
	                            		 
                                    	 <input type="email" class="form-control form-control-user" id="exampleInputEmail"	name = "comp_id"
                                         placeholder="아이디(이메일)">
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "중복확인" onclick="check_id()">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"	name = "comp_passwd"
                                            id="exampleInputPassword" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"	name = "pass_confirm"
                                            id="exampleRepeatPassword" placeholder="비밀번호 재입력">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "comp_user_name"
                                            placeholder="대표자 명">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"	name = "COMP_TEL"
                                            placeholder="휴대폰( - 없이 숫자만 입력해 주세요.)">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"	name = "comp_num"
                                            id="exampleInputPassword" placeholder="사업자 등록 번호">
                                    </div>
                                    <div class="col-sm-6">
											<select name="COMP_EMPL" class="combo" id=selectedbox>
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
                                    	 <input type="text" class="form-control form-control-user" id="exampleInputEmail"	name = "comp_name"
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
                                        <input type="text" class="form-control form-control-user"	name = "COMP_HEAD"
                                            id="exampleInputPassword" placeholder="사원 수">
                                    </div>
                                    <div class="col-sm-6">
                                    	<select name="COMP_TYPE" class="combo" id=selectedbox>
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
                                    	 <input type="date" class="form-control form-control-user" id="exampleInputEmail"	name = "COMP_DATE"
                                         placeholder="설립일">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"	name = "COMP_SALE"
                                            id="exampleInputPassword" placeholder="매출액">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"	name = "COMP_HTTP"
                                            id="exampleRepeatPassword" placeholder="회사 홈페이지 주소">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="sample4_postcode"	name = "COMP_ADDR"
                                         placeholder="회사 우편번호">
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "우편번호 찾기" onclick="findAddr()">
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="c_main_address"	name = "COMP_ADDR1"
                                         placeholder="회사 주소" readonly>
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="exampleInputEmail"	name = "COMP_ADDR2"
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

</body>
</html>