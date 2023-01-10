<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//업데이트를 위해 몇번 글인지를 알아야 함
	int num = Integer.parseInt(request.getParameter("num"));	//request는 항상 문자열로 반환하기 때문에 형변환 필요 네트워크로 전달 받는 숫자는 항상 문자열
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel = "stylesheet" type = "text/css" href = "style.css">
<script type="text/javascript" src = "script.js"></script>
<style>
	th {
		width: 200pt;
		}
		
	td {
		width: 200pt;
		}
</style>
</head>
<body>
	<p>글삭제</p>					 <!-- insertform 자바스크립트를 사용하기 위해 일단 이 이름으로 사용  -->
	<form method = "post" name = "insertform" action="deletePro.jsp" onsubmit = "return writeSave()">	<!-- onsubmit submit되기 전에 실회되게 하는 코드  -->
		<table>
			<tr>
				<th class = "thcolor">비밀번호를 입력해 주세요.</th>
			</tr>
			<tr>
				<td class = "tdcolor">비밀번호 :
					<input type = "text" size = "10" maxlength = "15" name = "passwd">
					<input type = "hidden" name = "num" value = "<%= num %>">	<!-- 필요한 값이 있을 때 hidden으로 전달  -->
					<input type = "hidden" name = "pageNum" value = "<%= pageNum %>">	
				</td> 
			</tr>
			<tr>
				<th class = "thcolor">
					<input type = "submit" value = " 삭 제 ">
					<input type = "button" value = "목록보기" onclick="window.location = 'list.jsp?pageNum=<%= pageNum %>'">
				</th> 
			</tr>
		</table>
	</form>
</body>
</html>