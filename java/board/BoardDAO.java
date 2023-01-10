package board;

import java.sql.*;
import javax.sql.*; 	
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {		//싱글턴 패턴 하나를 만들어서 공유함으로써, 오버헤드를 줄임
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
	
	
	public List<BoardVO> getArticles(int start, int end){			//자바 문법으로 여러개의 데이터를 가져올 때 사용하는 것 페이징 처리를 위해 매개변수 2개 가져옴 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<BoardVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from board order by num desc limit ?, ?";		//페이징 처리를 위해
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, start-1);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<BoardVO>(end);		//배열 형태로 사용	end를 지정함으로써 10개만 가져옴 가변은 오버헤드를 많이 차지하기 때문에
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
	
	//상세 글 보기
	public BoardVO getArticle(int num){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
			ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
			BoardVO article = null;		//초기값
			
			try {
				conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
				
				String sql = "update board set readcount = readcount + 1 where num = ?";
				pstmt = conn.prepareStatement(sql);		
				pstmt.setInt(1, num);
				pstmt.executeUpdate();	//선 업데이트 후 조회문 실행하겠다는 의미
				
				
				sql = "select * from board where num = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
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
	
	
	//글 수정을 위한 상세보기
	public BoardVO getArticleUpdate(int num){			//하나만 전달 받기 때문에 Lisg사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		BoardVO article = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from board where num = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
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
	
	
	public int updateBoard(BoardVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select passwd from board where num=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, article.getNum());	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			/* System.out.println("---select 실행 : " + article.getNum()); */
			
			if(rs.next())
			{
				
				String rpasswd = rs.getString("passwd");
				System.out.println("---passwd : " + rpasswd);
				if(rpasswd.equals(article.getPasswd())){
					
					result = 1; //패스워드 모두 올바름 (인증 성공)
					
					sql = "update board set writer = ?, email = ?, subject = ?, content = ? where num = ?";
					pstmt = conn.prepareStatement(sql);		
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getContent());
					pstmt.setInt(5, article.getNum());
					
					
					pstmt.executeUpdate();	//선 업데이트 후 조회문 실행하겠다는 의미
				}
				else
				{
					result = 0; //패스워드 틀림
				}
			}

		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("board 테이블의 글 수정에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	
	
	public int deleteBoard(int num, String passwd) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select passwd from board where num=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, num);	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			/* System.out.println("---select 실행 : " + article.getNum()); */
			
			if(rs.next())
			{
				
				String rpasswd = rs.getString("passwd");
				System.out.println("---passwd : " + rpasswd);
				if(rpasswd.equals(passwd)){
					
					result = 1; //패스워드 모두 올바름 (인증 성공)
					
					sql = "delete from board where num = ?";
					pstmt = conn.prepareStatement(sql);		
					pstmt.setInt(1, num);
					pstmt.executeUpdate();	
				}
				else
				{
					result = 0; //패스워드 틀림
				}
			}

		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("board 테이블의 글 삭제에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
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
