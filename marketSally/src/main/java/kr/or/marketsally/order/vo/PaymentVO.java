package kr.or.marketsally.order.vo;

public class PaymentVO {
	private int pay_amount  ;
	private String pay_method  ;
	private String pay_date    ;
	private int pay_point   ;
	private String order_id    ;
	
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
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_point() {
		return pay_point;
	}
	public void setPay_point(int pay_point) {
		this.pay_point = pay_point;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	
}
