package com.niceShot.project.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.niceShot.project.board.dao.ReplyDAO;
import com.niceShot.project.board.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject 
	private ReplyDAO dao;
	
	//댓글 조회
	@Override
	public List<ReplyVo> list(String cs_board_id) throws Exception {
		
		return dao.list(cs_board_id);
		}

	@Override
	public void write(ReplyVo vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public void modify(ReplyVo vo) throws Exception {
		
		dao.modify(vo);

	}

	@Override
	public void delete(ReplyVo vo) throws Exception {
	
		dao.delete(vo);

	}

}
