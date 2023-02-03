package company;

import java.sql.Timestamp;	//mysql의 dateTime은 자바에선 없기 때문에 해당 타임 스탬프를 사용

public class JoinCompanyVO {	//정보를 저장, 칼럼명 동일하게, 데이터를 저장하는 데이터 객체
	

	private String comp_user_name;
	private String comp_name;
	private String comp_img;
	private String COMP_EMPL;
	private int COMP_HEAD;
	private String COMP_TYPE;
	private Timestamp COMP_DATE;
	private int COMP_SALE;
	private String COMP_HTTP;
	private String COMP_ADDR;
	private int job_num;
	private String job_id;
    private String job_subject;
    private String job_content;
    private String job_image;
    private Timestamp job_sdate;
    private Timestamp job_edate;
    private String job_caeer;     
    private String job_stu;
    private String job_empl;     
    private String job_money;
    private String job_up;     
    private String job_area;
    private String job_cond;     
    private String job_job;
    private int job_head;
    private int job_readcount;
    
	public String getComp_user_name() {
		return comp_user_name;
	}
	public void setComp_user_name(String comp_user_name) {
		this.comp_user_name = comp_user_name;
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
	public int getJob_num() {
		return job_num;
	}
	public void setJob_num(int job_num) {
		this.job_num = job_num;
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getJob_subject() {
		return job_subject;
	}
	public void setJob_subject(String job_subject) {
		this.job_subject = job_subject;
	}
	public String getJob_content() {
		return job_content;
	}
	public void setJob_content(String job_content) {
		this.job_content = job_content;
	}
	public String getJob_image() {
		return job_image;
	}
	public void setJob_image(String job_image) {
		this.job_image = job_image;
	}
	public Timestamp getJob_sdate() {
		return job_sdate;
	}
	public void setJob_sdate(Timestamp job_sdate) {
		this.job_sdate = job_sdate;
	}
	public Timestamp getJob_edate() {
		return job_edate;
	}
	public void setJob_edate(Timestamp job_edate) {
		this.job_edate = job_edate;
	}
	public String getJob_caeer() {
		return job_caeer;
	}
	public void setJob_caeer(String job_caeer) {
		this.job_caeer = job_caeer;
	}
	public String getJob_stu() {
		return job_stu;
	}
	public void setJob_stu(String job_stu) {
		this.job_stu = job_stu;
	}
	public String getJob_empl() {
		return job_empl;
	}
	public void setJob_empl(String job_empl) {
		this.job_empl = job_empl;
	}
	public String getJob_money() {
		return job_money;
	}
	public void setJob_money(String job_money) {
		this.job_money = job_money;
	}
	public String getJob_up() {
		return job_up;
	}
	public void setJob_up(String job_up) {
		this.job_up = job_up;
	}
	public String getJob_area() {
		return job_area;
	}
	public void setJob_area(String job_area) {
		this.job_area = job_area;
	}
	public String getJob_cond() {
		return job_cond;
	}
	public void setJob_cond(String job_cond) {
		this.job_cond = job_cond;
	}
	public String getJob_job() {
		return job_job;
	}
	public void setJob_job(String job_job) {
		this.job_job = job_job;
	}
	public int getJob_head() {
		return job_head;
	}
	public void setJob_head(int job_head) {
		this.job_head = job_head;
	}
	public int getJob_readcount() {
		return job_readcount;
	}
	public void setJob_readcount(int job_readcount) {
		this.job_readcount = job_readcount;
	}
	
	
	

	
}
