package com.niceShot.project.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;

public interface MemberController {
	/*
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	*/
	
	/* 순서 Controller -> Service -> DAO */
	
	/* 필요한 기능이 있을시 여기에 추가 */
	
	public ModelAndView loginChk(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView register(@ModelAttribute("info") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView biz_register(@ModelAttribute("info") BusinessVO businessVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myPage(RedirectAttributes rAttr, HttpServletRequest requset, HttpServletResponse response) throws Exception;
	public ModelAndView otherPage(@RequestParam("user_name") String user_name, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateState(@RequestParam("product_id") String product_id, @RequestParam("od_status") String od_status,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
