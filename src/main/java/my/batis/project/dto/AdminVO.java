package my.batis.project.dto;

import java.sql.Date;

public class AdminVO {
	private String id;
	private String pwd;
	private String name;
	private Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", reg_date=" + reg_date + "]";
	}
	
}
