<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="members.MembersDAO" %> 

<% request.setCharacterEncoding("utf-8");%>

<%
	String id = "";

	id = (String) session.getAttribute("id");	/* 세션에서 값을 가져옴 */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/sb-admin-2.css" rel="stylesheet">
<script src = "../js/jquery-3.6.3.min.js"></script>
<style>
h3 {
   padding-left: 10px;
   border-left: solid 10px #2e59d9;
}
#b1 {
   padding:10px;

}
</style>
<script>

	$(document).ready(function(){
		
		document.login_form.id.value = "<%= id %>";
		
	});
	
	
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
	    
	    window.opener.name = "mainPage"; // 부모창의 이름 설정
	    document.login_form.target = "mainPage"; // 타켓을 부모창으로 설정
	    document.login_form.action = "../userlogin/memberupdateForm.jsp";
	    document.login_form.submit();
	    self.close();

	}
</script>
</head>
<body>
<h3>비밀번호 체크</h3>		
	<div style = "padding : 40px;">
		<form class="user" name="login_form" method="post" >
		    <div class="form-group">
		    	<label for = "exampleInputEmail">아이디</label>
		        <input type="email" class="form-control form-control-user"
		            id="exampleInputEmail" aria-describedby="emailHelp"
		            placeholder="이메일" name="id" readonly>
		    </div>
		    <div class="form-group">
		    	<label for = "exampleInputEmail">비밀번호</label>
		        <input type="password" class="form-control form-control-user"
		            id="exampleInputPassword" placeholder="비밀번호" name="passwd">
		    </div>
		    <div class="text-center" id = "b1">
			    <span onclick="check_input()" class="small">
			    <a href="check_input">
			        <b>확인</b> 
			    </a>
			    </span>
			    
			</div>
			<div class="text-center" id = "b1">
                <a class="small" href="#" onclick="javascript:self.close()">
                    <b>닫기</b> 
                </a>
            </div>
		</form>
	</div>

</body>
</html>