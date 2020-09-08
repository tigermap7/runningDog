package com.kh.runningdog.volunteer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.volunteer.model.service.VolunteerService;
import com.kh.runningdog.volunteer.model.vo.Volunteer;

@Controller
public class VolunteerController {
	private static final Logger logger = LoggerFactory.getLogger(VolunteerController.class);
	
	//DI
	@Autowired
	private VolunteerService volunteerService;
	
	//뷰페이지로 이동 처리용 메소드 ------------
	@RequestMapping("vWriteFormView.do")
	public String moveVolunteerWriteForm() {
		return "protect/serviceWrite";
	}
	
	//자원봉사게시판 전체목록 출력
	@RequestMapping("vlist.do")
	public ModelAndView selectListVolunteer(HttpServletRequest request, ModelAndView mv) {
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		//한페이지당 출력할 목록 갯수 지정
		int limit = 6;
		//전체 목록 갯수 조회
		int listCount = volunteerService.getListCount();
		//현재페이지에 출력할 게시글 목록 조회
		ArrayList<Volunteer> list = volunteerService.selectList(currentPage, limit);
		
		// 뷰에 출력될 총 페이지 수 계산 : 게시글이 1개이면 1페이지임
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 그룹의 시작 페이지 수 지정
		// 예 : currentPage 가 35이면 페이지그룹이 10일 때 시작페이지는 31이 됨
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		// 뷰 지정해서 내보내기
		 if (list.size() > 0) {
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
					
			mv.addObject("list", list);
			mv.setViewName("protect/serviceList");
		 }
		 else {
			 mv.addObject("message", currentPage + "페이지에 대한 목록 조회 실패!");
			 mv.setViewName("main/main");
		 }
		return mv;
	}

}
