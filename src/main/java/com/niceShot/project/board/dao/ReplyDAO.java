package com.niceShot.project.board.dao;

import java.util.List;

import com.niceShot.project.board.vo.ReplyVo;


public interface ReplyDAO {

	
	//댓글조회
	public List<ReplyVo> list (String cs_board_id) throws Exception;
	
	
	//댓글 조회
	public void write(ReplyVo vo) throws Exception;
	
	//댓글 수정
	public void modify(ReplyVo vo)throws Exception;
	
	//댓글 삭제
	public void delete(ReplyVo vo) throws Exception;


}
