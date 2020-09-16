package com.kh.runningdog.chatting.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
		ArrayList<Integer> myChatList = null;
		if (member != null) {
			logger.info(Integer.toString(member.getUniqueNum()));
			logger.info(member.getNickname());
			room.setMemberNo(member.getUniqueNum());
			room.setNickname(member.getNickname());
			ArrayList<Chatroom> list = chatroomService.selectMyChatMember(room);
			int listcount = chatroomService.selectMyChatCount(room);
			model.addAttribute("list", list);
			model.addAttribute("listcount", listcount);
			
			room.setMemberNo(member.getUniqueNum());
			/*참여한 채팅방 리스트 불러온 후 세션에 저장*/
			myChatList = chatroomService.selectMyChatList(room);
			session.setAttribute("myChatList", myChatList);
		}
		return "mypage/myChatting";
	}
	
	@RequestMapping("moveChattingView.do")
	public String moveChattingView(@RequestParam("roomNo") int roomNo, @RequestParam("receiver") String receiver, @RequestParam("receiverNo") int uniqueNum, Model model){
		logger.info("moveChattingView.do run...");
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("receiver", receiver);
		model.addAttribute("receiverNo", uniqueNum);
		return "mypage/myChattingView";
	}
	
	@RequestMapping(value = "startChat.do", produces = "application/text; charset=utf-8")

	public String startChat(HttpSession session, Model model, @RequestParam("receiver") String name, @RequestParam("receiverNo") int uniqueNum) throws UnsupportedEncodingException{
		logger.info("startChat.do run...");
		Member member = (Member) session.getAttribute("loginMember");
		Chatroom room = new Chatroom();
		StartChat startChat = new StartChat();
		ArrayList<Integer> myChatList = null;
		String url = null;
		
		startChat.setInviterName(name);
		startChat.setInviterNo(uniqueNum);
		startChat.setInviteeName(member.getNickname());
		startChat.setInviteeNo(member.getUniqueNum());
		
		int exstRoomno = chatroomService.selectExistsRoomNo(startChat);
		logger.info("방 번호 존재 : " + exstRoomno);
		
		
		String receiver = URLEncoder.encode(name, "UTF-8");
		if (exstRoomno != 0) {
			url = "redirect:moveChattingView.do?roomNo=" + exstRoomno + "&receiver=" + receiver;
		} else {
			int result = chatroomService.insertStartChat(startChat);
			if (result > 0) {
				room.setMemberNo(member.getUniqueNum());
				/*참여한 채팅방 리스트 불러온 후 세션에 저장*/
				myChatList = chatroomService.selectMyChatList(room);
				session.setAttribute("myChatList", myChatList);
				int roomNo = myChatList.get(myChatList.size() - 1);
				url = "redirect:moveChattingView.do?roomNo=" + roomNo + "&receiver=" + receiver + "&receiverNo=" + uniqueNum;
			}
		}
		
		return url;
		// TODO: 이미 채팅방이 있다면 추가안하고 존재하는 채팅방으로 이동
	}
	
	@RequestMapping("deleteChat.do")
	public String deleteChat(@RequestParam("roomNo") int roomNo) {
		chatroomService.deleteChat(roomNo);
		return "forward:moveChatting.do";
	}
}
