<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 예제</title>
</head>
<body>
	<form method = "post" name = "fileForm" enctype = "multipart/form-data" action="fileUpload.jsp">		<!-- 반드시 post  -->
	
		작성자 : 
		<input type = "text" name = "user"><br><br>
		제목 :
		<input type = "text" name = "title"><br><br>
		파일명 :
		<input type = "file" name = "uploadFile"><br><br>
		<input type = "submit" value = "파일올리기"><br><br>
	
	</form>
</body>
</html>