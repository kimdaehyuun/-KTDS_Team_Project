package com.niceShot.project.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.niceShot.project.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.board";
	
	
	//게시물 목록
	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}

     //게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		
		sql.insert(namespace + ".write", vo);

	}
	
//게시물 조회
	 public BoardVO view(String cs_board_id) throws Exception{
		 return sql.selectOne(namespace + ".view", cs_board_id);
	 }
	 
	 //게시물 수정
	 @Override
	 public void modify(BoardVO vo) throws Exception{
		 sql.update(namespace + ".modify", vo);
	 }
	
	 //게시물 삭제
	 public void delete(String cs_board_id) throws Exception{
		 sql.delete(namespace + ".delete",cs_board_id);
	 }
	 
	 //게시물 총 갯수
	 @Override
	 public int count() throws Exception{
		 return sql.selectOne(namespace + ".count");
	 }
	 
	 //게시물 목록 + 페이징
	 @Override
	 public List<BoardVO> listPage(int rowStart, int rowEnd, String b_ctgry_id) throws Exception{
		 HashMap<String, String> data = new HashMap<String, String>();
		 
		 String rowS = Integer.toString(rowStart);
		 String rowE = Integer.toString(rowEnd);
		 
		 data.put("rowStart", rowS);
		 data.put("rowEnd",rowE);
		 data.put("b_ctgry_id", b_ctgry_id);
		 
		 return sql.selectList(namespace + ".listPage", data);
	 }
	 
	
}
