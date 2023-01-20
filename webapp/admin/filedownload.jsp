<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>

<%

	request.setCharacterEncoding("utf-8");

	String bimage = request.getParameter("bimage");
	String saveFolder = "C://WS-JSPMySQL/BookSite/src/main/webapp/bookimg/";
	
	InputStream in = null;		//네트워크 프로그래밍
	OutputStream os = null;
	File file = null;
	boolean skip = false;
	
	try {
		// 파일을 읽어 스트림에 담기
		try {
			
			file = new File(saveFolder, bimage);
			in = new FileInputStream(file);
			
		} catch(FileNotFoundException fe) {
			skip = true;
		}
		
		if(!skip) {
			//파일명 한글 처리
			bimage = new String(bimage.getBytes("utf-8"), "iso-8859-1");
		
			//파일 다운로드 헤더 지정
			response.reset();		/* 서버에서 내보내는 것이라 response */
			response.setHeader("Content-Disposition", "attachment; filename=\"" + bimage + "\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");		
			response.setHeader("Content-Length", ""+file.length());		/* length는 숫자를 반환하기 때문에 ""+file.length());를 사용하면 문자로 바뀜 */
			
			os = response.getOutputStream();
			byte b[] = new byte[(int)file.length()];
			int leng = 0;
			
			//파일 다운로드			
			while((leng=in.read(b)) > 0 ) {	
				os.write(b, 0, leng);
			}
		
		} else {
			response.setContentType("text/html;charset=utf-8");
			out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다.');history.back();</script>");
		}
		
		in.close();
		os.close();
		
	} catch(Exception e) {
		e.getStackTrace();
	}	

%>