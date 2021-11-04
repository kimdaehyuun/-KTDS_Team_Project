package com.niceShot.project.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niceShot.project.board.service.BoardService;
import com.niceShot.project.board.service.ReplyService;
import com.niceShot.project.board.vo.BoardVO;
import com.niceShot.project.board.vo.ReplyVo;
import com.niceShot.project.member.vo.MemberVO;

@Controller("boardController")
@RequestMapping("/board/*")
public class Boardcontroller {

	@Inject
	private BoardService service;

	@Inject
	private ReplyService replyService;

	// 게시물 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String getList(Model model) throws Exception {

		List list = null;
		list = service.list();
		model.addAttribute("list", list);

		return "/board/list";
	}

	// 게시물 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String posttWrite() throws Exception {

		return "/board/write";
	}

	// 게시물 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String posttWrite(BoardVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("등록시도");

		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		String user_id = memberVO.getUser_id();

		vo.setUser_id(user_id);

		String cs_b_lock = vo.getCs_b_lock();


		if (cs_b_lock == null) {
			cs_b_lock = "1";
			vo.setCs_b_lock(cs_b_lock);
		}
		
		System.out.println(vo.getB_ctgry_id());

		service.write(vo);

		return "redirect:/board/listPage.do?num=1";
	}

	// 게시물 조회
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String getView(@RequestParam("cs_board_id") String cs_board_id, Model model, HttpServletRequest request)
			throws Exception {

		BoardVO vo = service.view(cs_board_id);

		model.addAttribute("view", vo);

		// 댓글 조회
		List<ReplyVo> reply = null;
		reply = replyService.list(cs_board_id);
		model.addAttribute("reply", reply);

		return "/board/view";
	}

	
	
	// 게시물 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String getModify(@RequestParam("cs_board_id") String cs_board_id, Model model) throws Exception {

		BoardVO vo = service.view(cs_board_id);

		model.addAttribute("view", vo);

		return "/board/modify";

	}

	// 게시물 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

		service.modify(vo);

		return "redirect:/board/view.do?cs_board_id=" + vo.getCs_board_id();
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String getDelete(@RequestParam("cs_board_id") String cs_board_id) throws Exception {

		service.delete(cs_board_id);

		return "redirect:/board/listPage.do?num=1";
	}

//게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage.do", method = RequestMethod.GET)
	public String getListPage(Model model, @RequestParam("num") int num, HttpServletRequest request) throws Exception {

		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지를 출력할 게시물 갯수
		int rowEnd = num * 10;

		// 하단 페이징 번호
		int pageNum = (int) Math.ceil((double) count / 10);

		// 출력할 게시물
		int rowStart = num * 10 - 9;

		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번쨰 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;

		String b_ctgry_id = request.getParameter("b_ctgry_id");

		System.out.println(b_ctgry_id);

		List<BoardVO> list = null;
		list = service.listPage(rowStart, rowEnd, b_ctgry_id);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);

		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		// 현재 페이지
		model.addAttribute("select", num);

		return "/board/listPage";

	}
}