package my.batis.project.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class OrderVO {
	// order(주문내역T)
	private int idx;	//주문번호
	private String user_id;	//주문자아이디
	private int total_amt;	//총금액
	private int status; 	// 주문처리상태
	private Date order_date;	//주문일자
	private String payment_type;	// 결제방법
	private Date payment_date;		// 실결제일	
	private String order_idx;
	private String user_name;
	
	// order_detail(주문상세내역 T)
	List<OrderDetailVO> orderDetailvo;
	
	// order_delivery(주문배송지내역T)
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
	
	private int last_idx;
	
	// 엑셀 파일 
	private int product_idx;
	private String product_name;
	private int count;
	private int price;
	
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotal_amt() {
		return total_amt;
	}
	public void setTotal_amt(int total_amt) {
		this.total_amt = total_amt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public List<OrderDetailVO> getOrderDetailvo() {
		return orderDetailvo;
	}
	public void setOrderDetailvo(List<OrderDetailVO> orderDetailvo) {
		this.orderDetailvo = orderDetailvo;
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
	
	public String getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	public int getLast_idx() {
		return last_idx;
	}
	public void setLast_idx(int last_idx) {
		this.last_idx = last_idx;
	}	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "OrderVO [idx=" + idx + ", user_id=" + user_id + ", total_amt=" + total_amt + ", status=" + status
				+ ", order_date=" + order_date + ", payment_type=" + payment_type + ", payment_date=" + payment_date
				+ ", orderDetailvo=" + orderDetailvo + ", payee_id=" + payee_id + ", payee_name=" + payee_name
				+ ", post_no=" + post_no + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel1=" + tel1 + ", tel2=" + tel2
				+ ", tel3=" + tel3 + ", cellphone1=" + cellphone1 + ", cellphone2=" + cellphone2 + ", cellphone3="
				+ cellphone3 + ", message=" + message + "]";
	}
	
	
}
