package com.kh.runningdog.admin.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.chatting.model.service.ChatroomService;
import com.kh.runningdog.chatting.model.vo.Chatroom;
import com.kh.runningdog.member.model.service.FindUtil;
import com.kh.runningdog.member.model.service.MailUtil;
import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class AdminMemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChatroomService chatroomService;
	

	@Autowired
	private BCryptPasswordEncoder bcryptoPasswordEncoder;
	
	

/**************** admin controller start ******************/

	@RequestMapping("admin.ad")
	public String adminMemberPage() {
		return "admin/member/allMember";
	}
	
	@RequestMapping("allMember.ad")
	public String allMemberPage() {
		return "admin/member/allMember";
	}
	
	@RequestMapping("leaveMember.ad")
	public String adminLeaveMemberPage() {
		return "admin/member/leaveMember";
	}
	
	@RequestMapping("memberInsert.ad")
	public String adminMemberInsertPage() {
		return "admin/member/memberInsert";
	}
	
	@RequestMapping("memberView.ad")
	public String adminMemberViewPage() {
		return "admin/member/memberView";
	}
	
	@RequestMapping("adminInfo.ad")
	public String adminInfoPage() {
		return "admin/etc/adminInfo";
	}
	
	@RequestMapping("etcView.ad")
	public String etcViewPage() {
		return "admin/etc/etcView";
	}
	
	// 나의 채팅에서 유저검색
//	@RequestMapping("searchChatUser.do")
//	public String searchChatUser(Member member, Model model) {
//		ArrayList<Member> list = memberService.selectNicknameCheckList(member);
//		int userCount = memberService.selectNicknameCount(member);
//		
//		if (list != null) {
//			model.addAttribute("list", list);
//		}
//		model.addAttribute("usercount", userCount);
//		return "mypage/findUser";
//	}
	
/**************** admin controller end ******************/
	
}
