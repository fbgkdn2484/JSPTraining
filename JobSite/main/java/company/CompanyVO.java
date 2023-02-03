package company;

import java.sql.Timestamp;	//mysql의 dateTime은 자바에선 없기 때문에 해당 타임 스탬프를 사용

public class CompanyVO {	//정보를 저장, 칼럼명 동일하게, 데이터를 저장하는 데이터 객체
	
	private String comp_id;
	private String comp_user_name;
	private String comp_passwd;
	private String COMP_TEL;
	private String comp_num;
	private String comp_name;
	private String comp_img;
	private String COMP_EMPL;
	private int COMP_HEAD;
	private String COMP_TYPE;
	private Timestamp COMP_DATE;
	private int COMP_SALE;
	private String COMP_HTTP;
	private String COMP_ADDR;
	private Timestamp reg_date;
	
	public String getComp_id() {
		return comp_id;
	}
	public void setComp_id(String comp_id) {
		this.comp_id = comp_id;
	}
	public String getComp_user_name() {
		return comp_user_name;
	}
	public void setComp_user_name(String comp_user_name) {
		this.comp_user_name = comp_user_name;
	}
	public String getComp_passwd() {
		return comp_passwd;
	}
	public void setComp_passwd(String comp_passwd) {
		this.comp_passwd = comp_passwd;
	}
	public String getCOMP_TEL() {
		return COMP_TEL;
	}
	public void setCOMP_TEL(String cOMP_TEL) {
		COMP_TEL = cOMP_TEL;
	}
	public String getComp_num() {
		return comp_num;
	}
	public void setComp_num(String comp_num) {
		this.comp_num = comp_num;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getComp_img() {
		return comp_img;
	}
	public void setComp_img(String comp_img) {
		this.comp_img = comp_img;
	}
	public String getCOMP_EMPL() {
		return COMP_EMPL;
	}
	public void setCOMP_EMPL(String cOMP_EMPL) {
		COMP_EMPL = cOMP_EMPL;
	}
	public int getCOMP_HEAD() {
		return COMP_HEAD;
	}
	public void setCOMP_HEAD(int cOMP_HEAD) {
		COMP_HEAD = cOMP_HEAD;
	}
	public String getCOMP_TYPE() {
		return COMP_TYPE;
	}
	public void setCOMP_TYPE(String cOMP_TYPE) {
		COMP_TYPE = cOMP_TYPE;
	}
	public Timestamp getCOMP_DATE() {
		return COMP_DATE;
	}
	public void setCOMP_DATE(Timestamp cOMP_DATE) {
		COMP_DATE = cOMP_DATE;
	}
	public int getCOMP_SALE() {
		return COMP_SALE;
	}
	public void setCOMP_SALE(int cOMP_SALE) {
		COMP_SALE = cOMP_SALE;
	}
	public String getCOMP_HTTP() {
		return COMP_HTTP;
	}
	public void setCOMP_HTTP(String cOMP_HTTP) {
		COMP_HTTP = cOMP_HTTP;
	}
	public String getCOMP_ADDR() {
		return COMP_ADDR;
	}
	public void setCOMP_ADDR(String cOMP_ADDR) {
		COMP_ADDR = cOMP_ADDR;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
