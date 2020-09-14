package com.kh.runningdog.sponsor.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.sponsor.model.service.SponsorService;
import com.kh.runningdog.sponsor.model.vo.Sponsor;

@Controller
public class SponsorController {
	
	@Autowired
	private SponsorService sponsorService;
	
	@RequestMapping("slist.do")
	public ModelAndView moveSponsorList(ModelAndView mv, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int countList = 6;
		int countPage = 5;
		
		int totalList = sponsorService.selectListCount();
		int totalPage = (int)(((double)totalList / countList) + 0.9);
		int startPage = ((int)(((double)currentPage / countPage) + 0.9) - 1) * countPage + 1;
		int endPage = startPage + countPage - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		ArrayList<Sponsor> list = sponsorService.selectList(currentPage, countList);
		
		if(list.size() > -1) {
			mv.addObject("list", list);
			mv.addObject("page", currentPage);
			mv.addObject("totalList", totalList);
			mv.addObject("totalPage", totalPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.setViewName("sponsor/sponsorList");
		}
		return mv;
	}
	
    @RequestMapping("sdetail.do")
	public ModelAndView moveSponsorView(ModelAndView mv, @RequestParam() int page, @RequestParam() int sNum) {
    	Sponsor sponsor = sponsorService.selectOne(sNum);
    	
    	if(sponsor != null) {
    		mv.addObject("page", page);
    		mv.addObject("sponsor", sponsor);
    		mv.setViewName("sponsor/sponsorView");
    	}
		return mv;
	}
    
    @RequestMapping("spay.do")
	public String moveSponsoredPayment() {
		return "sponsor/sponsoredPayment";
	}
    
    @RequestMapping("ssearch.do")
	public ModelAndView moveSponsorSearch(ModelAndView mv, HttpServletRequest request) {
		HashMap<String, String> key = new HashMap<>();
		key.put("selected", request.getParameter("selected"));
		key.put("keyword", request.getParameter("keyword"));
		
		ArrayList<Sponsor> list = sponsorService.selectSearch(key);
    	
		if(list.size() > -1) {
			mv.addObject("list", list);
			mv.addObject("page", 1);
			mv.addObject("totalList", list.size());
			mv.addObject("totalPage", 1);
			mv.addObject("startPage", 1);
			mv.addObject("endPage", 1);
			mv.setViewName("sponsor/sponsorList");
		}
		return mv;
	}
    
    
}
