package DTO;

import java.util.Date;

public class ProductDTO {
	private long product_no;
	private String product_name;
	private String product_imgurl;
	private int product_price;
	private int product_stock;
	private String product_detail;
	private int sold_count;
	private String product_size;
	private String product_color;
	private String maker;
	private Date product_mfd;
	private String product_poo;
	private Date product_epd;
	private int pc_no;
	
	
	public long getProduct_no() {
		return product_no;
	}
	public void setProduct_no(long product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_imgurl() {
		return product_imgurl;
	}
	public void setProduct_imgurl(String product_imgurl) {
		this.product_imgurl = product_imgurl;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public int getSold_count() {
		return sold_count;
	}
	public void setSold_count(int sold_count) {
		this.sold_count = sold_count;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public Date getProduct_mfd() {
		return product_mfd;
	}
	public void setProduct_mfd(Date product_mfd) {
		this.product_mfd = product_mfd;
	}
	public String getProduct_poo() {
		return product_poo;
	}
	public void setProduct_poo(String product_poo) {
		this.product_poo = product_poo;
	}
	public Date getProduct_epd() {
		return product_epd;
	}
	public void setProduct_epd(Date product_epd) {
		this.product_epd = product_epd;
	}
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	
	
}
