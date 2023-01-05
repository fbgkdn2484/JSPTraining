package members;

import java.sql.*; 
import javax.sql.*; 	
import javax.naming.*;

public class MembersDAO {	//data access object
	
	private static MembersDAO instance = new MembersDAO();		//static 객체생성 안하고 사용가능 (new)
	
	public static MembersDAO getInstance() {
		return instance;
		
	}
	
	private MembersDAO() {
		
		
	}
	
	private Connection getConnection() {
		try {
			InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/basicjsp");	//connection 객체 찾기
			Connection conn = ds.getConnection(); // connection 객체를 할당 받아야 함
			return conn;
		}
		catch(Exception e)
		{
			System.out.println("데이터베이스 연결에 문제가 발생했습니다.");
			return null;
		}
	}
	
	public int userCheck(String id, String passwd) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 저장하는 객체
		int result = -1;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 값을 할당받아옴
			
			String sql = "select id, passwd from members where id=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				
				String rid = rs.getString("id");	//테이블의 컬럼명으로 값을 가져온다.
				String rpasswd = rs.getString("passwd");
				if(id.equals(rid) && passwd.equals(rpasswd)){	//여기서 id는 String id = request.getParameter("id");로 사용자가 입력한 id
					
					result = 1; //아이디 패스워드 모두 올바름 (인증 성공)
				}
				else
				{
					result = 0; //패스워드 틀림
				}
			}
			else
			{
				result = -1; //해당 아이디 없음
			}
			
			
			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("아이디, 패스워드 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null){
				try {
					rs.close();
				}
				catch(SQLException se) {
					
				}
				
			}
			
			if(pstmt != null){
				try {
					pstmt.close();
				}
				catch(SQLException se) {
					
				}
				
			}
			
			if(conn != null){
				try {
					conn.close();
				}
				catch(SQLException se) {
					
				}
				
			}
			
		}
		
		return result;
		
	}
	
	
	
	

}
