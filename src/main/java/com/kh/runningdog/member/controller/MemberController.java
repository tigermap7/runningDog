package com.kh.runningdog.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptoPasswordEncoder;

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
	public String loginActionMethod(Member member, Model model, HttpSession session, HttpServletRequest request
            , HttpServletResponse response, SessionStatus status) throws IOException {

		Member loginMember = memberService.selectLogin(member);
		String url = null;
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			if (bcryptoPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd())) {
				session.setAttribute("loginMember", loginMember);
				status.setComplete();
				url = "main/main";
			} else {
				model.addAttribute("message", "암호가 일치하지 않습니다.");
				url = "common/error";
			}
		}else if(loginMember != null && bcryptoPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd()) && loginMember.getLoginLimit().equals("Y")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 제한된 계정입니다.\\n관리자에게 문의주세요.'); history.go(-1);</script>");
            out.flush();
		}else{
			model.addAttribute("message", "아이디가 일치하지 않습니다.");
			return "common/error";
		}
		return url;
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
	
	@RequestMapping(value="joinAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String joinActionMethod(Member member, Model model, @RequestParam("userId") String userId, @RequestParam("nickname") String nickname, @RequestParam("phone") String phone,@RequestParam(name = "profleImg", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("member : " + member);
		
		//암호화 처리
		member.setUserPwd(bcryptoPasswordEncoder.encode(member.getUserPwd()));
		
		// 파일 저장 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/memberImg");
		
		//아이디(이메일), 닉네임, 핸드폰 번호 유효성검사
		Member userIdChk = memberService.selectUserIdCheck(member);
		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);

		logger.info("savePath : " + savePath);

		logger.info("확인 : ");
		
		// 업로드된 파일을 지정한 폴더로 옮기기
		file.transferTo(new File(savePath + "\\" + file.getOriginalFilename()));
		
		
		String url = null;
		int pChk = 0, iChk = 0, nChk = 0;

		if(userIdChk != null) {
			iChk = (userIdChk.getUserId().equals(userId)) ? 1 : 0;
			if(iChk > 0) {
				url = "notUserId";
			}
		} else if(nicknameChk != null) {
			nChk = (nicknameChk.getNickname().equals(nickname)) ? 1 : 0;
			if(nChk > 0) {
				url = "notNickname";
			}
		} else if(phoneChk != null) {
			pChk = (phoneChk.getPhone().equals(phone)) ? 1 : 0;
			if(pChk > 0) {
				url = "notPhone";
			}
		} else if(iChk == 0 && nChk == 0 && pChk == 0 && memberService.insertMember(member) > 0) {
			url = "joinOk";
		} else {
			model.addAttribute("message", "새 회원 등록 실패");
			return "common/error";
		}
		return url;
	}
	
//	@RequestMapping(value="joinAction.do", method=RequestMethod.POST)
//	public String joinActionMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
//
//		logger.info("member : " + member);
//
//		member.setUserPwd(bcryptoPasswordEncoder.encode(member.getUserPwd()));
//		
//		int result = memberService.insertMember(member);
//		
//		logger.info("result : " + result);
//		if (result > 0) {
//				return "main/main";
//		} else {
//			model.addAttribute("message", "암호화 회원가입 실패!");
//			return "common/error";
//		}
//	}

	
//	@RequestMapping(value="joinAction.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String joinActionMethod(Member member, Model model, @RequestParam("userId") String userId, @RequestParam("nickname") String nickname, @RequestParam("phone") String phone, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		logger.info("member : " + member);
//		
//		Member userIdChk = memberService.selectUserIdCheck(member);
//		Member nicknameChk = memberService.selectNicknameCheck(member);
//		Member phoneChk = memberService.selectPhoneCheck(member);
//
//		String url = null;
//		int pChk = 0, iChk = 0, nChk = 0;
//
//		member.setUserPwd(bcryptoPasswordEncoder.encode(member.getUserPwd()));
//		
//		logger.info("pChk1 : " + pChk);
//		if(userIdChk != null) {
//			iChk = (userIdChk.getUserId().equals(userId)) ? 1 : 0;
//			if(iChk > 0) {
//				url = "notUserId";
//			}
//		} else if(nicknameChk != null) {
//			nChk = (nicknameChk.getNickname().equals(nickname)) ? 1 : 0;
//			if(nChk > 0) {
//				url = "notNickname";
//			}
//		} else if(phoneChk != null) {
//			pChk = (phoneChk.getPhone().equals(phone)) ? 1 : 0;
//			if(pChk > 0) {
//				url = "notPhone";
//			}
//		} else if(iChk == 0 && nChk == 0 && pChk == 0 && memberService.insertMember(member) > 0) {
//			url = "joinOk";
//		} else {
//			model.addAttribute("message", "새 회원 등록 실패");
//			return "common/error";
//		}
//		return url;
//	}
	
	// 나의 채팅에서 유저검색
	@RequestMapping("searchChatUser.do")
	public String searchChatUser(Member member, Model model) {
		ArrayList<Member> list = memberService.selectNicknameCheckList(member);
		int userCount = memberService.selectNicknameCount(member);
		
		if (list != null) {
			model.addAttribute("list", list);
		}
		model.addAttribute("usercount", userCount);
		return "mypage/findUser";
	}
	
	
}
