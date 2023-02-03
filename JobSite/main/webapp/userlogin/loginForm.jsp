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
<title>사용자 로그인</title>

<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
<link href="../css/sb-admin-2.css" rel="stylesheet">

<style>

</style>
<script>
function check_input()
{
    if (!document.login_form.id.value)
    {
        alert("아이디를 입력하세요");    
        document.login_form.id.focus();
        return;
    }

    if (!document.login_form.passwd.value)
    {
        alert("비밀번호를 입력하세요");    
        document.login_form.passwd.focus();
        return;
    }
    
    document.login_form.submit();
}
</script>
</head>
<body class="bg-gradient-primary">
    <br><br><br><br>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row justify-content-between">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>		<!-- 이미지 파일 -->
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">JobSite에 오신것을 환영합니다!<br>-개인용-</h1>
                                        <br>
                                    </div>
                                    <form class="user" name="login_form" method="post" action="loginPro.jsp">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="이메일" name="id">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="비밀번호" name="passwd">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">
                                                    아이디 저장
                                                </label>
                                            </div>
                                        </div>
                                        <span onclick="check_input()">
                                        <a href="#" class="btn btn-primary btn-user btn-block">
                                            <b>로그인</b> 
                                        </a>
                                        </span>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgotPasswdForm.jsp">
                                            <b>비밀번호 찾기</b> 
                                        </a>
                                    </div>
                                    <br>
                                    <div class="text-center">
                                        <a class="small" href="userRegisterForm.jsp">
                                            <b>회원가입</b> 
                                        </a>
                                    </div>
                                    <br>
                                    <div class="text-center">
                                        <a class="small" href="../main/main.jsp">
                                            <b>메인페이지로 이동</b> 
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.js"></script>

</body>
</html>