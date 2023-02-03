package notice;

import java.sql.Timestamp;

public class NoticeVO {

	private int nnum;
	private String nwriter;
	private String nsubject;
	private Timestamp nreg_date;
	private int nreadcount;
	private String ncontent;
	private String nimage;
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public String getNsubject() {
		return nsubject;
	}
	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}
	public Timestamp getNreg_date() {
		return nreg_date;
	}
	public void setNreg_date(Timestamp nreg_date) {
		this.nreg_date = nreg_date;
	}
	public int getNreadcount() {
		return nreadcount;
	}
	public void setNreadcount(int nreadcount) {
		this.nreadcount = nreadcount;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNimage() {
		return nimage;
	}
	public void setNimage(String nimage) {
		this.nimage = nimage;
	}
	
	

}
