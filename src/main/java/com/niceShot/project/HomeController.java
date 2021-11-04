package com.niceShot.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.GET) public String
	 * login(Locale locale, Model model) {
	 * logger.info("Welcome Login! The client locale is {}.", locale);
	 * 
	 * return "login"; }
	 * 
	 * @RequestMapping(value = "/registration", method = RequestMethod.GET) public
	 * String registration(Locale locale, Model model) {
	 * logger.info("Welcome Login! The client locale is {}.", locale);
	 * 
	 * return "registration"; }
	 * 
	 * @RequestMapping(value = "/mypage", method = RequestMethod.GET) public String
	 * mypage(Locale locale, Model model) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * return "mypage"; }
	 * 
	 * @RequestMapping(value = "/other", method = RequestMethod.GET) public String
	 * other(Locale locale, Model model) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * return "other"; }
	 * 
	 * @RequestMapping(value = "/customer_center", method = RequestMethod.GET)
	 * public String customerCenter(Locale locale, Model model) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * return "customer_service"; }
	 * 
	 * @RequestMapping(value = "/administration", method = RequestMethod.GET) public
	 * String administration(Locale locale, Model model, HttpServletRequest request)
	 * { logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "administration"; }
	 * 
	 * @RequestMapping(value = "/pkReg", method = RequestMethod.GET) public String
	 * pkReg(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "pkReg"; }
	 * 
	 * @RequestMapping(value = "/pkChk", method = RequestMethod.GET) public String
	 * pkChk(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "pkChk"; }
	 * 
	 * @RequestMapping(value = "/pdList", method = RequestMethod.GET) public String
	 * pdList(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "pdList"; }
	 * 
	 * @RequestMapping(value = "/pdDetail", method = RequestMethod.GET) public
	 * String pdDetail(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "pdDetail"; }
	 * 
	 * @RequestMapping(value = "/checkLogin", method = RequestMethod.POST) public
	 * String checkLogin(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); String userEmail =
	 * request.getParameter("user_email"); String userPwd =
	 * request.getParameter("user_password"); session.setAttribute("user_email",
	 * userEmail);
	 * 
	 * return "home"; }
	 * 
	 * @RequestMapping(value = "/logout", method = RequestMethod.GET) public String
	 * logout(Locale locale, Model model, HttpServletRequest request) {
	 * logger.info("Welcome Home! The client locale is {}.", locale);
	 * 
	 * HttpSession session = request.getSession(); session.invalidate();
	 * 
	 * return "home"; }
	 */
	
	
}
