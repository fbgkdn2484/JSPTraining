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
	      if (!document.member_form.id.value) {
	          alert("아이디를 입력하세요!");    
	          document.member_form.id.focus();
	          return;
	      }
	      if (!document.member_form.passwd.value) {
	          alert("비밀번호를 입력하세요!");    
	          document.member_form.passwd.focus();
	          return;
	      }
	      if (!document.member_form.pass_confirm.value) {
	          alert("비밀번호확인을 입력하세요!");    
	          document.member_form.pass_confirm.focus();
	          return;
	      }
	      if (!document.member_form.name.value) {
	          alert("이름을 입력하세요!");    
	          document.member_form.name.focus();
	          return;
	      }
	      
	      if (!document.member_form.tel.value) {
	          alert("전화번호를 입력하세요!");    
	          document.member_form.tel.focus();
	          return;
	      }
	     
	      if (!document.member_form.birth.value || document.member_form.birth.value == "연도") {
	          alert("생년월일을 입력하세요!");    
	          document.member_form.birth.focus();
	          return;
	      }
	      if (!document.member_form.addr.value) {
	          alert("주소를 입력하세요!");    
	          document.member_form.addr.focus();
	          return;
	      }
	      if (!document.member_form.img.value) {
	          alert("증명사진을 입력해주세요!");    
	          document.member_form.img.focus();
	          return;
	      }
	
	      if (document.member_form.passwd.value != 
	            document.member_form.pass_confirm.value) {
	          alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요!");
	          document.member_form.passwd.focus();
	          document.member_form.passwd.select();
	          return;
	      }
	      
	      var str1 = ' / ';
	      var addrs = document.member_form.addr.value.concat(str1, document.member_form.addr1.value, str1, document.member_form.addr2.value)		// 문자열 합쳐서 주소값 넘겨주기 
	      
	      document.member_form.addr.value = addrs;
	
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
		     window.open("memberCheckId.jsp?id=" + document.member_form.id.value,  /*  */
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
                                <h1 class="h4 text-gray-900 mb-4">개인 회원 정보를 입력해 주세요!</h1>
                            </div>
                            <br>
                            <form class="user" name="member_form" method="post" enctype="multipart/form-data" action="userRegisterPro.jsp">
                            	<div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
	                            		 
                                    	 <input type="email" class="form-control form-control-user" id="exampleInputEmail"	name = "id"
                                         placeholder="아이디(이메일)">
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "중복확인" onclick="check_id()">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"	name = "passwd"
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
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "name"
                                            placeholder="이름">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"	name = "tel"
                                            placeholder="휴대폰( - 없이 숫자만 입력해 주세요.)">
                                    </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                            		 	<label for = "exampleInputEmail">생년월일</label>
                                    	 <input type="date" class="form-control form-control-user" id="exampleInputEmail"	name = "birth"
                                         placeholder="생년월일">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="sample4_postcode"	name = "addr"
                                         placeholder="우편번호" readonly>
                                     </div>
                                     <div class="col-sm-3 mb-1 mb-sm-0">
                                     	<input type = "button" class="btn btn-primary btn-user btn-block" value = "우편번호 찾기" onclick="findAddr()">
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="c_main_address"	name = "addr1"
                                         placeholder="주소" readonly>
                                     </div>
                                </div>
                                <div class="form-group row">
                            		 <div class="col-sm-12 mb-3 mb-sm-0">
                                    	 <input type="text" class="form-control form-control-user" id="exampleInputEmail"	name = "addr2"
                                         placeholder="상세 주소">
                                     </div>
                                </div>
                                <br>
                                <div class="form-group row">
                            		 <div class="col-sm-9 mb-3 mb-sm-0">
                                    	 <input type="file" name = "img"
                                         placeholder="이미지">
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