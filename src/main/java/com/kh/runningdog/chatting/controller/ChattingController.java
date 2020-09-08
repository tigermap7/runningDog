package com.kh.runningdog.chatting.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("moveChatting.do")
	public String moveMyChatting() {
		logger.info("moveChatting.do run...");
		return "mypage/myChatting";
	}
	
	@RequestMapping("moveChattingView.do")
	public String moveChattingView() {
		return "/mypage/myChattingView";
	}
}
