package com.kh.runningdog.admin.dboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.runningdog.dboard.controller.DboardController;
import com.kh.runningdog.dboard.model.service.DboardService;
import com.kh.runningdog.dboard.model.vo.Dboard;



@Controller
public class AdminDboardController {

	private static final Logger logger = LoggerFactory.getLogger(DboardController.class);
	
	@Autowired
	private DboardService dboardService;
	
	@RequestMapping("dboardList.ad")
	public String adminDboardList (HttpServletRequest request, Model model, @ModelAttribute("Dboard") Dboard dboard) {
		dboard.setSearchFiled(request.getParameter("searchFiled"));
		dboard.setSearchValue(request.getParameter("searchValue"));
		dboard.setdCategory(request.getParameter("dCategory"));
		dboard.setdLocal(request.getParameter("dLocal"));
		logger.info("SearchFiled : " + dboard.getSearchFiled());
		logger.info("SearchValue : " + dboard.getSearchValue());
		int totalCount = dboardService.selectAdminCount(dboard); // 게시물 총갯수를 구한다
		
		
		//게시물 총횟수랑 첫 페이지에 몇개의 리스트를 보여줄지 체크,
		//pageVO에 makePaing 메소드에 페이지리스트 갯수를 넣어줌
		dboard.setTotalCount(totalCount,10); // 페이징 처리를 위한 setter 호출
		
		//관리자 페이지 썸네일 때문에 한페이지에 보여줄 게시물 줄임
		
		model.addAttribute("pageVO", dboard);
		logger.info("PageSize // 한 페이지에 보여줄 게시글 수 : " + dboard.getPageSize());
		logger.info("PageNo // 페이지 번호 : " + dboard.getPageNo());
		logger.info("StartRowNo //조회 시작 row 번호 : " + dboard.getStartRowNo());
		logger.info("EndRowNo //조회 마지막 now 번호 : " + dboard.getEndRowNo());
		logger.info("FirstPageNo // 첫 번째 페이지 번호 : " + dboard.getFirstPageNo());
		logger.info("FinalPageNo // 마지막 페이지 번호 : " + dboard.getFinalPageNo());
		logger.info("PrevPageNo // 이전 페이지 번호 : " + dboard.getPrevPageNo());
		logger.info("NextPageNo // 다음 페이지 번호 : " + dboard.getNextPageNo());
		logger.info("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + dboard.getStartPageNo());
		logger.info("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + dboard.getEndPageNo());
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);

		ArrayList<Dboard> dboardList = dboardService.selectAdminList(dboard);
		
		
		model.addAttribute("dLocal", dboard.getdLocal());
		model.addAttribute("dCategory", dboard.getdCategory());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("dboardList", dboardList);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (totalCount > 0) {
			url = "admin/userBoard/chooseAdminList";
		} else {
			model.addAttribute("msg", "검색 결과가 존재 하지 않습니다");
			model.addAttribute("url", "dlist.ad");
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("dboardView.ad")
	public String selectOne(@RequestParam("dNum") int dNum,Model model) {
		Dboard dboard = dboardService.selectOne(dNum);
		logger.info("dboard View게시글 번호" + dNum);
		// 리턴은 한번 하기 위해 url 값 받고 리턴
		String url = "";
		if (dboard != null) {
			model.addAttribute("dboard", dboard);
			url = "admin/userBoard/chooseAdminView";
		} else {
			model.addAttribute("msg", "게시글 보기 실패");
			model.addAttribute("url", "chooseAdminList.ad");
			url = "common/errorDboard";
		}
		return url;
	}
	
}
