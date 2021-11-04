package com.niceShot.project.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.niceShot.project.board.vo.ReplyVo;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.reply";
	
	//댓글 조회
	@Override
	public List<ReplyVo> list(String cs_board_id) throws Exception{
		return sql.selectList(namespace + ".replyList", cs_board_id);
	}
	
	//댓글 작성
	@Override
	public void write(ReplyVo vo) throws Exception{
		sql.insert(namespace +".replyWrite", vo);
	}
	
	//댓글 수정
	@Override
	public void modify(ReplyVo vo) throws Exception{
		sql.update(namespace + ".replyModify", vo);
	
	}

	
	//댓글 삭제
	@Override
	public void delete(ReplyVo vo) throws Exception{
		sql.delete(namespace+ ".replyDelete", vo);
	}
}
