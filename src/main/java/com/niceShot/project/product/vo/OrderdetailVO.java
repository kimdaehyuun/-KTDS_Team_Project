package com.niceShot.project.product.vo;

import org.springframework.stereotype.Component;

@Component("orderdetailVO")
public class OrderdetailVO {
	private String od_id;
	private String order_id;
	private String product_id;
	private String od_product_count;
	private String od_status;
	
	public String getOd_id() {
		return od_id;
	}
	public void setOd_id(String od_id) {
		this.od_id = od_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getOd_product_count() {
		return od_product_count;
	}
	public void setOd_product_count(String od_product_count) {
		this.od_product_count = od_product_count;
	}
	public String getOd_status() {
		return od_status;
	}
	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}
	
}
 