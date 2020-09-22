package com.kh.runningdog.admin.volunteer.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.volunteer.model.service.VolunteerService;
import com.kh.runningdog.volunteer.model.vo.Volunteer;

@Controller
public class AdminVolunteerController {
	private static final Logger logger = LoggerFactory.getLogger(AdminVolunteerController.class);
	
	//DI
	@Autowired
	private VolunteerService volunteerService;
	
	//자원봉사게시판 전체목록 출력(관리자용)
		@RequestMapping("vlist.ad")
		public ModelAndView selectListVolunteerAdmin(HttpServletRequest request, ModelAndView mv) {
			int currentPage = 1;
			if(request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			//한페이지당 출력할 목록 갯수 지정
			int limit = 6;
			//전체 목록 갯수 조회
			int listCount = volunteerService.getListCount();
			
			//검색기능
			String type = request.getParameter("type");
			String keyword = request.getParameter("keyword");
			//현재페이지에 출력할 게시글 목록 조회
			ArrayList<Volunteer> list = volunteerService.selectList(currentPage, limit, keyword, type);
			
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
				mv.setViewName("admin/userBoard/serviceList");
			 }
			 else {
				 mv.addObject("message", currentPage + "페이지에 대한 목록 조회 실패!");
				 mv.setViewName("common/error");
			 }
			return mv;
		}
		//상세보기 페이지 출력(관리자용)
		@RequestMapping(value = "vdetail.ad")
		public String detailVolunteerAdmin(HttpServletRequest request, Model model) {
			int volno = Integer.parseInt(request.getParameter("volno"));
			int currentPage = 1;
			if(request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			
			Volunteer volunteer = volunteerService.selectVolunteer(volno);
			
			if(volunteer != null) {
				request.setAttribute("volunteer", volunteer);
				request.setAttribute("currentPage", currentPage);
				return "admin/userBoard/serviceView";
			}else {
				model.addAttribute("message", volno + "번 글 상세보기 실패!");
				return  "common/error";
			}
		}
		//글삭제하기(관리자용)
		@RequestMapping(value="vdelete.ad") 
		public String deleteVolunteerAdmin(HttpServletRequest request, Volunteer volunteer, Model model) {
			
			String[] checkRow = null;
			checkRow = request.getParameter("checkRow").split(",");

			
			if(volunteerService.deleteVolunteerAdmin(checkRow) > 0) {
				for (int i = 1; i < 5; i++) {
					String renameFileName = request.getParameter("rfile"+ i);
					if(renameFileName != null) {
						String savePath = request.getSession().getServletContext().getRealPath("resources/vfiles");
						new File(savePath + "\\" + renameFileName).delete();
				}
			}
				return "redirect:/vlist.ad";
			}else {
				model.addAttribute("message", "글 삭제 실패!");
				return  "common/error";
			}
			
		}
		//이전글(관리자용)
		@RequestMapping("vpre.ad")
		public String selectVpre(HttpServletRequest request, Model model,
				   				@RequestParam(value = "volno") int volno) {
			
			int vpre = volunteerService.selectVolunteerPre(volno);
			
			String returnView = null;
			
			if( vpre > 0 ) {
				model.addAttribute("volno", vpre);
		         returnView = "redirect:/vdetail.ad";
		      } else {
		         request.setAttribute("message", "글이 존재하지않습니다.");
		         returnView = "common/error";
		      }
		      
		      return returnView;
		}
		//다음글(관리자용)
		@RequestMapping("vnext.ad")
		public String selectVnext(HttpServletRequest request, Model model,
				   				@RequestParam(value = "volno") int volno) {
			
			int vnext = volunteerService.selectVolunteerNext(volno);
			
			String returnView = null;
			
			if( vnext > 0 ) {
				model.addAttribute("volno", vnext);
		         returnView = "redirect:/vdetail.ad";
		      } else {
		         request.setAttribute("message", "글이 존재하지않습니다.");
		         returnView = "common/error";
		      }
		      
		      return returnView;
		}
	

}
