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
			ResultSet rs = null;		//select문 실행 결과를 저장하는 객체
			
			//에러처리가 필요한 이유 : 나의 코드의 문제가 아니라 외부요소에 의해 오류가 발생한 경우를 알아내기 위해
			try{	
				/* String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
				String dbID = "jspid";
				String dbPW = "jsppass";
				
				Class.forName("com.mysql.jdbc.Driver");	//1. jdbc드라이버 로딩하기
				conn = DriverManager.getConnection(jdbcURL, dbID, dbPW);	//2.DB서버 접속하기 */
				
				//DataSource를 이용한 커넥션 풀(connection pools) 설정
				InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
				DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");	//connection 객체 찾기
				conn = ds.getConnection(); // connection 객체를 할당 받아야 함
				
				
				String sql = "select id, passwd from members where id=?";
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				//위치 홀더 형태로 값 대입하기
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
				
				
				if(rs.next()){//값이 있으면 참 없으면 거짓
					String rid = rs.getString("id");	//테이블의 컬럼명으로 값을 가져온다.
					String rpasswd = rs.getString("passwd");
					if(id.equals(rid) && passwd.equals(rpasswd)){	//여기서 id는 String id = request.getParameter("id");로 사용자가 입력한 id
						// 아이디와 비밀번호가 모두 맞은 경우 업데이트 되는 곳	(name 수정)
						if(pstmt != null){
							pstmt.close();
						}
						sql = "update members set name=? where id=?";
						pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
						//위치 홀더 형태로 값 대입하기
						pstmt.setString(1, name);
						pstmt.setString(2, id);
						pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
						
						response.sendRedirect("list.jsp");
					
					}
					else
					{
						out.println("패스워드가 틀렸습니다. 다시 한번 확인해주세요. ");
					}
				}
				else{
					out.println("아이디가 틀렸습니다. 다시 한번 확인해주세요. ");
				}
				

			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>