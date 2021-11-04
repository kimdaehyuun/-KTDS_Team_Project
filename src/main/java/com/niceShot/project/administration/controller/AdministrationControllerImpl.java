package com.niceShot.project.administration.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niceShot.project.administration.service.AdministrationService;
import com.niceShot.project.administration.vo.AdministrationVO;
import com.niceShot.project.member.vo.MemberVO;

@Controller("administrationController")
public class AdministrationControllerImpl implements AdministrationController {
	@Autowired
	private AdministrationService adminstrationService;
	@Autowired
	private AdministrationVO administrationVO;
	
	
	////홈페이지 이동////
	@Override
	@RequestMapping(value = "/member/administration.do", method = RequestMethod.GET)
	public ModelAndView adminPdList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		
		///관리자 일때만 관리자 홈페이지 들어갈수있게끔 기능 ///
		if (memberVO != null) {
			String user_rank_id = memberVO.getUser_rank_id();
			System.out.println(user_rank_id);
			if (user_rank_id.equals("관리자")) {
				mav.setViewName(viewName);
			} else {
				mav.setViewName("redirect:/home.do");
			}
		} else {
			mav.setViewName("redirect:/home.do");
		}
		////db값 뽑은것/////
		List adminProductsList = adminstrationService.adminListProducts();
		List adminProductsList2 = adminstrationService.adminListProducts2();
		List adminProductsList3 = adminstrationService.adminListProducts3();
		
		mav.addObject("AdminProductsList", adminProductsList);
		mav.addObject("AdminProductsList2", adminProductsList2);
		mav.addObject("AdminProductsList3", adminProductsList3);
		return mav;
	}
	//user_id값 받아서 같은값 삭제//
	@Override
	@RequestMapping(value = "/member/removeAdminMem.do", method = RequestMethod.GET)
	public ModelAndView adminDelMem(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		adminstrationService.removeAdminMem(user_id);
		ModelAndView mav = new ModelAndView("redirect:/member/administration.do");
		return mav;
	}
	
	///cs_board_id 받아서 같은값 삭제////
	@Override
	@RequestMapping(value = "/member/removeAdminBoard.do", method = RequestMethod.GET)
	public ModelAndView adminDelBoard(@RequestParam("cs_board_id") String cs_board_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		adminstrationService.removeAdminBoard(cs_board_id);
		ModelAndView mav = new ModelAndView("redirect:/member/administration.do");
		return mav;
	}
	@Override
	@RequestMapping(value = "/member/administrationdetail.do", method = RequestMethod.GET)
	public ModelAndView admindetail(@RequestParam("product_id") String product_id,@RequestParam("user_id") String user_id,@RequestParam("order_id") String order_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		//위에까지가 페이지이동///
		
		//2개값 받아서 디비뽑는거//
		Map<String,Object> list = new HashMap<String, Object>();
		list.put("product_id", product_id);
		list.put("user_id", user_id);
		
		administrationVO = adminstrationService.adDetail(list);
		mav.addObject("admindetail",administrationVO);
		
		administrationVO = adminstrationService.buyAdDetail(order_id);
		mav.addObject("buyAdDetail",administrationVO);
		
		
		
		return mav;
	}
	
	
	
}
