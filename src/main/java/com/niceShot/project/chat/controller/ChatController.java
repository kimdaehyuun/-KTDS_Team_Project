package com.niceShot.project.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface ChatController {

	public ModelAndView chat(@RequestParam(value = "resultAvailable", defaultValue = "0") int resultAvailable,
			@RequestParam(value = "chat_id", defaultValue = "0") String chat_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView chatRoomCheck(RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
