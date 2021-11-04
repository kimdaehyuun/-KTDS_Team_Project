package com.niceShot.project.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niceShot.project.product.dao.ProductDAO;
import com.niceShot.project.product.vo.CategoryVO;
import com.niceShot.project.product.vo.OrderVO;
import com.niceShot.project.product.vo.OrderdetailVO;
import com.niceShot.project.product.vo.ProductVO;
import com.niceShot.project.product.vo.UserVO;
import com.niceShot.project.product.vo.WishVO;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private CategoryVO categoryVO;

	
	@Override
	public List pdListCallCate(Map<String, Object> list) throws DataAccessException {
		List pdListCateId = null;
		pdListCateId = productDAO.pdListCallCate(list);
		return pdListCateId;
	}

	@Override
	public ProductVO pdDetail(Map<String, Object> map) throws Exception {
		ProductVO productVO = productDAO.selectPdDetail(map);
		return productVO;
	}

	@Override
	public CategoryVO callCategoryName(String cate_id) throws DataAccessException {
		return productDAO.callCategoryName(cate_id);
	}
	
	@Override
	public UserVO callUserId(String user_id) throws DataAccessException {
		return productDAO.callUserId(user_id);
	}
	
	@Override
	public List callOtherProduct(String user_id) throws DataAccessException {
		List otherProduct = null;
		otherProduct = productDAO.callOtherProduct(user_id);
		return otherProduct;
	}
	
	@Override
	public String checkWish(WishVO wishVO) throws DataAccessException {
		String resultA = "";
		resultA = productDAO.checkWish(wishVO);
		return resultA;
	}
	
	@Override
	public int insertWish(WishVO wishVO) throws DataAccessException {
		int resultB = 0;
		resultB = productDAO.insertWish(wishVO);
		return resultB;
	}
	
	@Override
	public int updateWish(WishVO wishVO) throws DataAccessException {
		int resultC = 0;
		resultC = productDAO.updateWish(wishVO);
		return resultC;
	}
	
	@Override
	public String wishCount(WishVO wishVO) throws DataAccessException {
		String likeCount = "";
		likeCount = productDAO.wishCount(wishVO);
		return likeCount;
	}
	
	@Override
	public ProductVO pdSafeProduct(String product_id) throws DataAccessException {
		return productDAO.pdSafeProduct(product_id);
	}
	
	@Override
	public int pdSubmit(ProductVO productVO) throws DataAccessException {
		return productDAO.pdSubmit(productVO);
	}
	
	@Override
	public int removeProduct(String product_id) throws DataAccessException {
		return productDAO.removeProduct(product_id);
	}
	
	@Override
	public String pdPay(OrderVO orderVO) throws DataAccessException {
		return productDAO.pdPay(orderVO);
	}
	
	@Override
	public int pdPayDetail(OrderdetailVO orderdetailVO) throws DataAccessException {
		return productDAO.pdPayDetail(orderdetailVO);
	}
	
	@Override
	public String dontSell(String product_id) throws DataAccessException {
		return productDAO.dontSell(product_id);
	}

}
