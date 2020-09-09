package com.kh.runningdog.admin.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.notice.model.service.NoticeService;
import com.kh.runningdog.notice.model.vo.Notice;

@Controller
public class AdminNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	//관리자용 공지사항 등록 페이지 이동
	@RequestMapping(value="movenoticeinsert.ad")
	public ModelAndView moveAdminNoticeInsert(Notice notice, HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("admin/userBoard/noticeWrite");
		return mv;
	}
	
	//관리자용 공지사항 수정 페이지 이동
	//@RequestMapping(value="movenoticeupdate.ad")
	public ModelAndView moveAdminNoticeUpdate(Notice notice, HttpServletRequest request, ModelAndView mv) {
		return mv;
	}
		
	//관리자용 공지사항 목록 페이지 이동, 출력
	@RequestMapping(value="nlist.ad")
	public ModelAndView selectAdminNoticeList(ModelAndView mv) {
		mv.setViewName("admin/userBoard/noticeList");
		return mv;
	}
	
	//관리자용 공지사항 상세 페이지 이동, 출력
	@RequestMapping(value="ndetail.ad")
	public ModelAndView selectAdminNoticeDatail(ModelAndView mv) {
		mv.setViewName("admin/userBoard/noticeView");
		return mv;
	}
	
	//관리자용 공지사항 등록
	@RequestMapping(value="ninsert.ad")
	public String insertAdminNotice(Notice notice, HttpServletRequest request) {
		String returnView = null;
		
		returnView = "admin/userBoard/noticeList";
		
		return returnView;
	}
	
	
	//관리자용 공지사항 수정
	@RequestMapping(value="nupdate.ad")
	public String updateAdminNotice(Notice notice, HttpServletRequest request) {
		String returnView = null;
		
		returnView = "admin/userBoard/noticeList";
		
		return returnView;
	}	
	
	
	//관리자용 공지사항 삭제
	@RequestMapping(value="ndelete.ad")
	public String deleteAdminNotice(HttpServletRequest request) {
		String returnView = null;
		
		returnView = "admin/userBoard/noticeList";
		
		return returnView;
	}	
	
	
}
