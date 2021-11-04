package com.niceShot.project.administration.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdministrationController {
	public ModelAndView adminPdList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminDelMem(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminDelBoard(@RequestParam("cs_board_id") String cs_board_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView admindetail(@RequestParam("product_id") String product_id,@RequestParam("user_id") String user_id, @RequestParam("order_id") String order_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
}

