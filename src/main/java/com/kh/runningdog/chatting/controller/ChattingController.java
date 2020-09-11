package com.kh.runningdog.chatting.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

@Controller
public class ChattingController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("moveChatting.do")
	public String moveMyChatting() {
		logger.info("moveChatting.do run...");
		return "mypage/myChatting";
	}
	
	@RequestMapping("moveChattingView.do")
	public ModelAndView moveChattingView(ModelAndView mv, HttpSession session){
		mv.setViewName("mypage/myChattingView");
		session.setAttribute("userid", "userid");
		// User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/* mv.addObject("userid", session.getId()); */
//		System.out.println("id : " + session.getId());
		return mv;
	}
	
	@RequestMapping("testForm.do")
	public void testForm() {
		logger.info("form run...");
	}
}
