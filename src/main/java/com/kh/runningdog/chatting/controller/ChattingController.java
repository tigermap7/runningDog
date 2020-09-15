package com.kh.runningdog.chatting.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.runningdog.chatting.model.service.ChatroomService;
import com.kh.runningdog.chatting.model.vo.Chatroom;
import com.kh.runningdog.chatting.model.vo.StartChat;
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
	public String moveChattingView(@RequestParam("roomNo") int roomNo, @RequestParam("receiver") String receiver, Model model){
		logger.info("moveChattingView.do run...");
		logger.info(Integer.toString(roomNo));
		logger.info(receiver);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("receiver", receiver);
		return "mypage/myChattingView";
	}
	
	@RequestMapping("startChat.do")
	public String startChat(HttpSession session, Model model, @RequestParam("receiver") String name, @RequestParam("receiverNo") int uniqueNum){
		logger.info("startChat.do run...");
		Member member = (Member) session.getAttribute("loginMember");
		StartChat startChat = new StartChat();
		
		startChat.setInviterName(name);
		startChat.setInviterNo(uniqueNum);
		startChat.setInviteeName(member.getNickname());
		startChat.setInviteeNo(member.getUniqueNum());
		int result = chatroomService.insertStartChat(startChat);
		
		return "mypage/myChatting";
	}
	
	@RequestMapping("deleteChat.do")
	public String deleteChat(@RequestParam("roomNo") int roomNo) {
		chatroomService.deleteChat(roomNo);
		return "forward:moveChatting.do";
	}
}
