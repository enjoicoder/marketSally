package kr.or.marketsally.prodqna.vo;

public class ProdQnaVO {
	private String prqa_title ;
	private String prqa_qdate ;
	private String prqa_adate ;
	private String prqa_status;
	private String prqa_acont ;
	private String prqa_qcont ;
	private String prod_id    ;
	private String mem_id     ;
	
	private String prod_img;
	private String prod_name;
	
	private String mem_name;
	
	public String getPrqa_title() {
		return prqa_title;
	}
	public void setPrqa_title(String prqa_title) {
		this.prqa_title = prqa_title;
	}
	public String getPrqa_qdate() {
		return prqa_qdate;
	}
	public void setPrqa_qdate(String prqa_qdate) {
		this.prqa_qdate = prqa_qdate;
	}
	public String getPrqa_adate() {
		return prqa_adate;
	}
	public void setPrqa_adate(String prqa_adate) {
		this.prqa_adate = prqa_adate;
	}
	public String getPrqa_status() {
		return prqa_status;
	}
	public void setPrqa_status(String prqa_status) {
		this.prqa_status = prqa_status;
	}
	public String getPrqa_acont() {
		return prqa_acont;
	}
	public void setPrqa_acont(String prqa_acont) {
		this.prqa_acont = prqa_acont;
	}
	public String getPrqa_qcont() {
		return prqa_qcont;
	}
	public void setPrqa_qcont(String prqa_qcont) {
		this.prqa_qcont = prqa_qcont;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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
		return "ProdQnaVO [prqa_title=" + prqa_title + ", prqa_qdate=" + prqa_qdate + ", prqa_adate=" + prqa_adate
				+ ", prqa_status=" + prqa_status + ", prqa_acont=" + prqa_acont + ", prqa_qcont=" + prqa_qcont
				+ ", prod_id=" + prod_id + ", mem_id=" + mem_id + ", prod_img=" + prod_img + ", prod_name=" + prod_name
				+ ", mem_name=" + mem_name + "]";
	}
	
	

	
	
	
}
