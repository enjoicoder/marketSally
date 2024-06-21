package kr.or.marketsally.order.vo;

public class MyPageOrdersVO {
	private String order_id;
	private String order_date;
	private String order_status;
	private int pay_amount;
	private String pay_method;
	private int cnt;
	private String prod_img;
	private String prod_name;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(int pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	@Override
	public String toString() {
		return "MyPageOrdersVO [order_id=" + order_id + ", order_date=" + order_date + ", order_status=" + order_status
				+ ", pay_amount=" + pay_amount + ", pay_method=" + pay_method + ", cnt=" + cnt + ", prod_img="
				+ prod_img + ", prod_name=" + prod_name + "]";
	}
	
	
}
