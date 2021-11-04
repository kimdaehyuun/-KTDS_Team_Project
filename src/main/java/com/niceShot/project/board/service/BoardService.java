package com.niceShot.project.board.service;

import java.util.List;

import com.niceShot.project.board.vo.BoardVO;

public interface BoardService {

	//게시물 목록
	public List<BoardVO> list() throws Exception;
	
	
	//게시물 작성
	public void write(BoardVO vo) throws Exception;
	
	
	//게시물 조회
	public BoardVO view(String cs_board_id) throws Exception;
	
	
	//게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	//게시물 삭제
	 public void delete (String cs_board_id) throws Exception;
	 
	 
	//게시물 총 갯수
	 public int count() throws Exception;
	 
	 //게시물 목록+페이징
	 public List<BoardVO> listPage(int rowStart, int rowEnd, String b_ctgry_id) throws Exception;
	 
	 
	
	
}
