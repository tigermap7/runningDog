package com.kh.runningdog.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.notice.model.service.NoticeService;
import com.kh.runningdog.notice.model.vo.Notice;
import com.kh.runningdog.notice.model.vo.NoticePage;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;

	//공지사항 리스트 페이지 이동, 출력
	@RequestMapping(value="nlist.do")
	public ModelAndView selectNoticeList(HttpServletRequest request, ModelAndView mv) {
		logger.info("nlist.do run...");
		
		//검색값 받기
		String search = request.getParameter("searchNotice");
		String keyword = request.getParameter("keyword");
		
		if(!(keyword == null || keyword == "")) {	//키워드가 있을 경우
			//keyword.replaceAll("\\p{Z}", ""); //사이 공백
			keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");  //앞뒤 공백 제거
		}
		int currentPage = 1; //기본 현제 페이지
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//list 개수 받기 용 객체 생성
		NoticePage noticeSearch = new NoticePage();
		noticeSearch.setSearch(search);
		noticeSearch.setKeyword(keyword);
		
		int listCount = noticeService.selectNoticeListCount(noticeSearch);
		
		NoticePage noticePage = new NoticePage(currentPage, listCount);
		
		//검색값 NoticePage 에 넣기 mybatis mapper로 보낼때 파라메타값 하나만 보낼 수 있어서
		noticePage.setSearch(search);
		noticePage.setKeyword(keyword);
		
		System.out.println(noticePage);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(noticePage);
		
		mv.addObject("list", list);
		mv.addObject("noticePage", noticePage);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	//공지사항 상세 페이지 이동, 출력
	@RequestMapping(value="ndetail.do")
	public ModelAndView selectNoticeDetail(HttpServletRequest request, ModelAndView mv, NoticePage noticePage) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		System.out.println(noticeNo + ", " +  noticePage);
		
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		
		if(notice != null) {
			noticeService.updateNoticeReadCount(noticeNo);	//조회수 증가
			mv.addObject("notice", notice);
			mv.setViewName("notice/noticeView");
			mv.addObject("noticePage", noticePage);
		} else {
			System.out.println("공지사항 상세페이지 이동 실패");
		}
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
	
	//공지사항 등록 페이지 이동
	@RequestMapping(value="movenoticeinsert.do")
	public ModelAndView moveNoticeInsert(Notice notice, HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("notice/noticeWrite");
		return mv;
	}
	
	//공지사항 수정 페이지 이동
	@RequestMapping(value="movenoticeupdate.do")
	public ModelAndView moveNoticeUpdate(Notice notice, HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("notice/noticeUpdate");
		return mv;
	}
	
	
}
