<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> <!-- 자바 안의 sql클래스에 있는 전부를 사용하겠다는 의미 -->
<%@ page import = "javax.sql.*" %>	<!-- x는 확장이라는 의미 -->
<%@ page import = "javax.naming.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
			//폼태그로 보낸 정보를 받아옴
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체
			String str = "";
			
			//에러처리가 필요한 이유 : 나의 코드의 문제가 아니라 외부요소에 의해 오류가 발생한 경우를 알아내기 위해
			try{	
				/* String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
				String dbID = "jspid";
				String dbPW = "jsppass";
				
				Class.forName("com.mysql.jdbc.Driver");	//1. jdbc드라이버 로딩하기
				conn = DriverManager.getConnection(jdbcURL, dbID, dbPW);	//2.DB서버 접속하기 */
				
				//DataSource를 이용한 커넥션 풀(connection pools) 설정  why?? : 속도를 향상시키기 위해서
				InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
				DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");	//connection 객체 찾기
				conn = ds.getConnection(); // connection 객체를 할당 받아야 함
				
				//insert into members values ('awexcd@gragon.com', '2222', '김가가', now());
				String sql = "insert into members values(?, ?, ?, now())";
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				//위치 홀더 형태로 값 대입하기
				pstmt.setString(1, id);
				pstmt.setString(2, passwd);
				pstmt.setString(3, name);
				pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
				
				str = "members 테이블에 새로운 레코드를 추가했습니다.";
				
				response.sendRedirect("list.jsp");
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
				
			}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= str %> 	<!-- 아무것도 뜨지 않음  -->
</body>
</html>