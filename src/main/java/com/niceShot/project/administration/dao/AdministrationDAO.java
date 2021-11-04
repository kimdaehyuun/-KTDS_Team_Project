package com.niceShot.project.administration.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.administration.vo.AdministrationVO;

public interface AdministrationDAO {
	public List selectAdminProductList() throws DataAccessException;
	public List selectAdminProductList2() throws DataAccessException;
	public List selectAdminProductList3() throws DataAccessException;
	
	public int removeAdminMem(String user_id) throws DataAccessException;
	public int removeAdminBoard(String cs_board_id) throws DataAccessException;
	public AdministrationVO adDetail(Map<String, Object> list) throws DataAccessException;
	public AdministrationVO buyAdDetail(String order_id) throws DataAccessException;
}
