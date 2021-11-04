package com.niceShot.project.member.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.niceShot.project.product.vo.ProductVO;

/* Getter and Setter 설정 및 View Object 정의 */

@Component("memberVO")
public class MemberVO {
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
	private String biz_id;
	
	private String user_ranking;

	public String getUser_ranking() {
		return user_ranking;
	}

	public void setUser_ranking(String user_ranking) {
		this.user_ranking = user_ranking;
	}

	public String getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}

	public MemberVO() {
		
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

	public String getUser_contact() {
		return user_contact;
	}

	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
}
	
