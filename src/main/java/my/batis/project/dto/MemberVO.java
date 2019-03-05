package my.batis.project.dto;

import java.sql.Date;

public class MemberVO {
	private int idx;
	private String id;
	private String name;
	private String pwd;
	private String post_no;
	private String addr1;
	private String addr2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String cellphone1;
	private String cellphone2;
	private String cellphone3;
	private String sms_check;
	private String email;
	private String newsletter_check;
	private Date reg_date;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getCellphone1() {
		return cellphone1;
	}
	public void setCellphone1(String cellphone1) {
		this.cellphone1 = cellphone1;
	}
	public String getCellphone2() {
		return cellphone2;
	}
	public void setCellphone2(String cellphone2) {
		this.cellphone2 = cellphone2;
	}
	public String getCellphone3() {
		return cellphone3;
	}
	public void setCellphone3(String cellphone3) {
		this.cellphone3 = cellphone3;
	}
	public String getSms_check() {
		return sms_check;
	}
	public void setSms_check(String sms_check) {
		this.sms_check = sms_check;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNewsletter_check() {
		return newsletter_check;
	}
	public void setNewsletter_check(String newsletter_check) {
		this.newsletter_check = newsletter_check;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_data(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", post_no=" + post_no + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", cellphone1="
				+ cellphone1 + ", cellphone2=" + cellphone2 + ", cellphone3=" + cellphone3 + ", sms_check=" + sms_check
				+ ", email=" + email + ", newsletter_check=" + newsletter_check + ", reg_data=" + reg_date + "]";
	}
	
	
	
	
}
