package members;

import java.sql.Timestamp;	//mysql의 dateTime은 자바에선 없기 때문에 해당 타임 스탬프를 사용

public class MembersVO {	//정보를 저장, 칼럼명 동일하게, 데이터를 저장하는 데이터 객체
	private String id;
	private String passwd;
	private String name;
	private Timestamp reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
