package members;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class MembersDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static MembersDAO instance = new MembersDAO();
	
	public static MembersDAO getInstance() {		//싱글턴 패턴 하나를 만들어서 공유함으로써, 오버헤드를 줄임
		return instance;
	}
	
	private MembersDAO() {
		
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
			System.out.println("jobsite 데이터베이스 연결에 문제가 발생했습니다.");
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
			System.out.println("members 테이블의 아이디, 패스워드 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	public int idCheck(String id) {	//전달받은 아이디와 패스워드가 테이블에 저장되어있는지 확인해주는 로직
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = -1;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select * from members where id=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{	//값이 있으면 참 없으면 거짓
				
				result = 1; //아이디 패스워드 모두 올바름 (아이디가 이미 존재함)
				
			}
			else
			{
				result = -1; //해당 아이디 없음
			}
			

		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("members 테이블의 아이디 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	/*
	 * public int rnkCheck(String id) { //전달받은 아이디와 패스워드가 테이블에 저장되어있는지 확인해주는 로직
	 * 
	 * Connection conn = null; //데이터베이스 연결 객체 PreparedStatement pstmt = null;
	 * //query 실행 객체 ResultSet rs = null; //select문 실행 결과를 받아오는(저장하는) 객체 int result
	 * = 1;
	 * 
	 * try { conn = getConnection(); //위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
	 * 
	 * String sql = "select rnk from members where id=?"; pstmt =
	 * conn.prepareStatement(sql); //3. sql을 샐행하기 위한 객체를 생성 pstmt.setString(1, id);
	 * //위치 홀더 형태로 값 대입하기 rs = pstmt.executeQuery(); //4. select가 아닌 sql query 실행
	 * 
	 * if(rs.next()) { //값이 있으면 참 없으면 거짓
	 * 
	 * result = rs.getInt(1); //첫번째 칼럼을 가져온다는 뜻
	 * 
	 * }
	 * 
	 * 
	 * } catch(Exception e){
	 * 
	 * e.printStackTrace(); System.out.println("members 테이블의 아이디 확인에 문제가 발생했습니다.");
	 * //실행한 콘솔창에 드러남
	 * 
	 * }
	 * 
	 * finally{
	 * 
	 * //5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제) if(rs != null) try {rs.close();}
	 * catch(SQLException se) {}
	 * 
	 * if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
	 * 
	 * 
	 * if(conn != null) try {conn.close();} catch(SQLException se) {}
	 * 
	 * }
	 * 
	 * return result;
	 * 
	 * }
	 */

	
	public void insertMembers(MembersVO article) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			String sql = "insert into members(id, passwd, name, birth, tel, addr, img, reg_date)";
			sql += "values(?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getPasswd());
			pstmt.setString(3, article.getName());
			pstmt.setTimestamp(4, article.getBirth());
			pstmt.setString(5, article.getTel());
			pstmt.setString(6, article.getAddr());
			pstmt.setString(7, article.getImg());
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("members 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
	}
	
	public void insertCompMembers(MembersVO ariicle) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			
			String sql = "insert into members(id, passwd, name, rnk, tel, reg_date)";
			sql += "values(?, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, ariicle.getId());
			pstmt.setString(2, ariicle.getPasswd());
			pstmt.setString(3, ariicle.getName());
			pstmt.setString(4, "1");
			pstmt.setString(5, ariicle.getTel());
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			

		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("members 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
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
			
			String sql = "select count(*) from members";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				result = rs.getInt(1);		//첫번째 칼럼을 가져온다는 뜻
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("members 테이블의 인원 수 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	/*
	public List<MembersVO> getArticles(int start, int end){			//자바 문법으로 여러개의 데이터를 가져올 때 사용하는 것 페이징 처리를 위해 매개변수 2개 가져옴 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<MembersVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from members order by reg_date desc limit ?, ?";		//페이징 처리를 위해
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, start-1);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<MembersVO>(end);		//배열 형태로 사용	end를 지정함으로써 10개만 가져옴 가변은 오버헤드를 많이 차지하기 때문에
				do {				//먼저 실행하고 조건 판별
					MembersVO article = new MembersVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setId(rs.getString("id"));
					article.setPasswd(rs.getString("passwd"));
					article.setName(rs.getString("name"));
					article.setRnk(rs.getString("rnk"));
					article.setTel(rs.getString("tel"));
					article.setReg_date(rs.getTimestamp("reg_date"));

					
					alist.add(article);
				}
				while(rs.next());
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("members 테이블의 자료 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return alist;		//집합 반환
		
	}
	*/
	
	//상세 글 보기
	public MembersVO getArticle(String id){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
			ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
			MembersVO article = null;		//초기값
			
			System.out.println("members 되나??");
			
			try {
				conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
				
				String sql = "select * from members where id = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
				
				if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
				{				

					article = new MembersVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
					article.setId(rs.getString("id"));
					article.setPasswd(rs.getString("passwd"));
					article.setName(rs.getString("name"));
					article.setBirth(rs.getTimestamp("birth"));
					article.setAddr(rs.getString("addr"));
					article.setTel(rs.getString("tel"));
					article.setImg(rs.getString("img"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					
				}			
			}
			catch(Exception e){
				
				e.printStackTrace();
				System.out.println("members 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
				
			}
			
			finally{
				if(rs != null) try {rs.close();} catch(SQLException se) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				if(conn != null) try {conn.close();} catch(SQLException se) {}
			}
			
			return article;		//집합 반환
	}
	
	
	
	//글 수정을 위한 상세보기
	public MembersVO getArticleUpdate(String id){			//하나만 전달 받기 때문에 Lisg사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		MembersVO article = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from members where id = ?";		
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
			{				
							//먼저 실행하고 조건 판별
				article = new MembersVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
				article.setId(rs.getString("id"));
				article.setPasswd(rs.getString("passwd"));
				article.setName(rs.getString("name"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("member 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return article;		//집합 반환
	}
	
	
	public int updateMember(MembersVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select passwd from member where id=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, article.getId());	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			/* System.out.println("---select 실행 : " + article.getNum()); */
			
			if(rs.next())
			{
				
				String rpasswd = rs.getString("passwd");
				System.out.println("---passwd : " + rpasswd);
				if(rpasswd.equals(article.getPasswd())){
					
					result = 1; //패스워드 모두 올바름 (인증 성공)
					
					sql = "update board set passwd = ?, name = ? where id = ?";
					pstmt = conn.prepareStatement(sql);		
					pstmt.setString(1, article.getPasswd());
					pstmt.setString(2, article.getName());
					pstmt.setString(3, article.getId());

					
					
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
			System.out.println("member 테이블의 글 수정에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
		return result;
		
	}
	
	
	
	public int deleteMember(String id, String passwd) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select passwd from member where id=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			/* System.out.println("---select 실행 : " + article.getNum()); */
			
			if(rs.next())
			{
				
				String rpasswd = rs.getString("passwd");
				System.out.println("---passwd : " + rpasswd);
				if(rpasswd.equals(passwd)){
					
					result = 1; //패스워드 모두 올바름 (인증 성공)
					
					sql = "delete from member where id = ?";
					pstmt = conn.prepareStatement(sql);		
					pstmt.setString(1, id);
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
			System.out.println("member 테이블의 글 삭제에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
			//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
			if(rs != null) try {rs.close();} catch(SQLException se) {}
				
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
				
			
			if(conn != null) try {conn.close();} catch(SQLException se) {}
				
		}
		
		return result;
		
	}
	
	
	
	public int updateMembers(MembersVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "update members set name = ?, tel = ?, birth = ?, addr = ?, img = ? where id=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getTel());	
			pstmt.setTimestamp(3, article.getBirth());
			pstmt.setString(4, article.getAddr());
			pstmt.setString(5, article.getImg());
			pstmt.setString(6, article.getId());
			
			
			pstmt.executeUpdate();	//선 업데이트 후 조회문 실행하겠다는 의미
			
			/* System.out.println("2 : " + pstmt); */
				
				
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("members 테이블의 글 수정에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			

			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
			
		}
		
		return result;
		
	}
	
	public void updateimg(String id) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();

			String sql = "update members set img = '' where id=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setString(1, id);
			
			pstmt.executeUpdate(); //4. sql query 실행

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("book 테이블의 글 삭제를 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}

		
	}
	
	
}
