package kr.or.marketsally.review.vo;

public class ReviewVO {
	private String review_cont ;
	private String review_img  ;
	private String review_date ;
	private String mem_id      ;
	private String prod_id     ;
	private String review_title;
	
	private String mem_name;
	private int num;
	
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_cont=" + review_cont + ", review_img=" + review_img + ", review_date=" + review_date
				+ ", mem_id=" + mem_id + ", prod_id=" + prod_id + ", review_title=" + review_title + ", mem_name="
				+ mem_name + ", num=" + num + "]";
	}

	
	
	
}
