package com.niceShot.project.member.vo;

import org.springframework.stereotype.Component;

@Component("rankVO")
public class RankVO {
	private String user_rank_id;
	private String user_ranking;
	private String user_rank_code;
	
	public String getUser_rank_id() {
		return user_rank_id;
	}
	public void setUser_rank_id(String user_rank_id) {
		this.user_rank_id = user_rank_id;
	}
	public String getUser_ranking() {
		return user_ranking;
	}
	public void setUser_ranking(String user_ranking) {
		this.user_ranking = user_ranking;
	}
	public String getUser_rank_code() {
		return user_rank_code;
	}
	public void setUser_rank_code(String user_rank_code) {
		this.user_rank_code = user_rank_code;
	}
}
