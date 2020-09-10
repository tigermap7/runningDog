package com.kh.runningdog.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		int currentPage = 1; //기본 현재 페이지
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//list 개수 받기 용 객체 생성
		NoticePage noticeSearch = new NoticePage();
		noticeSearch.setSearch(search);
		noticeSearch.setKeyword(keyword);
		
		int listCount = noticeService.selectNoticeListCount(noticeSearch);	//목록 갯수
		
		NoticePage noticePage = new NoticePage(currentPage, listCount); //현재 페이지와 총 갯수 보내서, startPage, endpage등.. 값 만들기
		
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
			if(preNo == null) preNo = 0;	//이전글이 없을 때 0으로 설정
			if(nextNo == null) nextNo = 0;	//다음글이 없울 때 0으로 설정 
			
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
	
	//공지사항 등록
	@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
	public String insertAdminNotice(Notice notice, HttpServletRequest request, @RequestParam Map<String, MultipartFile> fileMap) {
		logger.info("ninsert.do run...");
		String returnView = null;
		int i = 1;
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/nupfiles"); //파일 저장할 폴더 위치
		
		Map<String, MultipartFile> fileMap2 = new HashMap<String, MultipartFile>();
		
		//파일이 있을 경우만 것만 다시 꺼내서 map에 저장하기(파일이 없어도 그냥 다 저장됨)
		for(String k : fileMap.keySet()) {
			if(fileMap.get(k).getOriginalFilename() != "") {
				fileMap2.put("ofile" + i,fileMap.get(k));
				i++;
			}
		}

		for(String key : fileMap2.keySet()) {
			String originalFilename = fileMap2.get(key).getOriginalFilename();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String renamefilename = sdf.format(new java.sql.Date(System.currentTimeMillis())); //현재시간
			renamefilename += "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1); //확장자명
			
			try {
				fileMap2.get(key).transferTo(new File(savePath + "\\" + renamefilename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			for(int j = 0; j < fileMap2.size(); j++) { //파일명 notice에 set하기
				switch (j) {
				case 0 : notice.setNoticeOriginalFilename1(originalFilename);
					     notice.setNoticeRenameFilename1(renamefilename); break;
				case 1 : notice.setNoticeOriginalFilename2(originalFilename);
						 notice.setNoticeRenameFilename2(renamefilename); break;
				case 2 : notice.setNoticeOriginalFilename3(originalFilename);
						 notice.setNoticeRenameFilename3(renamefilename); break;
				}
			}
		}
		
		if(noticeService.insertNotice(notice) > 0) {
			returnView = "redirect:/nlist.do";
		} else {
			request.setAttribute("message", "새 공지사항 등록 처리 실패");
			returnView = "common/error";
		}
		
		return returnView;
	}
	
	
	//공지사항 수정 페이지 이동
	@RequestMapping(value="movenoticeupdate.do")
	public ModelAndView moveNoticeUpdate(Notice notice, HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("notice/noticeUpdate");
		return mv;
	}
	
	
}
