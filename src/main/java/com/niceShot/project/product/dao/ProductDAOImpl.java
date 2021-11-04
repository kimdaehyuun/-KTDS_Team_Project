package com.niceShot.project.product.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.niceShot.project.product.vo.CategoryVO;
import com.niceShot.project.product.vo.OrderVO;
import com.niceShot.project.product.vo.OrderdetailVO;
import com.niceShot.project.product.vo.ProductVO;
import com.niceShot.project.product.vo.UserVO;
import com.niceShot.project.product.vo.WishVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;

	
	
	@Override
	public List pdListCallCate(Map<String, Object> list) throws DataAccessException {
		List<ProductVO> pdListCateId = null;
		pdListCateId = sqlSession.selectList("mapper.product.selectListCategory", list);
		return pdListCateId;
	}

	@Override
	public ProductVO selectPdDetail(Map<String, Object> map) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectPdDetail", map);
	}

	@Override
	public CategoryVO callCategoryName(String cate_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectCategory", cate_id);
	}
	
	@Override
	public UserVO callUserId(String user_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectUserId", user_id);
	}
	
	@Override
	public List callOtherProduct(String user_id) throws DataAccessException {
		List<ProductVO> otherProduct = null;
		otherProduct = sqlSession.selectList("mapper.product.selectOtherProduct", user_id);
		return otherProduct;
	}
	
	@Override
	public String checkWish(WishVO wishVO) throws DataAccessException {
		String resultA = sqlSession.selectOne("mapper.product.checkWish", wishVO);
		return resultA;
	}
	
	@Override
	public int insertWish(WishVO wishVO) throws DataAccessException {
		int resultB = sqlSession.insert("mapper.product.insertWish", wishVO);
		return resultB;
	}
	
	@Override
	public int updateWish(WishVO wishVO) throws DataAccessException {
		int resultC = sqlSession.update("mapper.product.updateWish", wishVO);
		return resultC;
	}
	
	@Override
	public String wishCount(WishVO wishVO) throws DataAccessException {
		String likeCount = sqlSession.selectOne("mapper.product.countWish", wishVO);
		return likeCount;
	}
	
	@Override
	public ProductVO pdSafeProduct(String product_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectSafeProduct", product_id);
	}
	
	@Override
	public int pdSubmit(ProductVO productVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.product.pdSubmit", productVO);
		return result;
	}
	
	@Override
	public int removeProduct(String product_id) throws DataAccessException {
		int result = sqlSession.delete("mapper.product.removeProduct", product_id);
		return result;
	}
	
	@Override
	public String pdPay(OrderVO orderVO) throws DataAccessException {
		sqlSession.insert("mapper.product.pdPay", orderVO);
		return orderVO.getUser_id();
	}
	
	@Override
	public int pdPayDetail(OrderdetailVO orderdetailVO) throws DataAccessException {
		int resultA = sqlSession.insert("mapper.product.pdPayDetail", orderdetailVO);
		return resultA;
	}
	
	@Override
	public String dontSell(String product_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.dontSell", product_id);
	}

}
