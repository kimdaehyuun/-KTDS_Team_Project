package com.niceShot.project.administration.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("administrationVO")
public class AdministrationVO {
	private String user_id;
	private String user_rank_id;
	private String user_account;
	private String user_password;
	private String user_profile;
	private String user_name;
	private String user_zipcode;
	private String user_address;
	private String user_contact;
	private Date user_create;
	private Date user_delete;

	private String order_id;
	private String product_id;
	private String product_name;
	private String cate_name;
	private String od_status;
	private Date order_date;
	private Date product_date;
	private String product_price;
	
	private String cs_board_id;
	private String b_ctgry_id;
	private String cs_b_title;
	private String cs_b_content;
	private String cs_b_lock;
	private Date cs_b_date;
	private String cs_b_views;
	private String product_detail;
	private String gen_name;

	public AdministrationVO() {
		
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_rank_id() {
		return user_rank_id;
	}


	public void setUser_rank_id(String user_rank_id) {
		this.user_rank_id = user_rank_id;
	}


	public String getUser_account() {
		return user_account;
	}


	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}


	public String getUser_password() {
		return user_password;
	}


	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}


	public String getUser_profile() {
		return user_profile;
	}


	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getProduct_detail() {
		return product_detail;
	}


	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}


	public String getUser_zipcode() {
		return user_zipcode;
	}


	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}


	public String getUser_address() {
		return user_address;
	}


	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}


	public String getGen_name() {
		return gen_name;
	}


	public void setGen_name(String gen_name) {
		this.gen_name = gen_name;
	}


	public String getUser_contact() {
		return user_contact;
	}


	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}


	public Date getUser_create() {
		return user_create;
	}


	public void setUser_create(Date user_create) {
		this.user_create = user_create;
	}


	public Date getUser_delete() {
		return user_delete;
	}


	public void setUser_delete(Date user_delete) {
		this.user_delete = user_delete;
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


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getCate_name() {
		return cate_name;
	}


	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}


	public String getOd_status() {
		return od_status;
	}


	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public Date getProduct_date() {
		return product_date;
	}


	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}


	public String getProduct_price() {
		return product_price;
	}


	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}


	public String getCs_board_id() {
		return cs_board_id;
	}


	public void setCs_board_id(String cs_board_id) {
		this.cs_board_id = cs_board_id;
	}


	public String getB_ctgry_id() {
		return b_ctgry_id;
	}


	public void setB_ctgry_id(String b_ctgry_id) {
		this.b_ctgry_id = b_ctgry_id;
	}


	public String getCs_b_title() {
		return cs_b_title;
	}


	public void setCs_b_title(String cs_b_title) {
		this.cs_b_title = cs_b_title;
	}


	public String getCs_b_content() {
		return cs_b_content;
	}


	public void setCs_b_content(String cs_b_content) {
		this.cs_b_content = cs_b_content;
	}


	public String getCs_b_lock() {
		return cs_b_lock;
	}


	public void setCs_b_lock(String cs_b_lock) {
		this.cs_b_lock = cs_b_lock;
	}


	public Date getCs_b_date() {
		return cs_b_date;
	}


	public void setCs_b_date(Date cs_b_date) {
		this.cs_b_date = cs_b_date;
	}


	public String getCs_b_views() {
		return cs_b_views;
	}


	public void setCs_b_views(String cs_b_views) {
		this.cs_b_views = cs_b_views;
	}

	
	
	
	

}
