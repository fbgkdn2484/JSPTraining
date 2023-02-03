package notice;

import java.sql.*;
import javax.sql.*; 	
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance() {		//싱글턴 패턴 하나를 만들어서 공유함으로써, 오버헤드를 줄임
		return instance;
	}
	
	private NoticeDAO() {
		
	}
	
	private Connection getConnection() {
		try {
			InitialContext ic = new InitialContext();	//우리가 검색해서 사용할 JNDI 서버 객체 생성
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/jobsite");	//connection 객체 찾기
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
			
			String sql = "select id, passwd from member where id=?";
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
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	public void insertnotice(NoticeVO ariicle) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			String sql = "insert into notice(nwriter, nsubject, nreg_date, ncontent)";
			sql += "values( ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, ariicle.getNwriter());
			pstmt.setString(2, ariicle.getNsubject());
			pstmt.setString(3, ariicle.getNcontent());
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("notice 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			/*
			 * if(pstmt != null){ pstmt.close(); }		//try문 catch문 사용 필요
			 */
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
	}
	
	public int getArticleCount() {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;				//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select count(*) from notice";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				result = rs.getInt(1);		//첫번째 칼럼을 가져온다는 뜻
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("notice 테이블의 자료 수 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	
	public List<NoticeVO> getArticles(int start, int end){			//자바 문법으로 여러개의 데이터를 가져올 때 사용하는 것 페이징 처리를 위해 매개변수 2개 가져옴 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<NoticeVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from notice order by nnum desc limit ?, ?";		//페이징 처리를 위해
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, start-1);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<NoticeVO>(end);		//배열 형태로 사용	end를 지정함으로써 10개만 가져옴 가변은 오버헤드를 많이 차지하기 때문에
				do {				//먼저 실행하고 조건 판별
					NoticeVO article = new NoticeVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setNnum(rs.getInt("nnum"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
					article.setNwriter(rs.getString("nwriter"));
					article.setNsubject(rs.getNString("nsubject"));
					article.setNreg_date(rs.getTimestamp("nreg_date"));
					article.setNreadcount(rs.getInt("nreadcount"));
					article.setNcontent(rs.getString("ncontent"));
					
					alist.add(article);
				}
				while(rs.next());
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("notice 테이블의 자료 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return alist;		//집합 반환
		
	}
	
	//상세 글 보기
	public NoticeVO getArticle(int num){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
			ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
			NoticeVO article = null;		//초기값
			
			try {
				conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
				
				String sql = "update notice set nreadcount = nreadcount + 1 where nnum = ?";
				pstmt = conn.prepareStatement(sql);		
				pstmt.setInt(1, num);
				pstmt.executeUpdate();	//선 업데이트 후 조회문 실행하겠다는 의미
				
				
				sql = "select * from notice where nnum = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
				
				if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
				{				
								//먼저 실행하고 조건 판별
					article = new NoticeVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setNnum(rs.getInt("nnum"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
					article.setNwriter(rs.getString("nwriter"));
					article.setNsubject(rs.getNString("nsubject"));
					article.setNreg_date(rs.getTimestamp("nreg_date"));
					article.setNreadcount(rs.getInt("nreadcount"));
					article.setNcontent(rs.getString("ncontent"));
					
				}			
			}
			catch(Exception e){
				
				e.printStackTrace();
				System.out.println("notice 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
				
			}
			
			finally{
				
				//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
				if(rs != null) try {rs.close();} catch(SQLException se) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				if(conn != null) try {conn.close();} catch(SQLException se) {}
				
			}
			
			return article;		//집합 반환
	}
	
	
	//글 수정을 위한 상세보기
	public NoticeVO getArticleUpdate(int num){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		NoticeVO article = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from notice where nnum = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
			{				
							//먼저 실행하고 조건 판별
				article = new NoticeVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
				article.setNnum(rs.getInt("nnum"));		//쿼리문 실행 값을 저장	BoardVO는 레코드 한줄만 저장하고 있다. 때문에 반복문으로 
				article.setNwriter(rs.getString("nwriter"));
				article.setNsubject(rs.getNString("nsubject"));
				article.setNreg_date(rs.getTimestamp("nreg_date"));
				article.setNreadcount(rs.getInt("nreadcount"));
				article.setNcontent(rs.getString("ncontent"));
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("notice 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return article;		//집합 반환
	}
	
	
	public int updatenotice(NoticeVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			/* System.out.println("---select 실행 : " + article.getNum()); */
					
			String sql = "update notice set nsubject = ?, ncontent = ? where nnum = ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, article.getNsubject());
			pstmt.setString(2, article.getNcontent());
			pstmt.setInt(3, article.getNnum());		
			pstmt.executeUpdate(); 	//선 업데이트 후 조회문 실행하겠다는 의미
			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("notice 테이블의 글 수정에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	
	
	public int deletenotice(int num) {	//세션이 있기 때문에 비밀번호 생략
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//게시판의 원글을 삭제할 때는 댓글을 모두 삭제한 후 삭제하여야 한다.
			
			String sql = "delete from reply where ref = ?";		//ref : 원글의 글번호
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
					
			sql = "delete from notice where nnum = ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, num);
			pstmt.executeUpdate();	

		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("notice 테이블의 글 삭제에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	
}
