<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>   	<!-- 여러 명의 클라이언트가 업로드 하는데 파일이 같은 이름일 경우, 자동으로 리네임 된다는 의미 자동으로 123이 붙는 등 --> 
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>  

<%
	//파일이 업로드되는 폴더를 지정
	//디비에는 url즉 경로만 지정하고 이미지자체는 서버내의 디렉토리에 저장하여 불러와 사용한다.
	String saveFolder = "C://Temp";
	String encType = "utf-8";		//인코딩 타입//영어 이외의 언어와 문자 처리를 하기 위한 인코딩 방식 
	int maxSize = 5*1024*1024;		//최대 업로드 파일 크기 5MB로 용량 제한
	//예외 처리 필요 코드 문제가 아닌 다른 문제로 에러발생할 수 있기 때문에
	
	try {
		MultipartRequest multi = null;
		
		//전송을 담당할 컴포넌트를 생성하고 파일을 전송
		multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
	}
	catch(IOException ioe){
		System.out.println(ioe);
	}
	catch(Exception ex){
		System.out.println(ex);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>