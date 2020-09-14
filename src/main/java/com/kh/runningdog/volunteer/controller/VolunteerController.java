package com.kh.runningdog.volunteer.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.DuplicateFormatFlagsException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.volunteer.model.service.VolunteerService;
import com.kh.runningdog.volunteer.model.vo.Volunteer;
import com.kh.runningdog.volunteer.model.vo.Vreply;
import com.sun.imageio.plugins.common.ImageUtil;

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
			mv.setViewName("protect/serviceList");
		 }
		 else {
			 mv.addObject("message", currentPage + "페이지에 대한 목록 조회 실패!");
			 mv.setViewName("common/error");
		 }
		return mv;
	}
	//상세보기 페이지 출력
	@RequestMapping(value = "vdetail.do")
	public String selectVolunteer(HttpServletRequest request, Model model) {
		int volno = Integer.parseInt(request.getParameter("volno"));
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		//댓글 갯수 조회
		int listCountVreply = volunteerService.getListCountVreply(volno);
		
		//댓글리스트
		ArrayList<Vreply> vrlist = volunteerService.selectVreplyList(volno);
		
		/*
		 * Map<String, Object> map = new HashMap<>();//리스트의 값을 저장하기 위해 map객체를 생성 그안에
		 * 리스트를 저장
		 * 
		 * map.put("vrlist", vrlist);//뷰에 전달할 데이터
		 * 
		 * mv.addObject("map", map);//뷰에 전달할 데이터저장
		 */		
		Volunteer volunteer = volunteerService.selectVolunteer(volno);
		
		if(volunteer != null) {
			request.setAttribute("volunteer", volunteer);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("listCountVreply", listCountVreply);
			request.setAttribute("vrlist", vrlist);
			return "protect/serviceView";
		}else {
			model.addAttribute("message", volno + "번 글 상세보기 실패!");
			return  "common/error";
		}
	}
	 //글등록하기
	@RequestMapping(value = "vinsert.do", method = RequestMethod.POST) 
	public String insertVolunteer(Volunteer volunteer, HttpServletRequest request, 
			@RequestParam Map<String, MultipartFile> fileMap) {
		      logger.info("vinsert.do run...");
		      String returnView = null;
		      int i = 1;
		      
		      String savePath = request.getSession().getServletContext().getRealPath("resources/vfiles"); //파일 저장할 폴더 위치
		      
		      for(String key : fileMap.keySet()) {
		         if(fileMap.get(key).getOriginalFilename() != "") {
		         String originalFilename = fileMap.get(key).getOriginalFilename();
		         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		         String renamefilename = sdf.format(new java.sql.Date(System.currentTimeMillis())); //현재시간
		         renamefilename += "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1); //확장자명
		         
		         try {
		            fileMap.get(key).transferTo(new File(savePath + "\\" + renamefilename));
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		            switch (i) {
		            case 1 : volunteer.setVolor1(originalFilename);
		                     volunteer.setVolre1(renamefilename); break;
		            case 2 : volunteer.setVolor2(originalFilename);
                    		 volunteer.setVolre2(renamefilename); break;
		            case 3 : volunteer.setVolor3(originalFilename);
                    		 volunteer.setVolre3(renamefilename); break;
		            case 4 : volunteer.setVolor4(originalFilename);
		            		 volunteer.setVolre4(renamefilename); break;
		         }
		            i++;
		         }
		      }
		      
		      if(volunteerService.insertVolunteer(volunteer) > 0) {
		         returnView = "redirect:/vlist.do";
		      } else {
		         request.setAttribute("message", "새 글 등록 처리 실패");
		         returnView = "common/error";
		      }
		      
		      return returnView;
		   }
	//수정페이지로 이동
	@RequestMapping(value = "vUpdateView.do")
	public String moveVolunteerUpdateView(HttpServletRequest request, Model model) {
		int volno = Integer.parseInt(request.getParameter("volno"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		Volunteer volunteer = volunteerService.selectVolunteer(volno);
		
		if(volunteer != null) {
			request.setAttribute("volunteer", volunteer);
			request.setAttribute("page", currentPage);
			return "protect/serviceUpdate";
		}else {
			request.setAttribute("message", volno + "번 글 수정페이지로 이동 실패!");
			return  "common/error";
		}
		
	}
	//글수정하기
	@RequestMapping(value = "vupdate.do", method = RequestMethod.POST) 
	public String updateVolunteer(Volunteer volunteer, HttpServletRequest request, 
			@RequestParam Map<String, MultipartFile> fileMap) {
	      logger.info("vupdate.do run...");
	      String returnView = null;
	      int i = 1;
	      
	      String savePath = request.getSession().getServletContext().getRealPath("resources/vfiles"); //파일 저장할 폴더 위치
	      
	      for(String key : fileMap.keySet()) {
	         if(fileMap.get(key).getOriginalFilename() != "") {
	         String originalFilename = fileMap.get(key).getOriginalFilename();
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	         String renamefilename = sdf.format(new java.sql.Date(System.currentTimeMillis())); //현재시간
	         renamefilename += "." + originalFilename.substring(originalFilename.lastIndexOf(".") + 1); //확장자명
	         
	         try {
	            fileMap.get(key).transferTo(new File(savePath + "\\" + renamefilename));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	            switch (i) {
	            case 1 : volunteer.setVolor1(originalFilename);
	                     volunteer.setVolre1(renamefilename); break;
	            case 2 : volunteer.setVolor2(originalFilename);
              		 volunteer.setVolre2(renamefilename); break;
	            case 3 : volunteer.setVolor3(originalFilename);
              		 volunteer.setVolre3(renamefilename); break;
	            case 4 : volunteer.setVolor4(originalFilename);
	            		 volunteer.setVolre4(renamefilename); break;
	         }
	            i++;
	         }
	      }
	      
	      if(volunteerService.updateVolunteer(volunteer) > 0) {
	         returnView = "redirect:/vlist.do";
	      } else {
	         request.setAttribute("message", "새 글 수정 처리 실패");
	         returnView = "common/error";
	      }
	      
	      return returnView;
	   }
	  
	//글삭제하기
	@RequestMapping(value="vdelete.do") 
	public String deleteVolunteer(HttpServletRequest request, Volunteer volunteer, Model model) {
		int volno = Integer.parseInt(request.getParameter("volno"));
		
		volunteer.setVolno(volno);
		
		if(volunteerService.deleteVolunteer(volunteer) > 0) {
			for (int i = 1; i < 5; i++) {
				String renameFileName = request.getParameter("rfile"+ i);
				if(renameFileName != null) {
					String savePath = request.getSession().getServletContext().getRealPath("resources/vfiles");
					new File(savePath + "\\" + renameFileName).delete();
			}
		}
			return "redirect:/vlist.do";
		}else {
			model.addAttribute("message", volno + "번 글 삭제 실패!");
			return  "common/error";
		}
		
	}
	
	@RequestMapping(value = "vrinsert.do", method = RequestMethod.POST)
	public String insertVreply(Vreply vreply, HttpSession session, 
			@RequestParam(value = "vreply_content") String vreply_content, 
			@RequestParam(value = "nickname") String nickname, 
			@RequestParam(value = "volno") int volno) {
		
		if(session.getAttribute("nickname") != null) {
			vreply.setNickname(nickname);
		}
		
		vreply.setVreply_content(vreply_content);
		vreply.setVolno(volno);
		
		volunteerService.insertVreply(vreply);
		
		return "forward:/vdetail.do";
		
	}
	
	@RequestMapping(value = "vrupdate.do")
	public String updateVreply(@RequestParam(value = "vreply_no") int vreply_no, 
							   @RequestParam(value = "vreply_content") String vreply_content, 
							   @RequestParam(value = "nickname")String nickname,
					           @RequestParam(value="volno")int volno, Vreply vreply) throws Exception{
		vreply.setVreply_no(vreply_no);
		vreply.setVreply_content(vreply_content);
		vreply.setNickname(nickname);
		
		logger.info("vreply  :" + vreply);
		
		volunteerService.updateVreply(vreply);
		
		return "forward:/vdetail.do";
	}
	
	@RequestMapping(value = "vrdelete.do")
	public String deleteVreply (@RequestParam(value="vreply_no") int vreply_no, Vreply vreply, 
								@RequestParam(value="volno") int volno) throws Exception{
        
	volunteerService.deleteVreply(vreply_no);
	
	return "forward:/vdetail.do";
	}
}
