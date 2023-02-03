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
<%
	String id = (String) session.getAttribute("id");
%>
	<script>
	   function check_input()
	   {
		  console.log("완료 버튼을 누르셨습니다.");
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
                                <h1 class="h4 text-gray-900 mb-4">회원가입 정보를 수정해 주세요!</h1>
                            </div>
                            <br>
                            <form class="user" name="member_form" method="post" action="memberupdatePro.jsp">
                            	<input type = "hidden" name = "id" value = "<%= id %>">	<!-- 필요한 값이 있을 때 hidden으로 전달  -->
                            	<div class="form-group">
                                      <input type="text" class="form-control form-control-user" id="exampleFirstName"	name = "name"
                                            placeholder="이름">
                                </div>
                                <br>
                                <div class="form-group">
                                      <input type="text" class="form-control form-control-user" id="exampleLastName"	name = "tel"
                                            placeholder="휴대폰( - 없이 숫자만 입력해 주세요.)">
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