package my.batis.project.dto;

import java.sql.Date;

public class ProductTypeVO {
	private int idx;
	private String type;
	private String view_check;
	private Date reg_date;
	private String link_category;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getView_check() {
		return view_check;
	}
	public void setView_check(String view_check) {
		this.view_check = view_check;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	public String getLink_category() {
		return link_category;
	}
	public void setLink_category(String link_category) {
		this.link_category = link_category;
	}
	@Override
	public String toString() {
		return "ProductTypeVO [idx=" + idx + ", type=" + type + ", view_check=" + view_check + ", reg_date=" + reg_date
				+ ", link_category=" + link_category + "]";
	}
	
	
	
	
}
