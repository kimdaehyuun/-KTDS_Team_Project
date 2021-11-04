package com.niceShot.project.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.product.vo.CategoryVO;
import com.niceShot.project.product.vo.OrderVO;
import com.niceShot.project.product.vo.OrderdetailVO;
import com.niceShot.project.product.vo.ProductVO;
import com.niceShot.project.product.vo.UserVO;
import com.niceShot.project.product.vo.WishVO;

public interface ProductService {
	public List pdListCallCate(Map<String, Object> list) throws DataAccessException;

	public ProductVO pdDetail(Map<String, Object> map) throws Exception;

	public CategoryVO callCategoryName(String cate_id) throws DataAccessException;
	
	public UserVO callUserId(String user_id) throws DataAccessException;
	
	public List callOtherProduct(String user_id) throws DataAccessException;
	
	public String checkWish(WishVO wishVO) throws DataAccessException;
	
	public int insertWish(WishVO wishVO) throws DataAccessException;
	
	public int updateWish(WishVO wishVO) throws DataAccessException;
	
	public String wishCount(WishVO wishVO) throws DataAccessException;
	
	public ProductVO pdSafeProduct(String product_id) throws DataAccessException;
	
	public int pdSubmit(ProductVO productVO) throws DataAccessException;
	
	public int removeProduct(String product_id) throws DataAccessException;
	
	public String pdPay(OrderVO orderVO) throws DataAccessException;
	
	public int pdPayDetail(OrderdetailVO orderdetailVO) throws DataAccessException;
	
	public String dontSell(String product_id) throws DataAccessException;

}
