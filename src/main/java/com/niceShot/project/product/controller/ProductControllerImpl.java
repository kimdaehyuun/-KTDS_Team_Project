package com.niceShot.project.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.product.service.ProductService;
import com.niceShot.project.product.vo.CategoryVO;
import com.niceShot.project.product.vo.OrderVO;
import com.niceShot.project.product.vo.OrderdetailVO;
import com.niceShot.project.product.vo.ProductVO;
import com.niceShot.project.product.vo.UserVO;
import com.niceShot.project.product.vo.WishVO;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	ProductVO productVO;
	@Autowired
	CategoryVO categoryVO;
	@Autowired
	UserVO userVO;
	@Autowired
	WishVO wishVO;
	@Autowired
	MemberVO memberVO;

	@RequestMapping(value = "/product/pkCheck.do", method = RequestMethod.GET)
	private ModelAndView pkCheck(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/product/pdRegister.do", method = RequestMethod.GET)
	private ModelAndView pdRegister(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	@RequestMapping(value = "/product/pdList.do", method = RequestMethod.GET)
	public ModelAndView pdList(@RequestParam("cate_id") String cate_id, @RequestParam("mode") String mode,
			@RequestParam("filter") String filter, @RequestParam("safe") String safe, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		Map<String, Object> list = new HashMap<String, Object>();
		list.put("cate_id", cate_id);
		list.put("mode", mode);
		list.put("filter", filter);
		list.put("safe", safe);
		List pdListCateId = productService.pdListCallCate(list);
		mav.addObject("pdListgetCate", pdListCateId);

		return mav;
	}

	@Override
	@RequestMapping(value = "/product/pdDetail.do", method = RequestMethod.GET)
	public ModelAndView pdDetail(@RequestParam("product_id") String product_id, @RequestParam("cate_id") String cate_id,
			@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		// Product
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("cate_id", cate_id);
		productVO = productService.pdDetail(map);
		mav.setViewName(viewName);
		mav.addObject("pdDetailList", productVO);

		// Category
		categoryVO = productService.callCategoryName(cate_id);
		mav.addObject("getCategory", categoryVO);

		// User Table
		userVO = productService.callUserId(user_id);
		mav.addObject("getUserId", userVO);

		// 해당 유저의 다른 상품 조회
		List otherProduct = productService.callOtherProduct(user_id);
		mav.addObject("getOtherProduct", otherProduct);

		// 상세정보 페이지에서 찜 하기
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		wishVO.setProduct_id(product_id);

		// 해당 상품을 총 몇명의 사람이 찜했는지 카운트
		String likeCount = productService.wishCount(wishVO);
		mav.addObject("countWish", likeCount);
		
		// 거래가 이미 진행중인 상품을 결제하기를 누르면 결제를 하지 못하도록
		String dontSell = productService.dontSell(product_id);
		mav.addObject("dontSell", dontSell);

		// 세션에 값이 없으면
		if (memberVO == null) {
			System.out.println("세션이 비었음!");
		} else {
			mav.addObject("getLoginId", memberVO);

			// 로그인한 사람의 좋아요 현황 확인
			wishVO.setUser_id(memberVO.getUser_id());

			String resultLike = productService.checkWish(wishVO);
			mav.addObject("getWish", resultLike);
			mav.addObject("user_id", user_id);
		}

		return mav;
	}

	// 찜 기능 구현
	@RequestMapping(value = "/product/wish.do", method = RequestMethod.GET)
	@ResponseBody
	public String insertwish(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String resultB = null;
		String Allresult = null;
		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String product_id = request.getParameter("product_id");
		String user_id = memberVO.getUser_id();

		wishVO.setProduct_id(product_id);
		wishVO.setUser_id(user_id);

//		로그인 한 사람이 해당 상품에 좋아요를 누른적이 있는지 확인
		String resultA = productService.checkWish(wishVO);
//		만약 좋아요를 한적이 없다면 insert를 해준다
		if (resultA == null) {
			productService.insertWish(wishVO);
			String likeCount = productService.wishCount(wishVO);
			Allresult = "insert1," + likeCount;
		}
//		만약 좋아요를 한적이 있다면 좋아요를 취소해주는 변경
		else if (resultA.equals("1")) {
			// VO 상에서 좋아요 값을 0으로 설정해두고 그거를 디비에 적용
			wishVO.setProduct_wishlist("0");
			productService.updateWish(wishVO);
			String likeCount = productService.wishCount(wishVO);
			Allresult = "update0," + likeCount;
		}
		// 좋아요를 취소했던 사람이라서 다시 좋아요로 변경
		else if (resultA.equals("0")) {
			// VO 상에서 좋아요 값을 1로 설정해두고 그거를 디비에 적용
			wishVO.setProduct_wishlist("1");
			productService.updateWish(wishVO);
			String likeCount = productService.wishCount(wishVO);
			Allresult = "update1," + likeCount;
		} else {
			System.out.println("insert, update all failed.. ");
		}

		return Allresult;
	}

	@Override
	@RequestMapping(value = "/product/pdSafePurchase.do", method = RequestMethod.GET)
	public ModelAndView pdSafePurchase(@RequestParam("product_id") String product_id, HttpServletRequest request,
			HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		// 결제 버튼 누를때의 창을 기억하고 있다가
		String referer = (String) request.getHeader("REFERER");

		HttpSession session = request.getSession();
		session.setAttribute("referer", referer);

		// 상품 상세정보에 있는 상품 정보를 가지고 안전결제 창으로 이동하기 위함
		productVO = productService.pdSafeProduct(product_id);
		mav.addObject("pdSafe", productVO);

		// 세션에서 로그인 정보 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		// 세션에 값이 없으면
		if (memberVO == null) {
			System.out.println("세션이 비었음!");
		} else {
			mav.addObject("getLoginIdSafe", memberVO);
		}

		return mav;
	}

	// 상품 등록을 하기 위한 동작을 지정해주는 컨트롤러

	@Override
	@RequestMapping(value = "/product/pdSubmit.do", method = RequestMethod.POST)
	public ModelAndView pdSubmit(@ModelAttribute("proInfo") ProductVO productVO, HttpServletRequest request,
			HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		// 로그인한 유저 정보를 세션에서 받아오는 거
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		// 세션에 값이 없으면
		if (memberVO == null) {
			System.out.println("세션이 비었음!");
			mav.setViewName("redirect:/member/login.do");
		} else {
			String user_id = memberVO.getUser_id();
			productVO.setUser_id(user_id);

			String test = productVO.getProduct_safe();
			if (test == null) {
				productVO.setProduct_safe("0");
				test = productVO.getProduct_safe();
			} else {

			}

			System.out.println("테스트중" + test);

			mav.setViewName("redirect:/product/pdRegister.do");

			// 인서트 작업
			int result = 0;
			result = productService.pdSubmit(productVO);

			if (result != 0) {
				System.out.println("상품 등록 성공!");
			} else {
				System.out.println("상품 등록 실패..");
			}
			mav.setViewName("redirect:/product/pdList.do?cate_id=1&mode=1&filter=&soldout=&safe=");
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/product/removeProduct.do", method = RequestMethod.GET)
	public ModelAndView pdRemove(@RequestParam("product_id") String product_id, HttpServletRequest request,
			HttpServletResponse response) {
		productService.removeProduct(product_id);
		ModelAndView mav = new ModelAndView("redirect:/product/pdList.do?cate_id=1&mode=1&filter=&soldout=&safe=");
		return mav;
	}

	// 안전 결제 페이지에서 결제 버튼 클릭시 주문 테이블에 데이터가 담기도록

	@Override
	@RequestMapping(value = "/product/pdPay.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView pdPay(@ModelAttribute("proPay") OrderVO orderVO,
			@ModelAttribute("proPayDetail") OrderdetailVO orderdetailVO, @RequestParam("product_id") String product_id,
			HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);

		// 로그인한 유저 정보를 세션에서 받아오는 거
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		// 주문 테이블에 담는 이용자 정보는 로그인한 구매자의 정보가 담긴다
		String user_id = memberVO.getUser_id();
		orderVO.setUser_id(user_id);

		productService.pdPay(orderVO);
		String order_id = orderVO.getOrder_id();

		if (order_id != "") {
			System.out.println("주문 테이블 인서트 성공!");
		} else {
			System.out.println("주문 테이블 인서트 실패..");
		}

		// 주문 상세 테이블에 구매하기로 한 상품의 아이디 값을 담는다
		orderdetailVO.setProduct_id(product_id);
		orderdetailVO.setOrder_id(order_id);

		int resultA = 0;
		resultA = productService.pdPayDetail(orderdetailVO);

		if (resultA != 0) {
			System.out.println("주문 상세 테이블 인서트 성공!");
		} else {
			System.out.println("주문 상세 테이블 인서트 실패..");
		}
		
		String referer = (String)session.getAttribute("referer");
		mav.setViewName("redirect:" + referer);

		return mav;
	}

}
