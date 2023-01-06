package board;

import java.sql.*;
import javax.sql.*; 	
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {		//싱글턴 패턴
		return instance;
	}
	
	private BoardDAO() {
		
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
	
	
public int userCheck(String id, String passwd) {	//전달받은 아이디와 패스워드가 테이블에 저장되어있는지 확인해주는 로직
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = -1;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
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
	
	public void insertBoard(BoardVO ariicle) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			//insert into board(writer, email, subject, passwd, reg_date, content) 
			//values ('김경민', 'aaa@aaa.com', '제목1', '123', now(), '제목1');
			/*
			 * String sql =
			 * "insert into board(writer, email, subject, passwd, reg_date, content) " +
			 * "values(?, ?, ?, ?, now(), ?)";
			 */
			
			String sql = "insert into board(writer, email, subject, passwd, reg_date, content)";
			sql += "values(?, ?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, ariicle.getWriter());
			pstmt.setString(2, ariicle.getEmail());
			pstmt.setString(3, ariicle.getSubject());
			pstmt.setString(4, ariicle.getPasswd());
			pstmt.setString(5, ariicle.getContent());
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("테이블 삽입에 문제가 발생했습니다.");
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
	
	public int getArticleCount() {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;				//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				result = rs.getInt(1);		//첫번째 칼럼을 가져온다는 뜻
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("board 테이블의 자료 수 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	
	public List<BoardVO> getArticles(){			//자바 문법 여러개의 데이터를 가져올 때 사용하는 것으로 다수 개의 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<BoardVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from board order by num desc";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<BoardVO>();		//배열 형태로 사용
				do {				//먼저 실행하고 조건 판별
					BoardVO article = new BoardVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setNum(rs.getInt("num"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getNString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					
					alist.add(article);
				}
				while(rs.next());
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("board 테이블의 자료 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	
	public BoardVO getArticle(int num){			//하나만 전달 받기 때문에 Lisg사용 x
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
			ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
			BoardVO article = null;		//초기값
			
			try {
				conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
				
				String sql = "select * from board where num = ?;";
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
				
				if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
				{				
								//먼저 실행하고 조건 판별
					article = new BoardVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setNum(rs.getInt("num"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getNString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setContent(rs.getString("content"));
					
				}			
			}
			catch(Exception e){
				
				e.printStackTrace();
				System.out.println("board 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
				
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
			
			return article;		//집합 반환
	}
	
	
	
}
