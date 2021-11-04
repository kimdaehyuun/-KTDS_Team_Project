package com.niceShot.project.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.niceShot.project.board.dao.BoardDAO;
import com.niceShot.project.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> list() throws Exception {
		
		return dao.list();
	}
	
	//게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception{
		
		dao.write(vo);
	}
	
	
	//게시물 조회
	@Override 
	public BoardVO view (String cs_board_id) throws Exception{
		
		return dao.view(cs_board_id);
	}
	
	//게시물 수정
	 @Override 
	 public void modify(BoardVO vo) throws Exception{
		 dao.modify(vo);
	 }
	 
	 //게시물 삭제
	 public void delete(String cs_board_id) throws Exception{
		 dao.delete(cs_board_id);
	 }
	 
	 //게시물 총 갯수
	 @Override 
	 public int count() throws Exception{
		 return dao.count();
	 }
	 
	 //게시물 목록 +페이징
	 @Override
	 public List<BoardVO> listPage(int rowStart, int rowEnd, String b_ctgry_id) throws Exception{
		 return dao.listPage(rowStart, rowEnd, b_ctgry_id);
	 }
	 
	
}
