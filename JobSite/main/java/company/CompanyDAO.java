package company;

import java.sql.*;
import javax.sql.*;

import job.JobVO;
import members.MembersVO;

import javax.naming.*;

import java.util.ArrayList;
import java.util.List;

public class CompanyDAO {				//쿼리문 하나 마다 메서드 생성해서 사용

	private static CompanyDAO instance = new CompanyDAO();
	
	public static CompanyDAO getInstance() {		//싱글턴 패턴 하나를 만들어서 공유함으로써, 오버헤드를 줄임
		return instance;
	}
	
	private CompanyDAO() {
		
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
			
			String sql = "select comp_id, comp_passwd from company where comp_id=?";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);	//위치 홀더 형태로 값 대입하기
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
			
			if(rs.next())
			{//값이 있으면 참 없으면 거짓
				
				String rid = rs.getString("comp_id");	//테이블의 컬럼명으로 값을 가져온다.
				String rpasswd = rs.getString("comp_passwd");
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
			System.out.println("company 테이블의 아이디, 패스워드 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			
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
		System.out.println("idCheck 오는지");
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "select * from company where comp_id=?";
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
			System.out.println("company 테이블의 아이디 확인에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
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
	 * String sql = "select rnk from company where id=?"; pstmt =
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
	 * e.printStackTrace(); System.out.println("company 테이블의 아이디 확인에 문제가 발생했습니다.");
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

	
	public void insertcompany(CompanyVO article) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			String sql = "insert into company(comp_id, comp_user_name, comp_passwd, COMP_TEL, comp_num, comp_name, comp_img, COMP_EMPL, COMP_HEAD, COMP_TYPE, COMP_DATE, COMP_SALE, COMP_HTTP, COMP_ADDR, comp_reg_date)";
			sql += "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, article.getComp_id());
			pstmt.setString(2, article.getComp_user_name());
			pstmt.setString(3, article.getComp_passwd());
			pstmt.setString(4, article.getCOMP_TEL());
			pstmt.setString(5, article.getComp_num());
			pstmt.setString(6, article.getComp_name());
			pstmt.setString(7, article.getComp_img());
			pstmt.setString(8, article.getCOMP_EMPL());
			pstmt.setInt(9, article.getCOMP_HEAD());
			pstmt.setString(10, article.getCOMP_TYPE());
			pstmt.setTimestamp(11, article.getCOMP_DATE());
			pstmt.setInt(12, article.getCOMP_SALE());
			pstmt.setString(13, article.getCOMP_HTTP());
			pstmt.setString(14, article.getCOMP_ADDR());
			
			
			
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("company 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
	}
	
	public int updateCompany(CompanyVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			/* System.out.println("되겠냐?? ㅋ"); */
			
			String sql = "update company set comp_user_name = ?, COMP_TEL = ?, comp_num = ?, comp_name = ?, comp_img = ?, COMP_EMPL = ?, COMP_HEAD = ?, COMP_TYPE = ?, COMP_DATE = ?, COMP_SALE = ?, COMP_HTTP = ?, COMP_ADDR = ? where comp_id= ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, article.getComp_user_name());
			pstmt.setString(2, article.getCOMP_TEL());	
			pstmt.setString(3, article.getComp_num());
			pstmt.setString(4, article.getComp_name());
			pstmt.setString(5, article.getComp_img());
			pstmt.setString(6, article.getCOMP_EMPL());
			pstmt.setInt(7, article.getCOMP_HEAD());	
			pstmt.setString(8, article.getCOMP_TYPE());
			pstmt.setTimestamp(9, article.getCOMP_DATE());
			pstmt.setInt(10, article.getCOMP_SALE());
			pstmt.setString(11, article.getCOMP_HTTP());
			pstmt.setString(12, article.getCOMP_ADDR());
			pstmt.setString(13, article.getComp_id());
			
			System.out.println("article.getComp_img() : " + article.getComp_img() );
			System.out.println("article.getComp_name() : " + article.getComp_name() );
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

	/*
	
	public void insertCompcompany(CompanyVO ariicle) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			
			String sql = "insert into company(id, passwd, name, rnk, tel, reg_date)";
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
			System.out.println("company 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
	}
	
	
	
	
	public List<CompanyVO> getArticles(int start, int end){			//자바 문법으로 여러개의 데이터를 가져올 때 사용하는 것 페이징 처리를 위해 매개변수 2개 가져옴 
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		List<CompanyVO> alist = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from company order by reg_date desc limit ?, ?";		//페이징 처리를 위해
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setInt(1, start-1);		//오라클의 경우 1부터 가져오기 때문에 -1을 주어 2가지 상황 모두 사용가능
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻
			{//값이 있으면 참 없으면 거짓
				
				alist = new ArrayList<CompanyVO>(end);		//배열 형태로 사용	end를 지정함으로써 10개만 가져옴 가변은 오버헤드를 많이 차지하기 때문에
				do {				//먼저 실행하고 조건 판별
					CompanyVO article = new CompanyVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
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
			System.out.println("company 테이블의 자료 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
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
	
	
	
	//글 수정을 위한 상세보기
	public CompanyVO getArticleUpdate(String id){			//하나만 전달 받기 때문에 Lisg사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		CompanyVO article = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from company where id = ?";		
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
			{				
							//먼저 실행하고 조건 판별
				article = new CompanyVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
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
	
	*/
	
	
	/*
	
	public int updateMember(CompanyVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
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
	
	*/	
	
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
	
	
/*
	public int update(CompanyVO article) {	//리턴 타입 int로 선언 article로 값을 전달 받음
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		int result = 0;
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
			
			String sql = "update company set name = ?, tel = ?, birth = ?, addr = ?, img = ? where id=?";
			pstmt = conn.prepareStatement(sql);	

			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getTel());	
			pstmt.setTimestamp(3, article.getBirth());
			pstmt.setString(4, article.getAddr());
			pstmt.setString(5, article.getImg());
			pstmt.setString(6, article.getId());

			
			pstmt.executeUpdate();	//선 업데이트 후 조회문 실행하겠다는 의미
			

				
				
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("company 테이블의 글 수정에 문제가 발생했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			

			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
			
		}
		
		return result;
		
	}
	
	*/
	

	
	public void updateimg(String id) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();

			String sql = "update company set img = '' where id=?";
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
	
	//상세 글 보기
		public CompanyVO getArticle(String id){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
				
				Connection conn = null;		//데이터베이스 연결 객체
				PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
				ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
				CompanyVO article = null;		//초기값
				
				try {
					conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
					
					String sql = "select * from company where comp_id = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
					pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
					
					if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
					{				

						article = new CompanyVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
						article.setComp_id(rs.getString("comp_id"));
						article.setComp_passwd(rs.getString("comp_passwd"));
						article.setComp_user_name(rs.getString("comp_user_name"));		
						article.setCOMP_TEL(rs.getString("COMP_TEL"));
						article.setComp_num(rs.getString("comp_num"));
						article.setComp_name(rs.getString("comp_name"));
						article.setComp_img(rs.getString("comp_img"));
						article.setCOMP_EMPL(rs.getString("COMP_EMPL"));
						article.setCOMP_HEAD(rs.getInt("COMP_HEAD"));
						article.setCOMP_TYPE(rs.getString("COMP_TYPE"));
						article.setCOMP_DATE(rs.getTimestamp("COMP_DATE"));
						article.setCOMP_SALE(rs.getInt("COMP_SALE"));
						article.setCOMP_HTTP(rs.getString("COMP_HTTP"));
						article.setCOMP_ADDR(rs.getString("COMP_ADDR"));
						
						
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
		
	
		public List<CompanyVO> getArticles(int start, int end) {
			Connection conn = null;
			PreparedStatement pstmt = null; // query 실행
			ResultSet rs = null;
			List<CompanyVO> articleList = null;
			//System.out.println(start + " - " + end);
			try {			
				conn = getConnection();			
				
				String sql = "select * from company order by COMP_SALE desc limit ?, ?";
				pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery(); //4. sql query 실행
				
				if(rs.next()) {
					articleList = new ArrayList<CompanyVO>();
					do {
						CompanyVO article = new CompanyVO();
						
						article.setComp_id(rs.getString("comp_id"));
						article.setComp_user_name(rs.getString("comp_user_name"));
						article.setComp_passwd(rs.getString("comp_passwd"));
						article.setCOMP_TEL(rs.getString("COMP_TEL"));
						article.setComp_num(rs.getString("comp_num"));
						article.setComp_name(rs.getString("comp_name"));
						article.setComp_img(rs.getString("comp_img"));
						article.setCOMP_EMPL(rs.getString("COMP_EMPL"));
						article.setCOMP_HEAD(rs.getInt("COMP_HEAD"));
						article.setCOMP_TYPE(rs.getString("COMP_TYPE"));
						article.setCOMP_DATE(rs.getTimestamp("COMP_DATE"));
						article.setCOMP_SALE(rs.getInt("COMP_SALE"));
						article.setCOMP_HTTP(rs.getString("COMP_HTTP"));
						article.setCOMP_ADDR(rs.getString("COMP_ADDR"));

						
						articleList.add(article);
					} while(rs.next());				
				}
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("job 테이블에 새로운 레코드 추가를 실패했습니다.");
			} finally {
				//5. 자원 해제
				if(rs != null) try {rs.close();} catch(SQLException se) { }
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
				if(conn != null) try {conn.close();} catch(SQLException se) { }
			}
			
			return articleList;
		}
		
		public List<JoinCompanyVO> getArticlesJ(int start, int end) {
			Connection conn = null;
			PreparedStatement pstmt = null; // query 실행
			ResultSet rs = null;
			List<JoinCompanyVO> articleList = null;
			//System.out.println(start + " - " + end);
			try {			
				conn = getConnection();			
				
				String sql = "select a.comp_user_name, a.comp_name, a.comp_img, a.COMP_EMPL, a.COMP_HEAD, a.COMP_TYPE, a.COMP_DATE, a.COMP_SALE, a.COMP_HTTP, a.comp_addr, b.job_num, \r\n"
						+ "		b.job_subject, b.job_content, b.job_id, b.job_image, b.job_sdate, b.job_edate, b.job_caeer, b.job_stu, b.job_empl, b.job_money,\r\n"
						+ "		b.job_up, b.job_area, b.job_cond, b.job_job, b.job_head, b.job_readcount\r\n"
						+ "from company a\r\n"
						+ "inner join job b\r\n"
						+ "on a.comp_id = b.job_id order by COMP_SALE desc limit ?, ?";
				
				pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
				pstmt.setInt(1, start-1);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery(); //4. sql query 실행
				
				if(rs.next()) {
					articleList = new ArrayList<JoinCompanyVO>();
					do {
						JoinCompanyVO article = new JoinCompanyVO();
						
						article.setComp_user_name(rs.getString("comp_user_name"));;
						article.setComp_name(rs.getString("comp_name"));
						article.setComp_img(rs.getString("comp_img"));
						article.setCOMP_EMPL(rs.getString("COMP_EMPL"));
						article.setCOMP_HEAD(rs.getInt("COMP_HEAD"));
						article.setCOMP_TYPE(rs.getString("COMP_TYPE"));
						article.setCOMP_DATE(rs.getTimestamp("COMP_DATE"));
						article.setCOMP_SALE(rs.getInt("COMP_SALE"));
						article.setCOMP_HTTP(rs.getString("COMP_HTTP"));
						article.setCOMP_ADDR(rs.getString("COMP_ADDR"));
						article.setJob_num(rs.getInt("job_num"));
						article.setJob_subject(rs.getString("job_subject"));
						article.setJob_content(rs.getString("job_content"));
						article.setJob_id(rs.getString("job_id"));
						article.setJob_image(rs.getString("job_image"));
						article.setJob_sdate(rs.getTimestamp("job_sdate"));
						article.setJob_edate(rs.getTimestamp("job_edate"));
						article.setJob_caeer(rs.getString("job_caeer"));
						article.setJob_stu(rs.getString("job_stu"));
						article.setJob_empl(rs.getString("job_empl"));
						article.setJob_money(rs.getString("job_money"));
						article.setJob_up(rs.getString("job_up"));
						article.setJob_area(rs.getString("job_area"));
						article.setJob_cond(rs.getString("job_cond"));
						article.setJob_job(rs.getString("job_job"));
						article.setJob_head(rs.getInt("job_head"));
						article.setJob_readcount(rs.getInt("job_readcount"));
					
						articleList.add(article);
						
						System.out.println("job " + rs.getTimestamp("job_edate"));
						
					} while(rs.next());				
				}
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("job 테이블에 새로운 레코드 추가를 실패했습니다.");
			} finally {
				//5. 자원 해제
				if(rs != null) try {rs.close();} catch(SQLException se) { }
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
				if(conn != null) try {conn.close();} catch(SQLException se) { }
			}
			
			return articleList;
		}
		
		
		
		public int getArticleCount() {
			
			Connection conn = null;		//데이터베이스 연결 객체
			PreparedStatement pstmt = null;		//query 실행 객체
			ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
			int result = 0;				//초기값
			
			try {
				conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴
				
				String sql = "select count(*) from company";
				pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
				rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행
				
				if(rs.next())
				{//값이 있으면 참 없으면 거짓
					result = rs.getInt(1);		//첫번째 칼럼을 가져온다는 뜻
					
				}			
			}
			catch(Exception e){
				
				e.printStackTrace();
				System.out.println("company 테이블의 인원 수 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
				
			}
			
			finally{
				
				//5. 과부하가 걸리지 않도록 연결을 끊어주어야 한다. (자원 해제)
				if(rs != null) try {rs.close();} catch(SQLException se) {}
				
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
					
				
				if(conn != null) try {conn.close();} catch(SQLException se) {}
				
			}
			
			return result;
			
		}
		
		public int getArticleCount(String sword) {			//검색기능 
			Connection conn = null;
			PreparedStatement pstmt = null; // query 실행
			ResultSet rs = null;
			int result = 0;
			
			try {			
				conn = getConnection();			
				
				String sql = "select * from company where comp_name like ?";				//특수 기호기 때문에 인식 불가
				pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
				pstmt.setString(1, sword);

				rs = pstmt.executeQuery(); //4. sql query 실행
				
				if(rs.next()) {
					result = rs.getInt(1);				
				} 			
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("company 테이블의 레코드 전체수 검색을 실패했습니다.");
			} finally {
				//5. 자원 해제
				if(rs != null) try {rs.close();} catch(SQLException se) { }
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
				if(conn != null) try {conn.close();} catch(SQLException se) { }
			}
			
			return result;
		}
		
		public List<CompanyVO> getArticles(int start, int end, String sword) {
			Connection conn = null;
			PreparedStatement pstmt = null; // query 실행
			ResultSet rs = null;
			List<CompanyVO> articleList = null;
			//System.out.println(start + " - " + end);
			try {			
				conn = getConnection();			
				
				String sql = "select * from company where comp_name like ? order by bnum desc limit ?, ?";
				pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
				pstmt.setString(1, sword);
				pstmt.setInt(2, start-1);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery(); //4. sql query 실행
				
				if(rs.next()) {
					articleList = new ArrayList<CompanyVO>();
					do {
						CompanyVO article = new CompanyVO();
						
						article.setComp_id(rs.getString("comp_id"));
						article.setComp_passwd(rs.getString("comp_passwd"));
						article.setComp_user_name(rs.getString("comp_user_name"));		
						article.setCOMP_TEL(rs.getString("COMP_TEL"));
						article.setComp_num(rs.getString("comp_num"));
						article.setComp_name(rs.getString("comp_name"));
						article.setComp_img(rs.getString("comp_img"));
						article.setCOMP_EMPL(rs.getString("COMP_EMPL"));
						article.setCOMP_HEAD(rs.getInt("COMP_HEAD"));
						article.setCOMP_TYPE(rs.getString("COMP_TYPE"));
						article.setCOMP_DATE(rs.getTimestamp("COMP_DATE"));
						article.setCOMP_SALE(rs.getInt("COMP_SALE"));
						article.setCOMP_HTTP(rs.getString("COMP_HTTP"));
						article.setCOMP_ADDR(rs.getString("COMP_ADDR"));
						
						articleList.add(article);
					} while(rs.next());				
				}
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("job 테이블에 새로운 레코드 추가를 실패했습니다.");
			} finally {
				//5. 자원 해제
				if(rs != null) try {rs.close();} catch(SQLException se) { }
				if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
				if(conn != null) try {conn.close();} catch(SQLException se) { }
			}
			
			return articleList;
		}
	
}
