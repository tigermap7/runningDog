package com.kh.runningdog.chatting.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runningdog.chatting.model.service.ChatroomService;
import com.kh.runningdog.chatting.model.vo.Chatroom;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class ChattingController {
	@Autowired
	private ChatroomService chatroomService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("moveChatting.do")
	public String moveMyChatting(Model model, HttpSession session, Chatroom room) {
		logger.info("moveChatting.do run...");
		Member member = (Member) session.getAttribute("loginMember");
		if (member != null) {
			logger.info(Integer.toString(member.getUniqueNum()));
			logger.info(member.getNickname());
			room.setMemberNo(member.getUniqueNum());
			room.setNickname(member.getNickname());
			ArrayList<Chatroom> list = chatroomService.selectMyChatMember(room);
			int listcount = chatroomService.selectMyChatCount(room);
			model.addAttribute("list", list);
			model.addAttribute("listcount", listcount);
		}
		return "mypage/myChatting";
	}
	
	@RequestMapping("moveChattingView.do")
	public String moveChattingView(){
		logger.info("moveChattingView.do run...");
		return "mypage/myChattingView";
	}
	
}
