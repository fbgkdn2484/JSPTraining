package reply;

import java.sql.*;
import javax.sql.*; 	
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class ReplyDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static ReplyDAO instance = new ReplyDAO();
	
	public static ReplyDAO getInstance() {		//싱글턴 패턴 하나를 만들어서 공유함으로써, 오버헤드를 줄임
		return instance;
	}
	
	private ReplyDAO() {
		
	}
	
	private Connection getConnection() {
		try {
			InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/booksite");	//connection 객체 찾기
			Connection conn = ds.getConnection(); // connection 객체를 할당 받아야 함
			return conn;
		}
		catch(Exception e)
		{
			System.out.println("데이터베이스 연결에 문제가 발생했습니다.");
			return null;
		}
	}
	
	
public int userCheck(String id, String passwd) {	//세션 처리하기 때문에 필요 X
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = -1;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select id, passwd from reply where id=?";
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
			System.out.println("member 테이블의 아이디, 패스워드 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	public void insertReply(ReplyVO ariicle) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			String sql = "insert into reply(rwriter, reply, rreg_date, ref)";
			sql += "values(?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, ariicle.getRwriter());
			pstmt.setString(2, ariicle.getReply());
			pstmt.setInt(3, ariicle.getRef());
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("reply 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			/*
			 * if(pstmt != null){ pstmt.close(); }		//try문 catch문 사용 필요
			 */
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
		
	}
	
	public int getArticleCount(int ref) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;				//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select count(*) from reply where ref = ?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, ref);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				result = rs.getInt(1);		//첫번째 칼럼을 가져온다는 뜻
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("reply 테이블의 자료 수 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	
	public List<ReplyVO> getArticles(int ref){			//자바 문법으로 여러개의 데이터를 가져올 때 사용하는 것 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<ReplyVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from reply where ref = ? order by rnum";		//페이징 처리를 위해
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, ref);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<ReplyVO>();		//배열 형태로 사용	end를 지정함으로써 10개만 가져옴 가변은 오버헤드를 많이 차지하기 때문에
				do {				//먼저 실행하고 조건 판별
					ReplyVO article = new ReplyVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setRnum(rs.getInt("rnum"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
					article.setRwriter(rs.getString("rwriter"));
					article.setReply(rs.getNString("reply"));
					article.setRreg_date(rs.getTimestamp("rreg_date"));
					article.setRef(rs.getInt("ref"));
					alist.add(article);
				}
				while(rs.next());
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("freeboard 테이블의 자료 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
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
		
		return alist;		//집합 반환
		
	}
	
	
	public int deleteFreeboard(int rnum) {	//세션이 있기 때문에 비밀번호 생략
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
					
			String sql = "delete from reply where rnum = ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, rnum);
			pstmt.executeUpdate();	

		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("reply 테이블의 글 삭제에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
				
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
