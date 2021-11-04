	package com.niceShot.project.product.vo;

import org.springframework.stereotype.Component;

@Component("categoryVO")
public class CategoryVO {
	private String cate_id;
	private String cate_name;
	private String cate_img;
	
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCate_img() {
		return cate_img;
	}
	public void setCate_img(String cate_img) {
		this.cate_img = cate_img;
	}
	
}
