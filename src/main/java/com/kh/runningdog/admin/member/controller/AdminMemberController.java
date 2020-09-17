package com.kh.runningdog.admin.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;
import com.kh.runningdog.member.model.vo.MemberPage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runningdog.member.model.service.MemberService;
import com.kh.runningdog.member.model.vo.Member;

@Controller
public class AdminMemberController {
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptoPasswordEncoder;
	
	

/**************** admin controller start ******************/

//	@RequestMapping("admin.ad")
//	public String adminMemberPage() {
//		return "admin/member/allMember";
//	}
	
	@RequestMapping("allMember.ad")
	public String allMemberPage(Model model, HttpServletRequest request, SessionStatus status) {
		logger.info("allMember run...");
		
		//검색값 받기
		String search = request.getParameter("memberSearch");
		String keyword = request.getParameter("keyword");

		logger.info("search : " + search);
		logger.info("keyword : " + keyword);
		
		//키워드 있을경우 앞뒤 공백제거
		if(!(keyword == null || keyword == "")) {	
			keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");  //앞뒤 공백 제거
		}
		
		int currentPage = 1; //기본 현재 페이지
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		// list 개수 받는 객체
		MemberPage memberSerch = new MemberPage();
		memberSerch.setSearch(search);
		memberSerch.setKeyword(keyword);

		logger.info("memberSerch : " + memberSerch);
		
		int listCount = memberService.selectMemberCount(memberSerch); //총 목록 갯수
		int listLimit = 10;//페이지 게시글 출력 갯수
		logger.info("listCount : " + listCount);
		
		MemberPage memberPage = new MemberPage(currentPage, listCount, listLimit); //현재 페이지와 총 갯수 보내서, startPage, endpage등.. 값 만들기
		
		//검색값 memberPage 에 넣기 (mybatis mapper로 보낼때 파라메타값 하나만 보낼 수 있다)
		memberPage.setSearch(search);
		memberPage.setKeyword(keyword);
		
//		if(list.size() > -1) {
		ArrayList<Member> list = memberService.selectMemberList(memberPage);

		logger.info("list : " + list);
		logger.info("memberPage : " + memberPage);
		logger.info("memberSerch : " + memberSerch);
		
		model.addAttribute("list", list);
		model.addAttribute("memberPage", memberPage);
		return "admin/member/allMember";
		
	}
	
	

	@RequestMapping("memberInsert.ad")
	public String adminMemberInsertPage() {
		return "admin/member/memberInsert";
	}
	//회원추가
	@RequestMapping(value="memberInsertAction.ad", method=RequestMethod.POST)
	@ResponseBody
	public String adminMemberInsertAction(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {
		logger.info("memberInsert run...");
		logger.info("member : " + member);
		logger.info("member adminCke : " + member.getAdminChk() );
		
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
				
				if(memberService.adminInsertMember(member) > 0) {
					url = "memberInsertOk";
				}
				
			} else {
				
				if(memberService.adminInsertMember(member) > 0) {
					url = "memberInsertOk";
				}
				
			}
			
		} else {
			model.addAttribute("message", "회원추가 실패.");
			return "common/error";
		}
		return url;
	}
	
	
	//관리자 회원상세
	@RequestMapping("memberView.ad")
	public String adminMemberViewPage(Model model, HttpServletResponse response, @RequestParam("uniqueNum") int uniqueNum) throws IOException {
		
		Member selectUser = memberService.selectUserOne(uniqueNum);
		
		String url = "";
		
		if (selectUser != null) {
			model.addAttribute("selectUser", selectUser);
			url = "admin/member/memberView";
		} else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 회원이 존재하지 않습니다.'); history.go(-1);</script>");
            out.flush();
		}
		return "admin/member/memberView";
	}
	//관리자 회원수정
	@RequestMapping(value="memberModified.do", method=RequestMethod.POST)
	public String adminMemberModifiedAction(Member member, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("uniqueNum", required = false) int uniqueNum, @RequestParam(name = "profilImage", required = false) MultipartFile profilImg) throws IOException {

		Member selectUser = memberService.selectUserOne(uniqueNum);
		
		Member nicknameChk = memberService.selectNicknameCheck(member);
		Member phoneChk = memberService.selectPhoneCheck(member);
		
		String url = "";

		int nChk = 0;
		boolean myNickname2 = false;
		
		myNickname2 = selectUser.getNickname().equals(member.getNickname());
		
		logger.info("확인1");
		
		if (selectUser != null) {
			if(nicknameChk != null && nicknameChk.getNickname().equals(member.getNickname()) == true && myNickname2 == false) {

				logger.info("확인1");
				url = "notNickname";
			} else if (nChk == 0) {

				logger.info("확인2");
				//해당 유저의 프로필 파일이름
				String originProfile = selectUser.getOriginProfile();
				String renameProfile = selectUser.getRenameProfile();
				
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

				logger.info("확인3");
				if(memberService.adminUpdateMember(uniqueNum) > 0) {
					logger.info("확인4");
					model.addAttribute(uniqueNum);
					url = "admin/member/memberView";
				} else {
					logger.info("확인5");
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('해당 회원이 존재하지 않습니다.'); history.go(-1);</script>");
		            out.flush();
				}
				logger.info("확인6");
					
			}
		} else {
			logger.info("확인7 : " + selectUser);
			model.addAttribute("selectUser", selectUser);
			url = "common/error";
		}
		return url;
	}
	
	
	

	

	
	@RequestMapping("leaveMember.ad")
	public String adminLeaveMemberPage() {
		return "admin/member/leaveMember";
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
