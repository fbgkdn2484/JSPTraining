package job;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import company.CompanyVO;


public class JobDAO {

	private static JobDAO instance = new JobDAO();
	
	public static JobDAO getInstance() {
		return instance;
	}
	
	private JobDAO() { }
	
	private Connection getConnection() {		
		try {
			InitialContext ic = new InitialContext(); // JNDI 서버 객체 생성 
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/jobsite"); // connection 객체 찾기
			Connection conn = ds.getConnection(); // connection 객체를 할당 받음
			return conn;
		} catch(Exception e) {
			System.out.println("데이터베이스 연결에 문제가 발생했습니다.");
			return null;
		}				
	}
	
	
	
	public void insertjob(JobVO article) {
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체
		
		try{	
			
			conn = getConnection();
			
			String sql = "insert into job(job_id, job_subject, job_content, job_image, job_sdate, job_edate, job_caeer, job_stu, job_empl, job_money, job_up, job_area, job_cond, job_job, job_head)";
			sql += "values(?, ?, ?, ?, now(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			//위치 홀더 형태로 값 대입하기
			pstmt.setString(1, article.getJob_id());
			
			System.out.println("---getJob_id : " + article.getJob_id());
			pstmt.setString(2, article.getJob_subject());
			pstmt.setString(3, article.getJob_content());
			pstmt.setString(4, article.getJob_image());
			pstmt.setTimestamp(5, article.getJob_edate());
			pstmt.setString(6, article.getJob_caeer());
			pstmt.setString(7, article.getJob_stu());
			pstmt.setString(8, article.getJob_empl());
			pstmt.setString(9, article.getJob_money());
			pstmt.setString(10, article.getJob_up());
			pstmt.setString(11, article.getJob_area());
			pstmt.setString(12, article.getJob_cond());
			pstmt.setString(13, article.getJob_job());
			pstmt.setInt(14, article.getJob_head());
			
			
			
			pstmt.executeUpdate();	//4. select가 아닌 sql query 실행
			
			/* response.sendRedirect("list.jsp");  //jsp에서 사용하는 형식  */
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("job 테이블 삽입에 문제가 발생했습니다.");
		}
		finally{
			
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
			
		}
		
	}
	
	
	public void updatejob(JobVO article) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();
			
			String sql = "update job set job_subject=?, job_content=?, job_image=?, job_edate=?, job_caeer=?, job_stu=?, job_empl=? , job_money=?, job_up=?, job_area=?, job_cond=?, job_job=?, job_head=? where Job_id=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			
			System.out.println("---getJob_id : " + article.getJob_id());
			
			pstmt.setString(1, article.getJob_subject());
			pstmt.setString(2, article.getJob_content());
			pstmt.setString(3, article.getJob_image());
			pstmt.setTimestamp(4, article.getJob_edate());
			pstmt.setString(5, article.getJob_caeer());
			pstmt.setString(6, article.getJob_stu());
			pstmt.setString(7, article.getJob_empl());
			pstmt.setString(8, article.getJob_money());
			pstmt.setString(9, article.getJob_up());
			pstmt.setString(10, article.getJob_area());
			pstmt.setString(11, article.getJob_cond());
			pstmt.setString(12, article.getJob_job());
			pstmt.setInt(13, article.getJob_head());
			pstmt.setString(14, article.getJob_id());
			
			
			
			pstmt.executeUpdate(); //4. sql query 실행

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블의 글 수정을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}

	}
	
	
	
	
	
	
	/*
	public void insertjob(JobVO article) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		
		try {			
			conn = getConnection();
			
			String sql = "insert into job(bkind, btitle, author, pubcom, pubdate, page, bimage, bcontent)";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setString(1, article.getBkind());
			pstmt.setString(2, article.getBtitle());
			pstmt.setString(3, article.getAuthor());
			pstmt.setString(4, article.getPubcom());
			pstmt.setTimestamp(5, article.getPubdate());
			pstmt.setInt(6, article.getPage());
			pstmt.setString(7, article.getBimage());
			pstmt.setString(8, article.getBcontent());
			
			pstmt.executeUpdate(); //4. sql query 실행
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블에 새로운 레코드 추가에 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
	}
	*/
	
	public List<JobVO> getArticles(int start, int end) {
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		List<JobVO> articleList = null;
		//System.out.println(start + " - " + end);
		try {			
			conn = getConnection();			
			
			String sql = "select * from job order by job_num desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				articleList = new ArrayList<JobVO>();
				do {
					JobVO article = new JobVO();
					
					article.setJob_num(rs.getInt("job_num"));
					article.setJob_id(rs.getString("job_id"));
					article.setJob_subject(rs.getString("job_subject"));
					article.setJob_content(rs.getString("job_content"));
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
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		int result = 0;
		
		try {			
			conn = getConnection();			
			
			String sql = "select count(*) from job";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				result = rs.getInt(1);				
			} 			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블의 레코드 전체수 검색을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
		
		return result;
	}
	
/*
	
	public JobVO getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		JobVO article = null;
		
		try {			
			conn = getConnection();	
			
			String sql = "select * from job where bnum=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				article = new JobVO();
				article.setBnum(rs.getInt("bnum"));
				article.setBkind(rs.getString("bkind"));
				article.setBtitle(rs.getString("btitle"));
				article.setAuthor(rs.getString("author"));
				article.setPubcom(rs.getString("pubcom"));
				article.setPubdate(rs.getTimestamp("pubdate"));
				article.setPage(rs.getInt("page"));
				article.setBimage(rs.getString("bimage"));
				article.setBcontent(rs.getString("bcontent"));			
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블에 상세보기의 레코드 검색을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
		
		return article;
	}	

*/
	
	public void deletejob(int num) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();

			String sql = "delete from job where bnum=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate(); //4. sql query 실행

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블의 글 삭제를 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}

	}
	
	
	public int getArticleCount(String sword) {			//검색기능 
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		int result = 0;
		
		try {			
			conn = getConnection();			
			
			String sql = "select * from job where btitle like ?";				//특수 기호기 때문에 인식 불가
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setString(1, sword);

			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				result = rs.getInt(1);				
			} 			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("job 테이블의 레코드 전체수 검색을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
		
		return result;
	}
	
	public List<JobVO> getArticles(int start, int end, String sword) {
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		List<JobVO> articleList = null;
		//System.out.println(start + " - " + end);
		try {			
			conn = getConnection();			
			
			//select b.* 
			//from ( select rownum as rnum, a.*
			//	     from (select * from board order by num desc) a ) b
			//where b.rnum >= 1 and b.rnum <= 10;
			String sql = "select * from job where btitle like ? order by bnum desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setString(1, sword);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				articleList = new ArrayList<JobVO>();
				do {
					JobVO article = new JobVO();
					
					article.setJob_num(rs.getInt("job_num"));
					article.setJob_id(rs.getString("job_id"));
					article.setJob_subject(rs.getString("job_subject"));
					article.setJob_content(rs.getString("job_content"));
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
	
	public JobVO getArticle(String id){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		JobVO article = null;		//초기값
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from job where job_id = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
			{				

				article = new JobVO();
				
				article.setJob_num(rs.getInt("job_num"));
				article.setJob_id(rs.getString("job_id"));
				article.setJob_subject(rs.getString("job_subject"));
				article.setJob_content(rs.getString("job_content"));
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
	
	
	
}
