package com.niceShot.project.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("boardVO")
public class BoardVO {
private String cs_board_id;
private String user_id;
private String b_ctgry_id;
private String cs_b_title;
private String cs_b_content;
private String cs_b_views;
private String cs_b_lock;
private String b_ctgry_name;
private String cmt_content;

private Date cmt_date;
private Date cs_b_date;

private String user_name;

public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
private int rownum;


public int getRownum() {
	return rownum;
}
public void setRownum(int rownum) {
	this.rownum = rownum;
}
public String getCs_board_id() {
	return cs_board_id;
}
public void setCs_board_id(String cs_board_id) {
	this.cs_board_id = cs_board_id;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
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
public String getCs_b_views() {
	return cs_b_views;
}
public void setCs_b_views(String cs_b_views) {
	this.cs_b_views = cs_b_views;
}
public String getCs_b_lock() {
	return cs_b_lock;
}
public void setCs_b_lock(String cs_b_lock) {
	this.cs_b_lock = cs_b_lock;
}
public String getB_ctgry_name() {
	return b_ctgry_name;
}
public void setB_ctgry_name(String b_ctgry_name) {
	this.b_ctgry_name = b_ctgry_name;
}
public String getCmt_content() {
	return cmt_content;
}
public void setCmt_content(String cmt_content) {
	this.cmt_content = cmt_content;
}
public Date getCmt_date() {
	return cmt_date;
}
public void setCmt_date(Date cmt_date) {
	this.cmt_date = cmt_date;
}
public Date getCs_b_date() {
	return cs_b_date;
}
public void setCs_b_date(Date cs_b_date) {
	this.cs_b_date = cs_b_date;
}
	
	
}
