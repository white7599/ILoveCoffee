package my.batis.project.dto;

import java.sql.Date;

public class DirectQuestionVO {
	private int idx;
	private String type;
	private String email;
	private String cellphone;
	private String writer;
	private String contents;
	private String info_agree;
	private Date reg_date;
	private String answer_state;
	private String answer;
	private Date answer_date;
	private String name;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getInfo_agree() {
		return info_agree;
	}
	public void setInfo_agree(String info_agree) {
		this.info_agree = info_agree;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getAnswer_state() {
		return answer_state;
	}
	public void setAnswer_state(String answer_state) {
		this.answer_state = answer_state;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "DirectQuestionVO [idx=" + idx + ", type=" + type + ", email=" + email + ", cellphone=" + cellphone
				+ ", writer=" + writer + ", contents=" + contents + ", info_agree=" + info_agree + ", reg_date="
				+ reg_date + ", answer_state=" + answer_state + ", answer=" + answer + ", answer_date=" + answer_date
				+ "]";
	}
	
}
