package com.niceShot.project.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niceShot.project.chat.service.ChatService;
import com.niceShot.project.chat.vo.ChatVO;
import com.niceShot.project.chat.vo.MessageVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.product.vo.ProductVO;

@Controller("chatController")
public class ChatControllerImpl implements ChatController {

	@Autowired
	private ChatService chatService;
	@Autowired
	ChatVO chatVO;
	@Autowired
	MessageVO messageVO;
	
	@RequestMapping(value = "/chat/chatRoom.do", method = RequestMethod.GET)
	public ModelAndView chatRoom(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		System.out.println("IM IN");
		
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		String user_id = memberVO.getUser_id();
		
		System.out.println(user_id);
		
		List<Map<String, String>> map = chatService.searchRoom(user_id);
		
		mav.addObject("list", map);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/chat/chat.do", method = RequestMethod.GET)
	public ModelAndView chat(@RequestParam(value = "resultAvailable", defaultValue = "0") int resultAvailable,
			@RequestParam(value = "chat_id", defaultValue = "0") String chat_id, HttpServletRequest request,
			HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		HttpSession session = request.getSession();
		
		List<MessageVO> messageVO;

		if (resultAvailable == 0) {
			System.out.println("ChatLoad Failed : " + resultAvailable);
			mav.setViewName("redirect:/home.do");
		} else {
			System.out.println("ChatLoad Success : " + resultAvailable);
		}

		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO != null) {
			System.out.println("Session is Not Null : Login");
		} else {
			System.out.println("Session is Null : Not Login");
			mav.setViewName("redirect:/home.do");
		}
		
		if (chat_id == null || chat_id == "" || chat_id == "0") {
			System.out.println("There is no Room Entry with No."+chat_id);
			mav.setViewName("redirect:/home.do");
		} else {
			System.out.println("Current Room Entry : " + chat_id);
			messageVO = chatService.getChatMessage(chat_id);
			
			mav.addObject("message", messageVO);
		}
		
		mav.addObject("chat_id", chat_id);

		return mav;
	}

	@Override
	@RequestMapping(value = "/chat/chatRoomCheck.do", method = RequestMethod.GET)
	public ModelAndView chatRoomCheck(RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		String product_id = request.getParameter("product_id");

		System.out.println("PRODUCT_ID : " + product_id);

		ChatVO chatVO = new ChatVO();

		if (product_id == null || product_id == "") {
			System.out.println("YOU DON'T HAVE Product_ID!!");
			mav.setViewName("redirect:/home.do");
			return mav;
		}

		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		String user_id = memberVO.getUser_id();

		Map<String, String> map = new HashMap<String, String>();

		map.put("product_id", product_id);
		map.put("user_id", user_id);

		System.out.println("Using entrySet and toString");
		for (Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry);
		}

		int result = chatService.checkChat(map);

		if (result == 0) {
			System.out.println("I don't have ChatRoom : " + result);

			System.out.println("Creating New ChatRoom");

			int create = chatService.CreateChatRoom(map);

			if (create != 0) {
				System.out.println("Create ChatRoom Success : " + create);
				System.out.println("Re-Search ChatRoom");

				result = chatService.checkChat(map);

				if (result == 0) {
					System.out.println("Something is really WRONG!!! : " + result);
					mav.setViewName("redirect:/home.do");
					return mav;
				} else {
					System.out.println("ChatRoom Load Successfully!");

					chatVO = chatService.LoadChatRoom(map);

					mav.setViewName("redirect:/chat/chat.do");
				}

			} else {
				System.out.println("Create ChatRoom FAILED : " + create);
				mav.setViewName("redirect:/home.do");
				return mav;
			}
		} else {
			System.out.println("I have ChatRoom : " + result);
			System.out.println("ChatRoom Load Successfully!");

			chatVO = chatService.LoadChatRoom(map);

			mav.setViewName("redirect:/chat/chat.do");
		}

		String chat_id = chatVO.getChat_id();

		System.out.println("Load '" + chat_id + "' Room");

		rAttr.addAttribute("chat_id", chat_id);
		rAttr.addAttribute("resultAvailable", result);

		return mav;
	}

	@RequestMapping(value = "/chat/msgSend.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	private String msgSend(HttpServletRequest request, HttpServletResponse response) {
		
		String chat_id = request.getParameter("chat_id");
		String msg_writer = request.getParameter("msg_writer");
		String msg = request.getParameter("msg");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("chat_id", chat_id);
		map.put("msg_writer", msg_writer);
		map.put("msg", msg);
		
		System.out.println("방 번호 : " + chat_id);
		System.out.println("작성자 : " + msg_writer);
		System.out.println("글 : " + msg);
		
		int result = chatService.sendMsg(map);
		
		System.out.println(result);
		
		return Integer.toString(result);
	}

	@RequestMapping(value = "/chat/loadChat.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	private ChatVO loadChat(@RequestParam("chat_id") String chat_id, HttpServletRequest request,
			HttpServletResponse response) throws DataAccessException {

		ChatVO chatVO = new ChatVO();

		return chatVO;
	}

}
