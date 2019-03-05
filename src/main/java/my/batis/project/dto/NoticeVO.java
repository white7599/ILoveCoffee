package my.batis.project.dto;

import java.sql.Date;

public class NoticeVO {
	private int idx;
	private String title;
	private String contents;
	private Date reg_date;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [idx=" + idx + ", title=" + title + ", contents=" + contents + ", reg_date=" + reg_date + "]";
	}
	
	
}
