package com.kh.runningdog.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.member.model.service.FindUtil;
import com.kh.runningdog.member.model.service.MailUtil;
import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptoPasswordEncoder;
	
	@Autowired
	private MailUtil mailUtil;

	@Autowired
	private FindUtil findUtil;



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
	
	@RequestMapping("idFindComplete.do")
	public String idFindCompletePage() {
		return "member/idFindComplete";
	}
	
	@RequestMapping("admin.do")
	public String adminMemberPage() {
		return "admin/member/allMember";
	}
	
	
	//로그인컨트롤러
	@RequestMapping(value="loginAction.do", method=RequestMethod.POST)
	public String loginActionMethod(Member member, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, SessionStatus status) throws IOException {

		Member loginMember = memberService.selectLogin(member);
		String url = null;
		
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			if (bcryptoPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd())) {
				//session 이용해서 보여지는 영역이 다르도록 처리
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

	//로그아웃컨트롤러	
	@RequestMapping("logout.do")
	public String logoutActionMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		
		//세션 이용해서 로그아웃 처리
		if(session != null) {
			session.invalidate();
			return "main/main";
		}else{
			session.setAttribute("message", "로그아웃 실패");
			return "common/error";
		}
	}
	
	
	//회원가입컨트롤러
	@RequestMapping(value="joinAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String joinActionMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImage) throws IOException {
		logger.info("member : " + member);
		
		//암호화 처리
		member.setUserPwd(bcryptoPasswordEncoder.encode(member.getUserPwd()));
		
		//아이디(이메일), 닉네임, 핸드폰 번호 유효성검사
		Member userIdChk = memberService.selectUserIdCheck(member);
		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);
		
		String url = null;
		int pChk = 0, iChk = 0, nChk = 0;

		if(userIdChk != null) {
			iChk = (member.getUserId().equals(member.getUserId())) ? 1 : 0;
			if(iChk > 0) {
				url = "notUserId";
			}
		} else if(nicknameChk != null) {
			nChk = (member.getNickname().equals(member.getNickname())) ? 1 : 0;
			if(nChk > 0) {
				url = "notNickname";
			}
		} else if(phoneChk != null) {
			pChk = (member.getPhone().equals(member.getPhone())) ? 1 : 0;
			if(pChk > 0) {
				url = "notPhone";
			}
		} else if(iChk == 0 && nChk == 0 && pChk == 0) {
			
			if(profilImage.getOriginalFilename() != "") {
				// 파일 저장 경로 지정
				String savePath = request.getSession().getServletContext().getRealPath("resources/images/memberImg");
		
				try {
					profilImage.transferTo(new File(savePath + "\\" + profilImage.getOriginalFilename()));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				member.setProfileImg(profilImage.getOriginalFilename()); //이미지 이름 저장
				
				if(memberService.insertMember(member) > 0) {
					url = "joinOk";
				}
			} else {
				if(memberService.insertMember(member) > 0) {
					url = "joinOk";
				}
			}
		} else {
			model.addAttribute("message", "회원가입 실패.");
			return "common/error";
		}
		return url;
	}
	
	
	//아이디(이메일) 찾기 컨트롤러
	@RequestMapping(value="idFindAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String idFindActionMethod(Member member, HttpServletResponse response, HttpSession session) throws IOException {

		Member phoneChk = memberService.selectPhoneCheck(member);
		String url = null;
				
		if(phoneChk != null) {
			String selectId = phoneChk.getUserId();
			
			if(phoneChk.getUserId() != null) {
				session.setAttribute("selectId", selectId);
				url = "selectId";
			}
		} else {
			url = "notSelectId";
		}
		return url;
	}
	
	
	//비밀번호 찾기 컨트롤러
	@RequestMapping(value="pwdFindAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String pwdFindActionMethod(Member member, Model model, HttpServletResponse response, HttpSession session) throws IOException {

		Member userIdPhoneChk = memberService.selectUserIdPhoneCheck(member);
		String url = null;

		if(userIdPhoneChk != null) {
			String selectId2 = userIdPhoneChk.getUserId();			
			
			String keyCode = FindUtil.createKey();
			session.setAttribute("keyCode", keyCode);
			
			String subject = "'지금 달려갈 개' 임시 비밀번호 전송";
			
			String msg = "";
			msg += "<div style='float: left; text-align:center; font-weight:700; border: 2px solid #ff92a8; color:#ff92a8; font-size:14px; padding:80px 50px; margin:50px 0; font-family: 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', '돋움', sans-serif !important;'>";
			msg += "<h1 style='margin: 0 0 10px;'><img src='http://127.0.0.1:9392/runningdog/resources/images/common/logo_over.png'></h1>";
			msg += "<h3 style=' margin-bottom:5px;'>안녕하세요. " + userIdPhoneChk.getNickname() + " 님.</h3>";
			msg += "<p>";
			msg += "지금 달려갈게 로그인 임시 비밀번호는 <b style='color:#333'>" + keyCode + "</b> 입니다.<br/>";
			msg += "로그인 후 꼭 마이페이지 프로필변경에서 비밀번호를 변경하시기 바랍니다.</p></div>";
			
			MailUtil.sendMail(member.getUserId(), subject, msg);

			//member.setUserPwd(keyCode);
			member.setUserPwd(bcryptoPasswordEncoder.encode(keyCode));

			if(memberService.updateMemberPwd(member) > 0) {
				url = "selectIdPhoneChk";
			}
		} else {
			url = "notSelectIdPhoneChk";
		}
		return url;
	}
	

	
	
//	@RequestMapping(value="joinAction.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String joinActionMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImage) throws IOException {
//		logger.info("member : " + member);
//		
//		//암호화 처리
//		member.setUserPwd(bcryptoPasswordEncoder.encode(member.getUserPwd()));
//					
//		String url = null;
//		int pChk = 0, iChk = 0, nChk = 0;
//		//아이디(이메일), 닉네임, 핸드폰 번호 유효성검사
//		Member userIdChk = memberService.selectUserIdCheck(member);
//		Member nicknameChk = memberService.selectNicknameCheck(member);
//		Member phoneChk = memberService.selectPhoneCheck(member);
//		
//		if(profilImage.getOriginalFilename() != "") {
//			// 파일 저장 경로 지정
//			String savePath = request.getSession().getServletContext().getRealPath("resources/images/memberImg");
//	
//			try {
//				profilImage.transferTo(new File(savePath + "\\" + profilImage.getOriginalFilename()));
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//				return "common/error";
//			}
//		}
//		
//		//이미지 이름 저장
//		member.setProfilImg(profilImage.getOriginalFilename());
//
//		
//		if(userIdChk != null) {
//			iChk = (member.getUserId().equals(member.getUserId())) ? 1 : 0;
//			if(iChk > 0) {
//				url = "notUserId";
//			}
//		} else if(nicknameChk != null) {
//			nChk = (member.getNickname().equals(member.getNickname())) ? 1 : 0;
//			if(nChk > 0) {
//				url = "notNickname";
//			}
//		} else if(phoneChk != null) {
//			pChk = (member.getPhone().equals(member.getPhone())) ? 1 : 0;
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
	
	
	
	
	
	
}
