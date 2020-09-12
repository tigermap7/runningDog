package com.kh.runningdog.notice.controller;

import java.io.File;
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
		
		//키워드 있을경우 앞뒤 공백제거
		if(!(keyword == null || keyword == "")) {	
			//keyword.replaceAll("\\p{Z}", ""); //사이 공백
			keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");  //앞뒤 공백 제거
		}
		
		int currentPage = 1; //기본 현재 페이지
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//list 개수 받기 용 객체 생성
		NoticePage noticeSearch = new NoticePage();
		noticeSearch.setSearch(search);
		noticeSearch.setKeyword(keyword);
		
		int listCount = noticeService.selectNoticeListCount(noticeSearch);	//목록 갯수
		int limit = 6; //한 페이지당 출력할 목록 갯수 지정
		
		NoticePage noticePage = new NoticePage(currentPage, listCount, limit); //현재 페이지와 총 갯수 보내서, startPage, endpage등.. 값 만들기

		//검색값 NoticePage 에 넣기 (mybatis mapper로 보낼때 파라메타값 하나만 보낼 수 있어서)
		noticePage.setSearch(search);
		noticePage.setKeyword(keyword);	

		ArrayList<Notice> list = noticeService.selectNoticeList(noticePage);
		
		mv.addObject("list", list);
		mv.addObject("noticePage", noticePage);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	
	//공지사항 상세 페이지 이동, 출력
	@RequestMapping(value="ndetail.do")
	public ModelAndView selectNoticeDetail(HttpServletRequest request, ModelAndView mv, NoticePage noticePage) {
		logger.info("ndetail.do run...");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		
		if(notice != null) {
			noticeService.updateNoticeReadCount(noticeNo);	//조회수 증가
			noticePage.setNoticeNo(noticeNo);	//이전, 다음글 번호 조회할 때 객체 하나로 보내야해서 추가
			
			Integer preNo = noticeService.selectNoticePre(noticePage); //이전글 번호 조회, int는 null값을 못 받아서 integer사용
			Integer nextNo = noticeService.selectNoticeNext(noticePage); //다음글 번호 조회
			if(preNo == null){ preNo = 0;}	//이전글이 없을 때 0으로 설정
			if(nextNo == null){ nextNo = 0;}	//다음글이 없울 때 0으로 설정 
			
			mv.addObject("preNo", preNo);
			mv.addObject("nextNo", nextNo);
			mv.addObject("notice", notice);
			mv.addObject("noticePage", noticePage);
			mv.setViewName("notice/noticeView");
		} else {
			mv.addObject("message", "공지사항 상세페이지 이동 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	
	//공지사항 첨부파일 다운로드
	@RequestMapping(value="nfdown.do")
	public ModelAndView noticeFileDownload(HttpServletRequest request) {
		logger.info("nfdown.do run...");
		String renameFilename = request.getParameter("rfile");
		String originalFilename = request.getParameter("ofile");
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/nupfiles");
		File downFile = new File(savePath + "\\" + renameFilename);
		
		ModelAndView mv = new ModelAndView("noticeFiledown", "downFile", downFile);
		mv.addObject("fileName", originalFilename);
		
		return mv;
	}
	
	
	//공지사항 등록 페이지 이동
	@RequestMapping(value="ninview.do")
	public ModelAndView moveNoticeInsert(HttpServletRequest request, ModelAndView mv) {
		logger.info("ninview.do run...");
		mv.setViewName("notice/noticeWrite");
		return mv;
	}
	
	
	//공지사항 수정 페이지 이동
	@RequestMapping(value="nupview.do")
	public ModelAndView moveNoticeUpdate(HttpServletRequest request, ModelAndView mv) {
		logger.info("nupview.do run...");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.setViewName("notice/noticeUpdate");
		} else {
			mv.addObject("message", "공지사항 수정페이지 이동 실패");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	

	//공지사항 삭제 (상세페이지에서 각자 삭제했을 경우)
	@RequestMapping(value="ndelete.do")
	public String deleteAdminNotice(HttpServletRequest request) {
		logger.info("ndelete.do run...");
		String returnView = null;
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		if(noticeService.deleteNotice(noticeNo) > 0) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/nupfiles"); //저장된 파일 위치
			for(int i = 1; i < 4; i++ ) {
				String renameFilename = request.getParameter("rfile" + i);	
				if(renameFilename != null) { //첨부파일 있을경우 삭제
					new File(savePath + "\\" + renameFilename).delete();
				}
			}
			returnView = "redirect:/nlist.do";
		} else {
			request.setAttribute("message", "공지사항 삭제 처리 실패");
			returnView = "common/error";
		}

		return returnView;
	}	
	
	
	//메인페이지에 필수, new 공지사항 출력하기
	//@RequestMapping(value="nstate.do")
	public ModelAndView selectNoticeState(ModelAndView mv) {
		logger.info("nstate.do run...");
		ArrayList<Notice> list = noticeService.selectNoticeStateList();
		
		return mv;
	}
	
	
}
