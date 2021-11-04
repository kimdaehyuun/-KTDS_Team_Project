package com.niceShot.project.product.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {
	private String product_id;
	private String user_id;
	private String cate_id;
	private String gen_id;
	private String product_name;
	private String product_price;
	private String product_detail;
	private Date product_date;
	private String product_delete;
	private String product_safe;
	private String product_img;
	
	private WishVO wishVO;
	private OrderdetailVO orderdetailVO;
	
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getGen_id() {
		return gen_id;
	}
	public void setGen_id(String gen_id) {
		this.gen_id = gen_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public String getProduct_delete() {
		return product_delete;
	}
	public void setProduct_delete(String product_delete) {
		this.product_delete = product_delete;
	}
	public String getProduct_safe() {
		return product_safe;
	}
	public void setProduct_safe(String product_safe) {
		this.product_safe = product_safe;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public WishVO getWishVO() {
		return wishVO;
	}
	public void setWishVO(WishVO wishVO) {
		this.wishVO = wishVO;
	}
	public OrderdetailVO getOrderdetailVO() {
		return orderdetailVO;
	}
	public void setOrderdetailVO(OrderdetailVO orderdetailVO) {
		this.orderdetailVO = orderdetailVO;
	}
	
}
