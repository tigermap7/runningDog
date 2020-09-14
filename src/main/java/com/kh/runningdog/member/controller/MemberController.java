package com.kh.runningdog.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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


/**************** user controller start ******************/
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
	
	@RequestMapping("idFindComplete.do")
	public String idFindCompletePage() {
		return "member/idFindComplete";
	}
	
	@RequestMapping("mypage.do")
	public String myInfoPage() {
		return "mypage/myInfo";
	}
	
	//세션 만료로 인한 자동로그아웃
//	public void logoutActionMethod(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		
//		session = request.getSession(false);
//		String url = null;
//		
//		//세션 이용해서 로그아웃 처리
//		if(session != null) {
//			session.invalidate();
//            response.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("<script>alert('세션 만료로 인해 자동 로그아웃 되었습니다.\\n다시 로그인해주세요.'); history.go(-1);</script>");
//            out.flush();
//            url = "main/main";
//		}
//	}
	
	
	//로그인컨트롤러
	@RequestMapping(value="loginAction.do", method=RequestMethod.POST)
	public String loginActionMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, SessionStatus status) throws IOException {
		logger.info("loginAction run...");
		
		Member loginMember = memberService.selectLogin(member);
		String url = null;
		
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			if (bcryptoPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd())) {
				session.setAttribute("loginMember", loginMember);
				status.setComplete(); // 요청성공, 200 전송
				url = "main/main";
			} else {
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('비밀번호가 일치하지 않습니다.\\n다시 입력해주세요.'); history.go(-1);</script>");
	            out.flush();
			}
		}else if(loginMember != null && bcryptoPasswordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd()) && loginMember.getLoginLimit().equals("Y")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 제한된 계정입니다.\\n관리자에게 문의주세요.'); history.go(-1);</script>");
            out.flush();
		}else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('가입되지 않은 계정입니다.\\n다시 입력해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		return url;
	}

	//로그아웃컨트롤러	
	@RequestMapping("logout.do")
	public String logoutActionMethod(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("logout run...");
		
		session = request.getSession(false);
		
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
	public String joinActionMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {
		logger.info("joinAction run...");
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
			
			if(profilImg.getOriginalFilename() != "") {
				logger.info("확인4 : ");
				//해당 유저의 프로필 파일이름
				String originProfile = member.getOriginProfile();
				String renameProfile = member.getRenameProfile();
				
				logger.info("originProfile : " + originProfile);
				logger.info("renameProfile : " + renameProfile);
				
				String deleteFlag = request.getParameter("deleteFlag"); //삭제버튼

				//오늘 날짜의 디렉토리 만들기
				Calendar cal = Calendar.getInstance();
				String dateString;
				dateString = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));

				//이미지 저장 경로 / 오늘날짜 폴더
				String savePath = request.getSession().getServletContext().getRealPath("resources/images/memberImg/"+ dateString);
				File folder = new File(savePath);
				//오늘 날짜의 디렉토리가 없으면 생성
				if (!folder.exists()) { // 디렉토리 없으면 생성.
					folder.mkdirs();
				}

				//오늘 날짜 파일명 변경
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String newOriginProfile = profilImg != null ? profilImg.getOriginalFilename() : null;
				
				String newRenameProfile = null;
				
				if (newOriginProfile != null) {
					newRenameProfile = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					newRenameProfile += "." + newOriginProfile.substring(newOriginProfile.lastIndexOf(".") + 1);
					try {
						logger.info("확인1");
						profilImg.transferTo(new File(savePath + "\\" + newRenameProfile));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					if (renameProfile != null) {
						logger.info("확인2");
						new File(savePath + "\\" + renameProfile).delete();
					}
					member.setOriginProfile(newOriginProfile);
					member.setRenameProfile(newRenameProfile);
					logger.info("확인3");
					
				} else if (!(originProfile.isEmpty()) && deleteFlag != null && deleteFlag.equals("yes")) {
					logger.info("확인4");
					member.setOriginProfile(null);
					member.setRenameProfile(null);
					new File(savePath + "\\" + renameProfile).delete();
				} else if (!originProfile.isEmpty() && (newOriginProfile == null || originProfile.equals(newOriginProfile) &&
						new File(savePath+ "\\" + renameProfile).length() == new File(savePath + "\\" + newRenameProfile).length())) {
					logger.info("확인5");
					member.setOriginProfile(originProfile);
					member.setRenameProfile(renameProfile);
				}
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
	public String idFindActionMethod(Member member, HttpServletResponse response, HttpSession session, SessionStatus status) throws IOException {
		logger.info("idFindAction run...");
		
		Member phoneChk = memberService.selectPhoneCheck(member);
		String url = null;
				
		if(phoneChk != null) {
			String selectId = phoneChk.getUserId();
			
			if(phoneChk.getUserId() != null) {
				session.setAttribute("selectId", selectId);
				status.setComplete();
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
		logger.info("pwdFindAction run...");
		
		Member userIdPhoneChk = memberService.selectUserIdPhoneCheck(member);
		String url = null;

		if(userIdPhoneChk != null) {
			//String selectId2 = userIdPhoneChk.getUserId();			
			
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
	
	
	
	//나의프로필 컨트롤러
		@RequestMapping(value="myinfoAction.do", method=RequestMethod.POST)
		@ResponseBody
		public String myinfoActionMethod(Member member, Model model, ModelAndView mv, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {
		logger.info("myinfoAction run...");
		Member loginMember = memberService.selectLogin(member);
		
		//닉네임, 핸드폰 번호, 비밀번호 유효성검사
		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);
		Member userPwdChk = memberService.selectUserPwdCheck(member);
		
		
		String url = null;
		int pChk = 0, nChk = 0, pwdChk = 0;
		boolean myNickname2 = false, myPhone2 = false;
		myNickname2 = loginMember.getNickname().equals(member.getNickname());
		myPhone2 = loginMember.getPhone().equals(member.getPhone());
		
		if(nicknameChk != null && nicknameChk.getNickname().equals(member.getNickname()) == true && myNickname2 == false) {
			url = "notNickname";
		} else if(phoneChk != null && phoneChk.getPhone().equals(member.getPhone()) == true && myPhone2 == false) {
			url = "notPhone";
		} else if (nChk == 0 && pChk == 0 && bcryptoPasswordEncoder.matches(member.getUserPwd(), userPwdChk.getUserPwd())) {

			//해당 유저의 프로필 파일이름
			String originProfile = loginMember.getOriginProfile();
			String renameProfile = loginMember.getRenameProfile();
			
			String deleteFlag = request.getParameter("deleteFlag"); //삭제버튼

			//오늘 날짜의 디렉토리 만들기
			Calendar cal = Calendar.getInstance();
			String dateString;
			dateString = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));

			//이미지 저장 경로 / 오늘날짜 폴더
			String savePath = request.getSession().getServletContext().getRealPath("resources/images/memberImg/" + dateString);
			File folder = new File(savePath);
			//오늘 날짜의 디렉토리가 없으면 생성
			if (!folder.exists()) { // 디렉토리 없으면 생성.
				folder.mkdirs();
			}

			//오늘 날짜 파일명 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String newOriginProfile = profilImg != null ? profilImg.getOriginalFilename() : null;
			
			String newRenameProfile = null;
			
			if (newOriginProfile != null) {
				newRenameProfile = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				newRenameProfile += "." + newOriginProfile.substring(newOriginProfile.lastIndexOf(".") + 1);
				try {
					logger.info("확인1");
					profilImg.transferTo(new File(savePath + "\\" + newRenameProfile));

					logger.info("확인2");
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				logger.info("확인3");
				if (renameProfile != null) {

					logger.info("확인4");
					new File(savePath + "\\" + renameProfile).delete();
				}
				logger.info("확인5");
				member.setOriginProfile(dateString+ "/" + newOriginProfile);
				member.setRenameProfile(dateString+ "/" + newRenameProfile);

				logger.info("확인6");
			} else if (!(originProfile.isEmpty()) && deleteFlag != null && deleteFlag.equals("yes")) {

				logger.info("확인7");
				member.setOriginProfile(null);
				member.setRenameProfile(null);
				new File(savePath + "\\" + renameProfile).delete();
				logger.info("확인8");
			} else if (!originProfile.isEmpty() && (newOriginProfile == null || originProfile.equals(newOriginProfile) &&
					new File(savePath+ "\\" + renameProfile).length() == new File(savePath + "\\" + newRenameProfile).length())) {

				logger.info("member.getOriginProfile() : " + member.getOriginProfile());
				logger.info("확인9");
				member.setOriginProfile(originProfile);
				member.setRenameProfile(renameProfile);
			}

			logger.info("확인10");
			if(memberService.updatemyinfo(member) > 0) {

//				logger.info("확인11");
//				JSONObject sendJson = new JSONObject();
//				
//				JSONArray jarr = new JSONArray();
//
//				JSONObject job = new JSONObject();
//				job.put("originProfile", URLEncoder.encode(member.getOriginProfile(), "utf-8"));
//				job.put("nickname", URLEncoder.encode(member.getNickname(), "utf-8"));
//				job.put("phone", URLEncoder.encode(member.getPhone(), "utf-8"));
//				
//				jarr.add(job);
//				
//				sendJson.put("loginMember", jarr);
//
//				return sendJson.toString();
				
				return "redirect:myinfoOk";
			}
				
		} else if(bcryptoPasswordEncoder.matches(member.getUserPwd(), userPwdChk.getUserPwd()) == false) {
			url = "notUserPwd";
		} else {
			model.addAttribute("message", "나의 프로필 변경 실패.");
			url = "common/error";
		}
		return url;
	}
		
		
	
	//나의 프로필 비밀번호 변경 컨트롤러
	@RequestMapping(value="pwdChangeAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String pwdChangeActionMethod(Member member, Model model, HttpServletResponse response, HttpSession session) throws IOException {

		Member userPwdChk = memberService.selectUserPwdCheck(member);
		String url = null;
		
		if(bcryptoPasswordEncoder.matches(member.getUserPwd(), userPwdChk.getUserPwd())) {

			member.setUserPwd(bcryptoPasswordEncoder.encode(member.getNewUserPwd()));

			if(memberService.updateMemberPwd(member) > 0) {
				url = "myinfoOk";
			}
		} else {
			url = "notUserPwd";
		}
		return url;
	}

	
	
	//회원탈퇴 컨트롤러
	@RequestMapping(value="leaveMember.do", method=RequestMethod.POST)
	public String leaveMemberActionMethod(Member member,@RequestParam("userId") String userId, HttpSession session) throws IOException {
		String url = null;
		logger.info("leaveMember run...");
		Member userPwdChk = memberService.selectUserPwdCheck(member);
		logger.info("userPwdChk : " + userPwdChk);
		logger.info("userPwdChk2 : " + bcryptoPasswordEncoder.matches(member.getUserPwd(), userPwdChk.getUserPwd()));
		if (bcryptoPasswordEncoder.matches(member.getUserPwd(), userPwdChk.getUserPwd())) {
			if (memberService.insertLeaveMember(member) > 0) {

				logger.info("확인1");
				if (memberService.deleteMember(userId.trim()) > 0) {
					return "redirect:/logout.do";
				} else {
					session.setAttribute("message", "회원탈퇴 실패");
					return "common/error";
				}
			} else {
				session.setAttribute("message", "회원탈퇴 목록으로 insert 실패");
				return "common/error";
			}
		} else {
			logger.info("확인2");
			url = "notUserPwd";
		}
		return url;
		
	}
	
	
	
	
	

/**************** user controller end ******************/
	
	

	
	
	

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
	
	
	
/**************** admin controller end ******************/
	
}
