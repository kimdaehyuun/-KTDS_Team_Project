package com.niceShot.project.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niceShot.project.product.vo.OrderVO;
import com.niceShot.project.product.vo.OrderdetailVO;
import com.niceShot.project.product.vo.ProductVO;

public interface ProductController {
	public ModelAndView pdList(@RequestParam("cate_id") String cate_id, @RequestParam("mode") String mode,
			@RequestParam("filter") String filter, @RequestParam("safe") String safe, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView pdDetail(@RequestParam("product_id") String product_id,@RequestParam("cate_id") String cate_id,
			@RequestParam("user_id") String user_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public ModelAndView pdSafePurchase(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response);
	
	public ModelAndView pdSubmit(@ModelAttribute("proInfo") ProductVO product, HttpServletRequest request, HttpServletResponse response);
	
	public ModelAndView pdRemove(@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response);
	
	public ModelAndView pdPay(@ModelAttribute("proPay") OrderVO orderVO, @ModelAttribute("proPayDetail") OrderdetailVO orderdetailVO,
			@RequestParam("product_id") String product_id, HttpServletRequest request, HttpServletResponse response);


}
