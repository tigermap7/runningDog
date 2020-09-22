package com.kh.runningdog.sponsor.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.sponsor.model.service.SponsorService;
import com.kh.runningdog.sponsor.model.vo.Sponsor;
import com.kh.runningdog.sponsor.model.vo.SponsorList;

@Controller
public class SponsorController {
	private Logger logger = LoggerFactory.getLogger(SponsorController.class);
	
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
	public String moveSponsoredPayment(Model model, @RequestParam() String title, @RequestParam() int sNum) {
    	model.addAttribute("sNum", sNum);
    	model.addAttribute("title", title);
		return "sponsor/sponsoredPayment";
	}
    
    @RequestMapping("spaysu.do")
	public String moveSponsoredPaySuccess(Model model, @RequestParam() String date, SponsorList slist, @RequestParam() String title) {
    	slist = sponsorService.selectSponsorListOne(date);
    	
    	String way = null;
    	switch(slist.getSpWay()) {
    	case "chk1" : way = "신용카드"; break;
    	case "chk2" : way = "무통장입금"; break;
    	case "chk3" : way = "실시간 계좌이체"; break;
    	}
    	
    	model.addAttribute("way", way);
    	model.addAttribute("cash", slist.getSpCash());
    	model.addAttribute("title", title);
		return "sponsor/sponsoredPaySuccess";
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
    
    @RequestMapping(value="sSpon.do", method=RequestMethod.POST)
    public ModelAndView SponsorPay(SponsorList slist, HttpServletRequest request, ModelAndView mv, @RequestParam() String title) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String spDate = sdf.format(new java.sql.Date(System.currentTimeMillis()));
		slist.setSpDate(spDate);
    	slist.setSpCash(Integer.parseInt(request.getParameter("amount").replaceAll(",", "")));
    	if(slist.getSpEch() == null)
    		slist.setSpEch("n");
    	if(slist.getSpPch() == null)
    		slist.setSpPch("n");
    	logger.info("결제창 열리기 전 : "+slist.toString());
    	
    	mv.addObject("title", title);
    	mv.addObject("sponsorList", slist);
    	mv.setViewName("sponsor/sponsoredPayment2");
    	
    	return mv;
    }
    
    @RequestMapping(value="sSponpay.do", method=RequestMethod.POST)
    public ResponseEntity<String> SponsorPayreal(@RequestBody String param, SponsorList slist, Sponsor sponsor) {
    	
    	JSONParser jparser = new JSONParser();
		JSONObject job = null;
		try {
			job = (JSONObject) jparser.parse(param);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
		slist.setSpDate((String)job.get("spDate"));
		slist.setSpName((String)job.get("spName"));
		slist.setSpEmail((String)job.get("spEmail"));
		slist.setSpPhone((String)job.get("spPhone"));
		slist.setSpSnumber((String)job.get("spSnumber"));
		slist.setSpCash(Integer.valueOf((String)job.get("spCash")));
		slist.setSpEch((String)job.get("spEch"));
		slist.setSpPch((String)job.get("spPch"));
		slist.setSpWay((String)job.get("spWay"));
		slist.setsNum(Integer.valueOf((String)job.get("sNum")));
		
		logger.info("결제 완료 후 : "+slist.toString());
		
		int result = sponsorService.insertSponsorList(slist);
		
		sponsor.setsCurrent(Integer.valueOf((String)job.get("spCash")));
		sponsor.setsNum(Integer.valueOf((String)job.get("sNum")));
		int result2 = sponsorService.updateSponsorCash(sponsor);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
    }
    
}
