<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %> <!-- 자바 안의 sql클래스에 있는 전부를 사용하겠다는 의미 -->
<%@ page import = "javax.sql.*" %>	<!-- x는 확장이라는 의미 -->
<%@ page import = "javax.naming.*" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<h3>members 테이블의 회원 목록</h3>
	<hr>
	<br>
	<table border = "1">
		<tr>
			<th width = "250">아이디</th>
			<th width = "100">패스워드</th>
			<th width = "100">이름</th>
			<th width = "250">가입일자</th>
		</tr>
<%
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체
			ResultSet rs = null;		//select문 실행 결과를 저장하는 객체
			
			//에러처리가 필요한 이유 : 나의 코드의 문제가 아니라 외부요소에 의해 오류가 발생한 경우를 알아내기 위해
			try{	
				/* 
				String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
				String dbID = "jspid";
				String dbPW = "jsppass";
				
				Class.forName("com.mysql.jdbc.Driver");	//1. jdbc드라이버 로딩하기
				conn = DriverManager.getConnection(jdbcURL, dbID, dbPW);	//2.DB서버 접속하기 
				*/
				//DataSource를 이용한 커넥션 풀(connection pools) 설정, 오버헤드를 줄이기 위해
				InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
				DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");	//connection 객체 찾아서 사용한 후 커넥션 풀에 다시 반환하여 효율을 높임
				conn = ds.getConnection(); // connection 객체를 할당 받아야 함

				
				String sql = "select * from members";
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				rs = pstmt.executeQuery();	//4. sql query 실행
				
				
				while(rs.next()){//처음에는 칼럼명을 가르키고 있기 때문에 next를 사용해야됨 또한 next는 다음 가져올 것이 있으면 처리하겠다는 의미
					String id = rs.getString("id");	//테이블의 컬럼명으로 정보를 가져오기
					String pw = rs.getString("passwd");
					String name = rs.getString("name");
					String register = rs.getString("reg_date");
%>
					<tr>
						<td><%= id %></td>
						<td><%= pw %></td>
						<td><%= name %></td>
						<td><%= register %></td>
					</tr>
<%
					
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				//과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
				
			}
%>
		
	</table>
	<table>
		<tr>
			<td width = "720" align = "right">
				<a href = "insertForm.jsp">[추가]</a>
				<a href = "updateForm.jsp">[수정]</a>
				<a href = "deleteForm.jsp">[삭제]</a>

			</td>
		</tr>
	</table>
</body>
</html>