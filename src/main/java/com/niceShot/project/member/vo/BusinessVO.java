package com.niceShot.project.member.vo;

import org.springframework.stereotype.Component;

@Component("businessVO")
public class BusinessVO {
	private String biz_id;
	private String biz_name;
	private String biz_num;
	private String biz_address;
	
	public String getBiz_id() {
		return biz_id;
	}
	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
	}
	public String getBiz_num() {
		return biz_num;
	}
	public void setBiz_num(String biz_num) {
		this.biz_num = biz_num;
	}
	public String getBiz_address() {
		return biz_address;
	}
	public void setBiz_address(String biz_address) {
		this.biz_address = biz_address;
	}
}
