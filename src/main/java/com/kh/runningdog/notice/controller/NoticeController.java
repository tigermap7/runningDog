package com.kh.runningdog.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;

	//공지사항 리스트 페이지 이동, 출력
	@RequestMapping(value="nlist.do")
	public ModelAndView selectNoticeList(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	//공지사항 상세 페이지 이동, 출력
	@RequestMapping(value="ndetail.do")
	public ModelAndView selectNoticeDetail(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("notice/noticeView");
		return mv;
	}
	
	//공지사항 이전/다음 페이지 검색후 이동
	//@RequestMapping(value="nprenext.do")
	public ModelAndView selectNoticePreNext(HttpServletRequest request, ModelAndView mv) {
		return mv;
	}
	
	//공지사항 첨부파일 다운로드
	//@RequestMapping(value="nfdown.do")
	public ModelAndView noticeFileDownload(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	//메인페이지에 필수, new 공지사항 출력하기
	//@RequestMapping(value="nstate.do")
	public ModelAndView selectNoticeState(ModelAndView mv) {
		return mv;
	}
	
	
}
