package my.batis.project.dto;

import java.sql.Date;

public class ProductVO {
	private int idx;			// 상품번호
	private int type_idx;		// 상품분류번호(product_type 테이블 fk)
	private String name;		// 상품명
	private String eng_name;	// 영문상품명
	private String desc1;		// 상세설명1
	private String image_file;	// 이미지
	private String origin;		// 원산지
	private String desc2;		// 상세설명2
	private int price;			// 가격
	private int weight;			// 무게(원두인 경우)
	private String view_check;	// 사용여부(Y/N) default value:N
	private Date reg_date;		// 등록일
	private Date update_date;	// 수정일
	
	private String type;	//product_type 명칭(product_type 테이블 참조)

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getType_idx() {
		return type_idx;
	}

	public void setType_idx(int type_idx) {
		this.type_idx = type_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEng_name() {
		return eng_name;
	}

	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}

	public String getDesc1() {
		return desc1;
	}

	public void setDesc1(String desc1) {
		this.desc1 = desc1;
	}

	public String getImage_file() {
		return image_file;
	}

	public void setImage_file(String image_file) {
		this.image_file = image_file;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getDesc2() {
		return desc2;
	}

	public void setDesc2(String desc2) {
		this.desc2 = desc2;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
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

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ProductVO [idx=" + idx + ", type_idx=" + type_idx + ", name=" + name + ", eng_name=" + eng_name
				+ ", desc1=" + desc1 + ", image_file=" + image_file + ", origin=" + origin + ", desc2=" + desc2
				+ ", price=" + price + ", weight=" + weight + ", view_check=" + view_check + ", reg_date=" + reg_date
				+ ", update_date=" + update_date + ", type=" + type + "]";
	}
	
}
