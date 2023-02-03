package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import members.MembersVO;



public class UserDAO {

	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO() { }
	
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
	
	
	
	public void insertuser(UserVO article) {	
		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		
		System.out.println("1. user_id : " + article.getUser_id());
		System.out.println("2. user_mid_sdate : " + article.getUser_mid_sdate());
		
		try {			
			conn = getConnection();
			
			String sql = "insert into user(user_id, user_sex, user_mil_mil, user_mil_type, user_mil_rnk, user_stu, user_mid_name,  user_mid_area,  user_mid_sdate,  user_mid_edate,"
									 + "  user_mid_grad,  user_high_name,  user_high_area,  user_high_GED,  user_high_Gdate,  user_high_sdate,  user_high_edate,  user_high_trans,  user_high_grad,  user_high_major,"
									 + "  user_univ_type1,  user_univ_name1,  user_univ_area1,  user_univ_sdate1,  user_univ_edate1,  user_univ_grad1,  user_univ_major1,  user_univ_nm1,  user_univ_cdit1,  user_univ_type2,"
									 + "  user_univ_name2,  user_univ_area2,  user_univ_sdate2,  user_univ_edate2,  user_univ_grad2,  user_univ_major2,  user_univ_nm2,  user_univ_cdit2,  user_univ_type3,  user_univ_name3,"
									 + "  user_univ_area3,  user_univ_sdate3,  user_univ_edate3,  user_univ_grad3,  user_univ_major3,  user_univ_nm3,  user_univ_cdit3,  user_caeer,  user_caeer_name1,  user_caeer_sdate1,"
									 + "  user_caeer_edate1,  user_caeer_leave1,  user_caeer_jobt1,  user_caeer_dept1,  user_caeer_linc1,  user_caeer_area1,  user_caeer_sale1,  user_caeer_name2,  user_caeer_sdate2,  user_caeer_edate2,"
									 + "  user_caeer_leave2,  user_caeer_jobt2,  user_caeer_dept2,  user_caeer_linc2,  user_caeer_area2,  user_caeer_sale2,  user_caeer_name3,  user_caeer_sdate3,  user_caeer_edate3,  user_caeer_leave3,"
									 + "  user_caeer_jobt3,  user_caeer_dept3,  user_caeer_linc3,  user_caeer_area3,  user_caeer_sale3,  user_caeer_name4,  user_caeer_sdate4,  user_caeer_edate4,  user_caeer_leave4,  user_caeer_jobt4,"
									 + "  user_caeer_dept4,  user_caeer_linc4, user_caeer_area4, user_caeer_sale4, user_licen_type1, user_licen_name1, user_licen_publ1, user_licen_pass1, user_licen_date1, user_licen_type2,"
									 + " user_licen_name2, user_licen_publ2, user_licen_pass2, user_licen_date2, user_licen_type3, user_licen_name3, user_licen_publ3, user_licen_pass3, user_licen_date3, reg_date)";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,"
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			
			pstmt.setString(1, article.getUser_id());
			pstmt.setString(2, article.getUser_sex());
			pstmt.setString(3, article.getUser_mil_mil());
			pstmt.setString(4, article.getUser_mil_type());
			pstmt.setString(5, article.getUser_mil_rnk());
			pstmt.setString(6, article.getUser_stu());
			pstmt.setString(7, article.getUser_mid_name());
			pstmt.setString(8, article.getUser_mid_area());
			pstmt.setString(9, article.getUser_mid_sdate());
			pstmt.setString(10, article.getUser_mid_edate());
			pstmt.setString(11, article.getUser_mid_grad());
			pstmt.setString(12, article.getUser_high_name());
			pstmt.setString(13, article.getUser_high_area());
			pstmt.setString(14, article.getUser_high_GED());
			pstmt.setString(15, article.getUser_high_Gdate());
			pstmt.setString(16, article.getUser_high_sdate());
			pstmt.setString(17, article.getUser_high_edate());
			pstmt.setString(18, article.getUser_high_trans());
			pstmt.setString(19, article.getUser_high_grad());
			pstmt.setString(20, article.getUser_high_major());
			pstmt.setString(21, article.getUser_univ_type1());
			pstmt.setString(22, article.getUser_univ_name1());
			pstmt.setString(23, article.getUser_univ_area1());
			pstmt.setString(24, article.getUser_univ_sdate1());
			pstmt.setString(25, article.getUser_univ_edate1());
			pstmt.setString(26, article.getUser_univ_grad1());
			pstmt.setString(27, article.getUser_univ_major1());
			pstmt.setString(28, article.getUser_univ_nm1());
			pstmt.setFloat(29, article.getUser_univ_cdit1());
			pstmt.setString(30, article.getUser_univ_type2());
			pstmt.setString(31, article.getUser_univ_name2());
			pstmt.setString(32, article.getUser_univ_area2());
			pstmt.setString(33, article.getUser_univ_sdate2());
			pstmt.setString(34, article.getUser_univ_edate2());
			pstmt.setString(35, article.getUser_univ_grad2());
			pstmt.setString(36, article.getUser_univ_major2());
			pstmt.setString(37, article.getUser_univ_nm2());
			pstmt.setFloat(38, article.getUser_univ_cdit2());
			pstmt.setString(39, article.getUser_univ_type3());
			pstmt.setString(40, article.getUser_univ_name3());
			pstmt.setString(41, article.getUser_univ_area3());
			pstmt.setString(42, article.getUser_univ_sdate3());
			pstmt.setString(43, article.getUser_univ_edate3());
			pstmt.setString(44, article.getUser_univ_grad3());
			pstmt.setString(45, article.getUser_univ_major3());
			pstmt.setString(46, article.getUser_univ_nm3());
			pstmt.setFloat(47, article.getUser_univ_cdit3());
			pstmt.setString(48, article.getUser_caeer());
			pstmt.setString(49, article.getUser_caeer_name1());
			pstmt.setString(50, article.getUser_caeer_sdate1());
			pstmt.setString(51, article.getUser_caeer_edate1());
			pstmt.setString(52, article.getUser_caeer_leave1());
			pstmt.setString(53, article.getUser_caeer_jobt1());
			pstmt.setString(54, article.getUser_caeer_dept1());
			pstmt.setString(55, article.getUser_caeer_linc1());
			pstmt.setString(56, article.getUser_caeer_area1());
			pstmt.setString(57, article.getUser_caeer_sale1());
			pstmt.setString(58, article.getUser_caeer_name2());
			pstmt.setString(59, article.getUser_caeer_sdate2());
			pstmt.setString(60, article.getUser_caeer_edate2());
			pstmt.setString(61, article.getUser_caeer_leave2());
			pstmt.setString(62, article.getUser_caeer_jobt2());
			pstmt.setString(63, article.getUser_caeer_dept2());
			pstmt.setString(64, article.getUser_caeer_linc2());
			pstmt.setString(65, article.getUser_caeer_area2());
			pstmt.setString(66, article.getUser_caeer_sale2());
			pstmt.setString(67, article.getUser_caeer_name3());
			pstmt.setString(68, article.getUser_caeer_sdate3());
			pstmt.setString(69, article.getUser_caeer_edate3());
			pstmt.setString(70, article.getUser_caeer_leave3());
			pstmt.setString(71, article.getUser_caeer_jobt3());
			pstmt.setString(72, article.getUser_caeer_dept3());
			pstmt.setString(73, article.getUser_caeer_linc3());
			pstmt.setString(74, article.getUser_caeer_area3());
			pstmt.setString(75, article.getUser_caeer_sale3());
			pstmt.setString(76, article.getUser_caeer_name4());
			pstmt.setString(77, article.getUser_caeer_sdate4());
			pstmt.setString(78, article.getUser_caeer_edate4());
			pstmt.setString(79, article.getUser_caeer_leave4());
			pstmt.setString(80, article.getUser_caeer_jobt4());
			pstmt.setString(81, article.getUser_caeer_dept4());
			pstmt.setString(82, article.getUser_caeer_linc4());
			pstmt.setString(83, article.getUser_caeer_area4());
			pstmt.setString(84, article.getUser_caeer_sale4());
			pstmt.setString(85, article.getUser_licen_type1());
			pstmt.setString(86, article.getUser_licen_name1());
			pstmt.setString(87, article.getUser_licen_publ1());
			pstmt.setString(88, article.getUser_licen_pass1());
			pstmt.setString(89, article.getUser_licen_date1());
			pstmt.setString(90, article.getUser_licen_type2());
			pstmt.setString(91, article.getUser_licen_name2());
			pstmt.setString(92, article.getUser_licen_publ2());
			pstmt.setString(93, article.getUser_licen_pass2());
			pstmt.setString(94, article.getUser_licen_date2());
			pstmt.setString(95, article.getUser_licen_type3());
			pstmt.setString(96, article.getUser_licen_name3());
			pstmt.setString(97, article.getUser_licen_publ3());
			pstmt.setString(98, article.getUser_licen_pass3());
			pstmt.setString(99, article.getUser_licen_date3());
		
			pstmt.executeUpdate(); //4. sql query 실행
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("user 테이블에 새로운 레코드 추가에 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
	}
	
	public UserVO getArticle(String id){			//하나만 전달 받기 때문에 List사용 x  상세보기를 클릭했다는 의미로 자동으로 조회수를 1 증가시킴
		
		Connection conn = null;		//데이터베이스 연결 객체
		PreparedStatement pstmt = null;		//query 실행 객체 쿼리문 실행을 위해 필요
		ResultSet rs = null;		//select문 실행 결과를 받아오는(저장하는) 객체
		UserVO article = null;		//초기값
		
		System.out.println("idsfawe : " + id);
		
		try {
			conn = getConnection();		//위의 getConnection()메서드에서 객체를 반환받아 값을 할당받아옴	DB연결
			
			String sql = "select * from user where user_id = ?";		//sql문을 새로 선언하지 않고 사용할 수 있음 단, 밑에서 닫아주어야 한다.
			pstmt = conn.prepareStatement(sql);		//3. sql을 샐행하기 위한 객체를 생성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	//4. select가 아닌 sql query 실행	(전체 내용이 담김)
			
			System.out.println("출력1 : " + id);
			
			if(rs.next())		//첫번째 칼럼을 가져온다는 뜻	값이 있으면 참 없으면 거짓
			{				

				System.out.println("high_edate : " + rs.getString("user_high_edate"));
				//System.out.println("mid_sdate : " + (rs.getTimestamp("user_mid_sdate")).toString().substring(0,10)); 	널 값을 toString으로 변환이 불가해서 에러가 남
				//System.out.println("출력4 : " + (rs.getTimestamp("user_high_edate")).toString());
				/*
				article.setUser_mid_sdate((rs.getTimestamp("user_mid_sdate")).toString().substring(0,10));
				article.setUser_mid_edate((rs.getString("user_mid_edate")).toString());
				*/
				
				article = new UserVO();		//같은 패키지 내에 있어서 객체 바로 사용 가능
				
				article.setUser_id(rs.getString("user_id"));

				 article.setUser_sex(rs.getString("user_sex"));           
				 article.setUser_mil_mil(rs.getString("user_mil_mil"));
				 article.setUser_mil_type(rs.getString("user_mil_type"));
				 article.setUser_mil_rnk(rs.getString("user_mil_rnk"));
				 article.setUser_stu(rs.getString("user_stu"));
				 article.setUser_mid_name(rs.getString("user_mid_name"));
				 article.setUser_mid_area(rs.getString("user_mid_area"));
				 article.setUser_mid_sdate((rs.getTimestamp("user_mid_sdate")).toString().substring(0,10)); 
				 //article.setUser_high_Gdate((rs.getTimestamp("user_high_edate")).toString().substring(0,10)); 
				 /*
				 if(rs.getString("user_mid_sdate") != null)
					 article.setUser_mid_sdate((rs.getTimestamp("user_mid_sdate")).toString().substring(0,10));  
				 else
					 article.setUser_mid_sdate("1");
				 if(rs.getString("user_mid_edate") != null)
					 article.setUser_mid_edate((rs.getTimestamp("user_mid_edate")).toString().substring(0,10));   
				 else
					 article.setUser_mid_edate("1");
				 article.setUser_mid_grad(rs.getString("user_mid_grad"));      
				 article.setUser_high_name(rs.getString("user_high_name"));     
				 article.setUser_high_area(rs.getString("user_high_area"));     
				 article.setUser_high_GED(rs.getString("user_high_GED"));      
				 if(rs.getString("user_high_Gdate") != null)
					 article.setUser_high_Gdate((rs.getTimestamp("user_high_Gdate")).toString().substring(0,10)); 
				 else
					 article.setUser_high_Gdate("2021-02-02");
				 if(rs.getString("user_high_sdate") != null)
					 article.setUser_high_sdate((rs.getTimestamp("user_high_sdate")).toString().substring(0,10)); 
				 if(rs.getString("user_high_edate") != null)  
					 article.setUser_high_edate((rs.getTimestamp("user_high_edate")).toString().substring(0,10));    
				 article.setUser_high_trans(rs.getString("user_high_trans"));    
				 article.setUser_high_grad(rs.getString("user_high_grad"));     
				 article.setUser_high_major(rs.getString("user_high_major"));    
				 article.setUser_univ_type1(rs.getString("user_univ_type1"));    
				 article.setUser_univ_name1(rs.getString("user_univ_name1"));   
				 article.setUser_univ_area1(rs.getString("user_univ_area1"));   
				 if(rs.getString("user_univ_sdate1") != null)
					 article.setUser_univ_sdate1((rs.getTimestamp("user_univ_sdate1")).toString().substring(0,10));	
				 if(rs.getString("user_univ_edate1") != null)
					 article.setUser_univ_edate1((rs.getTimestamp("user_univ_edate1")).toString().substring(0,10));	
				 article.setUser_univ_grad1(rs.getString("user_univ_grad1"));    
				 article.setUser_univ_major1(rs.getString("user_univ_major1"));	
				 article.setUser_univ_nm1(rs.getString("user_univ_nm1"));      
				 article.setUser_univ_cdit1(rs.getFloat("user_univ_cdit1"));    
				 article.setUser_univ_type2(rs.getString("user_univ_type2"));    
				 article.setUser_univ_name2(rs.getString("user_univ_name2"));    
				 article.setUser_univ_area2(rs.getString("user_univ_area2"));    
				 if(rs.getString("user_univ_sdate2") != null)
					 article.setUser_univ_sdate2((rs.getTimestamp("user_univ_sdate2")).toString().substring(0,10));	
				 if(rs.getString("user_univ_edate2") != null)
					 article.setUser_univ_edate2((rs.getTimestamp("user_univ_edate2")).toString().substring(0,10));	
				 article.setUser_univ_grad2(rs.getString("user_univ_grad2"));	 
				 article.setUser_univ_major2(rs.getString("user_univ_major2"));	
				 article.setUser_univ_nm2(rs.getString("user_univ_nm2"));	     
				 article.setUser_univ_cdit2(rs.getFloat("user_univ_cdit2"));	
				 article.setUser_univ_type3(rs.getString("user_univ_type3"));	
				 article.setUser_univ_name3(rs.getString("user_univ_name3"));	
				 article.setUser_univ_area3(rs.getString("user_univ_area3"));	 
				 if(rs.getString("user_univ_sdate3") != null)
					 article.setUser_univ_sdate3((rs.getTimestamp("user_univ_sdate3")).toString().substring(0,10));	
				 if(rs.getString("user_univ_edate3") != null)
					 article.setUser_univ_edate3((rs.getTimestamp("user_univ_edate3")).toString().substring(0,10));	
				 article.setUser_univ_grad3(rs.getString("user_univ_grad3"));	 
				 article.setUser_univ_major3(rs.getString("user_univ_major3"));	
				 article.setUser_univ_nm3(rs.getString("user_univ_nm3"));		 
				 article.setUser_univ_cdit3(rs.getFloat("user_univ_cdit3"));	
				 article.setUser_caeer(rs.getString("user_caeer"));	     
				 article.setUser_caeer_name1(rs.getString("user_caeer_name1"));	
				 if(rs.getString("user_caeer_sdate1") != null)
					 article.setUser_caeer_sdate1((rs.getTimestamp("user_caeer_sdate1")).toString().substring(0,10));	
				 if(rs.getString("user_caeer_edate1") != null)
					 article.setUser_caeer_edate1((rs.getTimestamp("user_caeer_edate1")).toString().substring(0,10));
				 article.setUser_caeer_leave1(rs.getString("user_caeer_leave1"));	
				 article.setUser_caeer_jobt1(rs.getString("user_caeer_jobt1"));	
				 article.setUser_caeer_dept1(rs.getString("user_caeer_dept1"));	
				 article.setUser_caeer_linc1(rs.getString("user_caeer_linc1"));	
				 article.setUser_caeer_area1(rs.getString("user_caeer_area1"));	
				 article.setUser_caeer_sale1(rs.getString("user_caeer_sale1"));	
				 article.setUser_caeer_name2(rs.getString("user_caeer_name2"));	
				 if(rs.getString("user_caeer_sdate2") != null)
					 article.setUser_caeer_sdate2((rs.getTimestamp("user_caeer_sdate2")).toString().substring(0,10));	
				 if(rs.getString("user_caeer_edate2") != null)
					 article.setUser_caeer_edate2((rs.getTimestamp("user_caeer_edate2")).toString().substring(0,10));	
				 article.setUser_caeer_leave2(rs.getString("user_caeer_leave2"));	
				 article.setUser_caeer_jobt2(rs.getString("user_caeer_jobt2"));	
				 article.setUser_caeer_dept2(rs.getString("user_caeer_dept2"));	
				 article.setUser_caeer_linc2(rs.getString("user_caeer_linc2"));	
				 article.setUser_caeer_area2(rs.getString("user_caeer_area2"));	
				 article.setUser_caeer_sale2(rs.getString("user_caeer_sale2"));	
				 article.setUser_caeer_name3(rs.getString("user_caeer_name3"));	
				 if(rs.getString("user_caeer_sdate3") != null)
					 article.setUser_caeer_sdate3((rs.getTimestamp("user_caeer_sdate3")).toString().substring(0,10));	
				 if(rs.getString("user_caeer_edate3") != null)
					 article.setUser_caeer_edate3((rs.getTimestamp("user_caeer_edate3")).toString().substring(0,10));	
				 article.setUser_caeer_leave3(rs.getString("user_caeer_leave3"));	
				 article.setUser_caeer_jobt3(rs.getString("user_caeer_jobt3"));	
				 article.setUser_caeer_dept3(rs.getString("user_caeer_dept3"));	
				 article.setUser_caeer_linc3(rs.getString("user_caeer_linc3"));	
				 article.setUser_caeer_area3(rs.getString("user_caeer_area3"));	
				 article.setUser_caeer_sale3(rs.getString("user_caeer_sale3"));	
				 article.setUser_caeer_name4(rs.getString("user_caeer_name4"));	
				 if(rs.getString("user_caeer_sdate4") != null)
					 article.setUser_caeer_sdate4((rs.getTimestamp("user_caeer_sdate4")).toString().substring(0,10));	
				 if(rs.getString("user_caeer_edate4") != null)
					 article.setUser_caeer_edate4((rs.getTimestamp("user_caeer_edate4")).toString().substring(0,10));	
				 article.setUser_caeer_leave4(rs.getString("user_caeer_leave4"));	
				 article.setUser_caeer_jobt4(rs.getString("user_caeer_jobt4"));	
				 article.setUser_caeer_dept4(rs.getString("user_caeer_dept4"));	
				 article.setUser_caeer_linc4(rs.getString("user_caeer_linc4"));	
				 article.setUser_caeer_area4(rs.getString("user_caeer_area4"));	
				 article.setUser_caeer_sale4(rs.getString("user_caeer_sale4"));	
				 article.setUser_licen_type1(rs.getString("user_licen_type1"));	
				 article.setUser_licen_name1(rs.getString("user_licen_name1"));	
				 article.setUser_licen_publ1(rs.getString("user_licen_publ1"));	
				 article.setUser_licen_pass1(rs.getString("user_licen_pass1"));	
				 if(rs.getString("user_licen_date1") != null)
					 article.setUser_licen_date1((rs.getTimestamp("user_licen_date1")).toString().substring(0,10));	
				 article.setUser_licen_type2(rs.getString("user_licen_type2"));	
				 article.setUser_licen_name2(rs.getString("user_licen_name2"));	
				 article.setUser_licen_publ2(rs.getString("user_licen_publ2"));	
				 article.setUser_licen_pass2(rs.getString("user_licen_pass2"));	
				 if(rs.getString("user_licen_date2") != null)
					 article.setUser_licen_date2((rs.getTimestamp("user_licen_date2")).toString().substring(0,10));	
				 article.setUser_licen_type3(rs.getString("user_licen_type3"));	
				 article.setUser_licen_name3(rs.getString("user_licen_name3"));	
				 article.setUser_licen_publ3(rs.getString("user_licen_publ3"));	
				 article.setUser_licen_pass3(rs.getString("user_licen_pass3"));	
				 if(rs.getString("user_licen_date3") != null)
					 article.setUser_licen_date3((rs.getTimestamp("user_licen_date3")).toString().substring(0,10));	 
				*/
				
				/*
				article.setId(rs.getString("id"));
				article.setPasswd(rs.getString("passwd"));
				article.setName(rs.getString("name"));
				article.setBirth(rs.getTimestamp("birth"));
				article.setAddr(rs.getString("addr"));
				article.setTel(rs.getString("tel"));
				article.setImg(rs.getString("img"));
				article.setUser_reg_date(rs.getTimestamp("reg_date"));
				*/
				
			}			
		}
		catch(Exception e){
			
			e.printStackTrace();
			System.out.println("user 테이블의 상세보기 레코드 검색에 실패했습니다.");	//실행한 콘솔창에 드러남
			
		}
		
		finally{
			if(rs != null) try {rs.close();} catch(SQLException se) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) {}
			if(conn != null) try {conn.close();} catch(SQLException se) {}
		}
		
		return article;		//집합 반환
}

/*	
	public List<UserVO> getArticles(int start, int end) {
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		List<UserVO> articleList = null;
		//System.out.println(start + " - " + end);
		try {			
			conn = getConnection();			
			
			//select b.* 
			//from ( select rownum as rnum, a.*
			//	     from (select * from board order by num desc) a ) b
			//where b.rnum >= 1 and b.rnum <= 10;
			String sql = "select * from user order by bnum desc limit ?, ?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				articleList = new ArrayList<UserVO>();
				do {
					UserVO article = new UserVO();
					article.setBnum(rs.getInt("bnum"));
					article.setBkind(rs.getString("bkind"));
					article.setBtitle(rs.getString("btitle"));
					article.setAuthor(rs.getString("author"));
					article.setPubcom(rs.getString("pubcom"));
					article.setPubdate(rs.getTimestamp("pubdate"));
					article.setPage(rs.getInt("page"));
					article.setBimage(rs.getString("bimage"));
					article.setBcontent(rs.getString("bcontent"));
					
					articleList.add(article);
				} while(rs.next());				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("user 테이블에 새로운 레코드 추가를 실패했습니다.");
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
			
			String sql = "select count(*) from user";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				result = rs.getInt(1);				
			} 			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("user 테이블의 레코드 전체수 검색을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
		
		return result;
	}
	
	

	public void updateuser(UserVO article) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();
			
			String sql = "update user set bkind=?, btitle=?, author=?, pubcom=?, pubdate=?, page=?, bimage=? , bcontent=? where bnum=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setString(1, article.getBkind());
			pstmt.setString(2, article.getBtitle());
			pstmt.setString(3, article.getAuthor());					
			pstmt.setString(4, article.getPubcom());
			pstmt.setTimestamp(5, article.getPubdate());
			pstmt.setInt(6, article.getPage());
			pstmt.setString(7, article.getBimage());
			pstmt.setString(8, article.getBcontent());
			pstmt.setInt(9, article.getBnum());
			
			pstmt.executeUpdate(); //4. sql query 실행

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("user 테이블의 글 수정을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}

	}
	
	public void deleteuser(int num) {		
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		
		try {			
			conn = getConnection();

			String sql = "delete from user where bnum=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate(); //4. sql query 실행

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("user 테이블의 글 삭제를 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}

	}
	
	public UserVO getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null; // query 실행
		ResultSet rs = null;
		UserVO article = null;
		
		try {			
			conn = getConnection();	
			
			String sql = "select * from user where bnum=?";
			pstmt = conn.prepareStatement(sql); //3. sql query를 실행하기 위한 객체 생성하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); //4. sql query 실행
			
			if(rs.next()) {
				article = new UserVO();
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
			System.out.println("user 테이블에 상세보기의 레코드 검색을 실패했습니다.");
		} finally {
			//5. 자원 해제
			if(rs != null) try {rs.close();} catch(SQLException se) { }
			if(pstmt != null) try {pstmt.close();} catch(SQLException se) { }
			if(conn != null) try {conn.close();} catch(SQLException se) { }
		}
		
		return article;
	}	
	
	*/
	
	
	
}
