package com.niceShot.project.chat.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("messageVO")
public class MessageVO {
	
	private String chat_id;
	private String msg;
	private Date msg_date;
	private String msg_writer;
	
	public String getMsg_writer() {
		return msg_writer;
	}
	public void setMsg_writer(String msg_writer) {
		this.msg_writer = msg_writer;
	}
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	
}
