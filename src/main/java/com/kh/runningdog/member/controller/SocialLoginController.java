package com.kh.runningdog.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.omg.CORBA.NameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

import sun.net.www.http.HttpClient;

@Controller
public class SocialLoginController {
	private static final Logger logger = LoggerFactory.getLogger(SocialLoginController.class);

	@Autowired
	private MemberService memberService;
	

	
	// 카카오 로그인 컨트롤러
	@RequestMapping("kakaoLogin.do")
	public String kakaoLogin(Member member, Model model, @RequestParam("id") String userId, @RequestParam("profileImage") String profileImage, HttpSession session, HttpServletResponse response, SessionStatus status) throws IOException {

		logger.info("kakaoLogin run...");

		member.setUserId(userId);
		Member loginMember = memberService.selectFacebookLogin(member);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String url = null;
		
        System.out.println("userId : " + userId);
        System.out.println("profileImage : " + profileImage);
        if(loginMember == null) {
            System.out.println("먼저 가야함");
        	url = "notKakaoId";
        	logger.info("url : " + url);
        }
		
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			System.out.println("이후 가야함");

			loginMember.setRenameProfile(profileImage);
			loginMember.setLoginType("kakao");
			
			if(memberService.updatemyinfo(loginMember) > 0) {
				session.setAttribute("loginMember", loginMember);
				status.setComplete(); // 요청성공, 200 전송
				url = "main/main";
			}
		}else if(loginMember != null && loginMember.getLoginLimit().equals("Y")) {
			logger.info("로그인 제한된 계정");
            out.println("<script>alert('로그인이 제한된 계정입니다.\\n관리자에게 문의주세요.'); history.go(-1);</script>");
            out.flush();
		}else{
            out.println("<script>alert('간편로그인을 하기 위해선 회원가입이 필요합니다.');</script>");
            out.flush();
			model.addAttribute("userId", userId);
			model.addAttribute("profileImage", profileImage);
	        return "member/socialJoin";
		}
		logger.info("url : " +url);
		return url;
	}
	
	
	
	
	
	
	
	// 페이스북 로그인 컨트롤러
	@RequestMapping("facebookLogin.do")
	public String facebookLoginMethod(Member member, Model model, @RequestParam("email") String userId, HttpSession session, HttpServletResponse response, SessionStatus status) throws IOException {

		logger.info("facebookLogin run...");
		member.setUserId(userId);
		Member loginMember = memberService.selectFacebookLogin(member);
		
		String url = null;
		
		if(loginMember != null && loginMember.getLoginLimit().equals("N")) {
			
			loginMember.setLoginType("facabook");
			if(memberService.updatemyinfo(loginMember) > 0) {
				logger.info("loginMember : " + loginMember);
				logger.info("로그인 성공");
				
				session.setAttribute("loginMember", loginMember);
				status.setComplete(); // 요청성공, 200 전송
				url = "main/main";
			}
		}else if(loginMember != null && loginMember.getLoginLimit().equals("Y")) {
			logger.info("로그인 제한된 계정");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 제한된 계정입니다.\\n관리자에게 문의주세요.'); history.go(-1);</script>");
            out.flush();
		}else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('간편로그인을 하기 위해선 회원가입이 필요합니다.');</script>");
            out.flush();
			model.addAttribute("userId", userId);
	        return "member/socialJoin";
		}
		return url;
	}
	
	
	
	
	//페이스북 회원가입 컨트롤러
	@RequestMapping(value="facebookJoinAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String facebookJoinMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {
		logger.info("joinAction run...");
		logger.info("member : " + member);

		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);
		
		String url = null;
		int nChk = 0, pChk = 0;
		nChk = (member.getNickname().equals(member.getNickname())) ? 1 : 0;
		pChk = (member.getPhone().equals(member.getPhone())) ? 1 : 0;

		if(nicknameChk != null && nChk != 0) {
			url = "notNickname";
		} else if(phoneChk != null && pChk != 0) {
			url = "notPhone";
		} else {
			
			if(profilImg != null && profilImg.getOriginalFilename() != "") {

				//해당 유저의 프로필 파일이름
				String originProfile = member.getOriginProfile();
				String renameProfile = member.getRenameProfile();
				
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
						profilImg.transferTo(new File(savePath + "\\" + newRenameProfile));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					if (renameProfile != null) {
						new File(savePath + "\\" + renameProfile).delete();
					}
					member.setOriginProfile(dateString+ "/" + newOriginProfile);
					member.setRenameProfile(dateString+ "/" + newRenameProfile);
					
				} else if (!(originProfile.isEmpty()) && deleteFlag != null && deleteFlag.equals("yes")) {
					
					member.setOriginProfile(null);
					member.setRenameProfile(null);
					new File(savePath + "\\" + renameProfile).delete();
					
				} else if (!originProfile.isEmpty() && (newOriginProfile == null || originProfile.equals(newOriginProfile) &&
						new File(savePath+ "\\" + renameProfile).length() == new File(savePath + "\\" + newRenameProfile).length())) {
					member.setOriginProfile(originProfile);
					member.setRenameProfile(renameProfile);
				}
				if(memberService.insertFacabookMember(member) > 0) {
					url = "joinOk";
				}
			} else {
				if(memberService.insertFacabookMember(member) > 0) {
					url = "joinOk";
				}
			}
		}
		return url;
	}
	
	
	
	//소셜로그인 나의프로필 변경 컨트롤러
	@RequestMapping(value="socialMyinfoAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String socialMyinfoMethod(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {
		logger.info("myinfoAction run...");
		logger.info("member : " + member);
		Member loginMember = memberService.selectLogin(member);
		logger.info("loginMember : " + loginMember);
		
		//닉네임, 핸드폰 번호, 비밀번호 유효성검사
		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);
		

		String url = null;
		int myNickname = 0, newNickname = 0, myPhone = 0, newPhone = 0;
		logger.info("확인1 : " + loginMember.getNickname());
		logger.info("확인2 : " + member.getNickname());

		myNickname = (loginMember.getNickname().equals(member.getNickname())) ? 1 : 0;
		myPhone = (member.getPhone().equals(loginMember.getPhone())) ? 1 : 0;
		
		if(nicknameChk != null && myNickname != 1 && nicknameChk.getNickname().equals(member.getNickname()) != false) {
			url = "notNickname";
		} else if(phoneChk != null && myPhone != 1 && phoneChk.getPhone().equals(loginMember.getPhone()) != false) {
			url = "notPhone";
		} else {
	
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
					profilImg.transferTo(new File(savePath + "\\" + newRenameProfile));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				if (renameProfile != null) {
					new File(savePath + "\\" + renameProfile).delete();
				}
				
				member.setOriginProfile(dateString+ "/" + newOriginProfile);
				member.setRenameProfile(dateString+ "/" + newRenameProfile);
	
			} else if (!(originProfile.isEmpty()) && deleteFlag != null && deleteFlag.equals("yes")) {
				
				member.setOriginProfile(null);
				member.setRenameProfile(null);
				new File(savePath + "\\" + renameProfile).delete();
				
			} else if (!originProfile.isEmpty() && (newOriginProfile == null || originProfile.equals(newOriginProfile) &&
					new File(savePath+ "\\" + renameProfile).length() == new File(savePath + "\\" + newRenameProfile).length())) {
	
				member.setOriginProfile(originProfile);
				member.setRenameProfile(renameProfile);
			}
	
			if(memberService.updatemyinfo(member) > 0) {
				model.addAttribute("member", member);
				url = "myinfoOk";
			}
				
		}
		System.out.println("url : " + url);
		return url;
	}
	
	//회원탈퇴 컨트롤러
	@RequestMapping(value="socialMemberLeave.do", method=RequestMethod.POST)
	@ResponseBody
	public String socialMemberLeaveMethod(Member member, HttpSession session) {
		String url = null;
		logger.info("socialMemberLeave run...");
		if (memberService.insertLeaveMember(member) > 0) {
			if (memberService.deleteMember(member) > 0) {
				url = "myinfoOk";
			} else {
				session.setAttribute("message", "회원탈퇴 실패");
				url = "common/error";
			}
		} else {
			session.setAttribute("message", "회원탈퇴 목록으로 insert 실패");
			url = "common/error";
		}
		return url;
	}
	
}
