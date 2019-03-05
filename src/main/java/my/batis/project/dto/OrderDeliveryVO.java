package my.batis.project.dto;

public class OrderDeliveryVO {
	private int idx;
	private int order_idx;
	private String payee_id;	// 사용자 아이디
	private String payee_name;	// 수취인
	private String post_no;		// 배송지우편번호
	private String addr1;		// 주소1
	private String addr2;		// 주소2
	private String tel1;		// 전화번호1
	private String tel2;		// 전화번호2
	private String tel3;		// 전화번호3
	private String cellphone1;		// 휴대전화1
	private String cellphone2;		// 휴대전화2
	private String cellphone3;		// 휴대전화3
	private String message;		// 배송메세지
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public String getPayee_id() {
		return payee_id;
	}
	public void setPayee_id(String payee_id) {
		this.payee_id = payee_id;
	}
	public String getPayee_name() {
		return payee_name;
	}
	public void setPayee_name(String payee_name) {
		this.payee_name = payee_name;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "OrderDeliveryVO [idx=" + idx + ", order_idx=" + order_idx + ", payee_id=" + payee_id + ", payee_name="
				+ payee_name + ", post_no=" + post_no + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel1=" + tel1
				+ ", tel2=" + tel2 + ", tel3=" + tel3 + ", cellphone1=" + cellphone1 + ", cellphone2=" + cellphone2
				+ ", cellphone3=" + cellphone3 + ", message=" + message + "]";
	}
	
	
}
