package com.niceShot.project.product.vo;

import org.springframework.stereotype.Component;

@Component("wishVO")
public class WishVO {
	private String user_id;
	private String product_id;
	private String product_wishlist;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_wishlist() {
		return product_wishlist;
	}
	public void setProduct_wishlist(String product_wishlist) {
		this.product_wishlist = product_wishlist;
	}
}
