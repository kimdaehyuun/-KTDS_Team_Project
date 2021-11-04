package com.niceShot.project.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niceShot.project.member.service.MemberService;
import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.member.vo.RankVO;
import com.niceShot.project.product.vo.ProductVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	ProductVO productVO;
	@Autowired
	RankVO rankVO;
	@Autowired
	BusinessVO businessVO;

	/* 페이지 이동 컨트롤러 */

	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	private ModelAndView loginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String referer = (String)request.getHeader("REFERER");
		
		HttpSession session = request.getSession();
		session.setAttribute("referer", referer);
		
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/registration.do", method = RequestMethod.GET)
	private ModelAndView registerationPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/member/business.do", method = RequestMethod.GET)
	private ModelAndView BusinessRegPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	/* 기능 컨트롤러 ***Controller에서 기능 구현하려고 하는 것들을 여기서 완성 */

	@Override
	@RequestMapping(value = "/member/loginChk.do", method = RequestMethod.POST)
	public ModelAndView loginChk(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("loginChk is WORKING");
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);

		if (memberVO != null) {
			HttpSession session = request.getSession();
			
			session.setMaxInactiveInterval(0);
			mav.setViewName("redirect:/home.do");
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			
			String biz_id = member.getBiz_id();
			
			if(biz_id != null) {
				System.out.println(biz_id + " is not null");
				String user_id = member.getUser_id();
				BusinessVO businessVO = memberService.getBusinessInfo(user_id);
				session.setAttribute("business", businessVO);
			} else {
				System.out.println(biz_id + " is null");
			}
			
			String user_rank_id = memberVO.getUser_rank_id();
			
			rankVO = memberService.memberRank(user_rank_id);
			String rank_name = rankVO.getUser_ranking();

			memberVO.setUser_rank_id(rank_name);
			
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			
			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				String referer = (String) session.getAttribute("referer");
				mav.setViewName("redirect:" + referer);
			}
		} else {
			System.out.println("로그인 실패");
			rAttr.addFlashAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/login.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("info") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String chk = request.getParameter("chkSignVal");

		int result = 0;
		result = memberService.register(memberVO);
		if (result != 0) {
			System.out.println("회원가입 성공");

			if (chk.equals("1")) {
				System.out.println("chk : 1 - 사업자회원");
				mav.setViewName("redirect:/member/business.do");

			} else if (chk.equals("2")) {
				System.out.println("chk : 2 - 일반회원");
				mav.setViewName("redirect:/member/login.do");
			} else {
				System.out.println("SOMETHING IS WRONG");
			}
			
			MemberVO member = memberService.login(memberVO);
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			session.setAttribute("isLogOn", true);

		} else {
			System.out.println("회원가입 실패?");
			mav.setViewName("redirect:/member/register.do");
			rAttr.addFlashAttribute("result", "registerFail");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/businessRegister.do", method = RequestMethod.POST)
	public ModelAndView biz_register(@ModelAttribute("info") BusinessVO businessVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.bizRegist(businessVO);

		if (result != 0) {
			System.out.println("사업자 등록 성공");
			
			HttpSession session = request.getSession();
			
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			String user_id = memberVO.getUser_id();
			
			System.out.println("로그인 중인 유저아이디 GET : " + user_id);
			
			int resultB = memberService.addBizId(user_id);
			System.out.println("RESULTB값 : "+resultB);
			if (resultB != 0) {
				System.out.println("사업자ID 업데이트 성공");
				mav.setViewName("redirect:/home.do");
			} else {
				System.out.println("사업자ID 업데이트 실패");
				rAttr.addFlashAttribute("result", "registerFail");
				mav.setViewName("redirect:/member/business.do");
			}
		} else {
			System.out.println("회원가입 실패?");
			rAttr.addFlashAttribute("result", "registerFail");
			mav.setViewName("redirect:/member/business.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/member/bizNumChk.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String bizNumChk(HttpServletRequest request) {
		String biz_num = request.getParameter("biz_num");
		System.out.println(biz_num);
		int result = memberService.bizNumChk(biz_num);
		System.out.println(result);
		return Integer.toString(result);
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String referer = (String)request.getHeader("REFERER");
		HttpSession session = request.getSession();
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:" + referer);
		return mav;
	}

	@RequestMapping(value = "/member/accIdChk.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String user_account = request.getParameter("user_account");
		int result = memberService.idCheck(user_account);
		return Integer.toString(result);
	}

	@Override
	@RequestMapping(value = "/member/myPage.do", method = RequestMethod.GET)
	public ModelAndView myPage(RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();

		if (memberVO == null) {
			System.out.println("True 실행");

			mav.setViewName("redirect:/member/login.do");

			rAttr.addFlashAttribute("result", "notLogin");

			System.out.println("로그인 후에 이용 가능합니다.");
		} else {
			System.out.println("False 실행");

			String user_id = memberVO.getUser_id();

			List<Map<String, String>> map = memberService.selectUserInfoMap(user_id);
			List<Map<String, String>> wish = memberService.selectUserWish(user_id);
			List<Map<String, String>> check = memberService.selectCheckSale(user_id);
			
			String viewName = (String) request.getAttribute("viewName");
			
			mav.addObject("infoWish", wish);
			mav.addObject("infoMap", map);
			mav.addObject("infoCheck", check);
			mav.setViewName(viewName);
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/otherPage.do", method = RequestMethod.GET)
	public ModelAndView otherPage(@RequestParam("user_name") String user_name, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();

		// user_id로 유저 찾을 수 있도록 조정

		MemberVO memberVO = memberService.selectOtherUser(user_name);

		if (memberVO == null) {
			System.out.println("otherPage : True 실행");

			rAttr.addFlashAttribute("result", "notFountUser");

			mav.setViewName("redirect:/product/pdList.do");
		} else {
			System.out.println("otherPage : False 실행");

			String user_id = memberVO.getUser_id();

			List<Map<String, String>> map = memberService.selectUserInfoMap(user_id);

			String viewName = (String) request.getAttribute("viewName");

			mav.addObject("infoMap", map);
			mav.setViewName(viewName);
		}

		mav.addObject("userInfo", memberVO);

		return mav;
	}
	
	// 거래 상태를 변경하는 동작
	@Override
	@RequestMapping(value = "/member/updateState.do", method = RequestMethod.GET)
	public ModelAndView updateState(@RequestParam("product_id") String product_id, @RequestParam("od_status") String od_status,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("od_status", od_status);
		memberService.updateState(map);
		
		String referer = (String)request.getHeader("REFERER");
		ModelAndView mav = new ModelAndView("redirect:" + referer);
		return mav;
	}

	/* 무시 (그냥 놔두셈) */

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}
}
