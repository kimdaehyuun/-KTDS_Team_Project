package com.niceShot.project.administration.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.administration.vo.AdministrationVO;

public interface AdministrationService {
	public List adminListProducts() throws DataAccessException;
	public List adminListProducts2() throws DataAccessException;
	public List adminListProducts3() throws DataAccessException;
	
	public int removeAdminMem(String user_id) throws DataAccessException;
	public int removeAdminBoard(String cs_board_id) throws DataAccessException;
	public AdministrationVO adDetail(Map<String, Object> list) throws DataAccessException;
	public AdministrationVO buyAdDetail(String order_id) throws DataAccessException;
}
