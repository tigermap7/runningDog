package com.kh.runningdog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("login.do")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("join.do")
	public String joinPage() {
		return "member/join";
	}
	
	@RequestMapping("accountFind.do")
	public String accountFindPage() {
		return "member/accountFind";
	}
	
	@RequestMapping("mypage.do")
	public String myInfoPage() {
		return "mypage/myInfo";
	}
	
	@RequestMapping("admin.do")
	public String adminMemberPage() {
		return "admin/member/allMember";
	}
	
	
	@RequestMapping(value="loginAction.do", method=RequestMethod.POST)
	public String loginActionMethod(Member member, Model model, HttpSession session, SessionStatus status) {
		
		Member loginMember = memberService.selectLogin(member);
		
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			session.setAttribute("loginMember", loginMember);
			status.setComplete();
			return "main/main";
		}else if(loginMember != null && loginMember.getLoginLimit().equals("Y")) {
			session.setAttribute("message", "로그인 실패 NN");
			status.setComplete();
			return "common/error";
		}else{
			session.setAttribute("message", "로그인 실패");
			status.setComplete();
			return "common/error";
		}
	}
	
	@RequestMapping("logout.do")
	public String logoutActionMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
			return "main/main";
		}else{
			session.setAttribute("message", "로그아웃 실패");
			return "common/error";
		}
	}
}
