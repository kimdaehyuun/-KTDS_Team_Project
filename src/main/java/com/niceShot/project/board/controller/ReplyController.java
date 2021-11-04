package com.niceShot.project.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niceShot.project.board.service.ReplyService;
import com.niceShot.project.board.vo.ReplyVo;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	
	@Inject
	private ReplyService replyService;
	
	
	//댓글 조회
	
	//댓글 작성
	@RequestMapping(value = "/write.do",  method = RequestMethod.POST)
	public String postWrite (ReplyVo vo, HttpServletRequest request) throws Exception {
		
		String cs_board_id = request.getParameter("cs_board_id");
		String cmt_content = request.getParameter("cmt_content");
		
		System.out.println("cs board id : " + cs_board_id);
		System.out.println("cmt_content : " + cmt_content);
		
		vo.setCs_board_id(cs_board_id);
		vo.setCmt_content(cmt_content);
		
		
		replyService.write(vo);
		
		return "redirect:/board/view.do?cs_board_id=" + vo.getCs_board_id(); 
		
	}
}
