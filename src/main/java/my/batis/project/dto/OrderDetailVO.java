package my.batis.project.dto;

public class OrderDetailVO {
	private int idx;
	private int order_idx;
	private int product_idx;
	private int count;
	
	private String product_name;
	private String image_file;
	private String product_price;
	
	
	public String getImage_file() {
		return image_file;
	}
	public void setImage_file(String image_file) {
		this.image_file = image_file;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
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
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	@Override
	public String toString() {
		return "OrderDetailVO [idx=" + idx + ", order_idx=" + order_idx + ", product_idx=" + product_idx + ", count="
				+ count + ", product_name=" + product_name + "]";
	}
	
}
