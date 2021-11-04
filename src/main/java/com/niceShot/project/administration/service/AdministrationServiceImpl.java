package com.niceShot.project.administration.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niceShot.project.administration.dao.AdministrationDAO;
import com.niceShot.project.administration.vo.AdministrationVO;
import com.niceShot.project.product.dao.ProductDAO;

@Service("administrationService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdministrationServiceImpl implements AdministrationService {
	@Autowired
	private AdministrationDAO administrationDAO;
	
	@Override
	public List adminListProducts() throws DataAccessException {
		List adminProductsList = null;
		adminProductsList = administrationDAO.selectAdminProductList();
		return adminProductsList;
	}
	
	@Override
	public List adminListProducts2() throws DataAccessException {
		List adminProductsList2 = null;
		adminProductsList2 = administrationDAO.selectAdminProductList2();
		return adminProductsList2;
	
	
	}
	
	@Override
	public List adminListProducts3() throws DataAccessException {
		List adminProductsList3 = null;
		adminProductsList3 = administrationDAO.selectAdminProductList3();
		return adminProductsList3;
	
	
	}
	
	@Override
	public int removeAdminMem(String user_id) throws DataAccessException {
		return administrationDAO.removeAdminMem(user_id);
	}
	
	@Override
	public int removeAdminBoard(String cs_board_id) throws DataAccessException {
		return administrationDAO.removeAdminBoard(cs_board_id);
	}
	@Override
	public AdministrationVO adDetail(Map<String, Object> list) throws DataAccessException {
		AdministrationVO administrationVO = administrationDAO.adDetail(list);
		return administrationVO;
	}
	@Override
	public AdministrationVO buyAdDetail(String order_id) throws DataAccessException {
		AdministrationVO administrationVO = null;
		administrationVO = administrationDAO.buyAdDetail(order_id);
		return administrationVO;
	}
}
