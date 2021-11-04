package com.niceShot.project.administration.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.niceShot.project.administration.vo.AdministrationVO;

@Repository("administrationDAO")
public class AdministrationDAOImpl implements AdministrationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAdminProductList() throws DataAccessException {
		List<AdministrationVO> adminProductsList = null;
		adminProductsList = sqlSession.selectList("mapper.admin.selectProductAdmin");
		return adminProductsList;
	}
	
	@Override
	public List selectAdminProductList2() throws DataAccessException {
		List<AdministrationVO> adminProductsList2 = null;
		adminProductsList2 = sqlSession.selectList("mapper.admin.selectProductAdmin2");
		return adminProductsList2;
	
	
	}
	
	@Override
	public List selectAdminProductList3() throws DataAccessException {
		List<AdministrationVO> adminProductsList3 = null;
		adminProductsList3 = sqlSession.selectList("mapper.admin.selectProductAdmin3");
		return adminProductsList3;
	
	
	}
	
	@Override
	public int removeAdminMem(String user_id) throws DataAccessException {
		int result = sqlSession.update("mapper.admin.removeAdminMem", user_id);
		return result;
	}
	@Override
	public int removeAdminBoard(String cs_board_id) throws DataAccessException {
		int resultBoard = sqlSession.delete("mapper.admin.removeAdminBoard", cs_board_id);
		return resultBoard;
	}
	@Override
	public AdministrationVO adDetail(Map<String, Object> list) throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.adDetail", list);
	}
	@Override
	public AdministrationVO buyAdDetail(String order_id) throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.buyAdDetail", order_id);
	}
	
}	
