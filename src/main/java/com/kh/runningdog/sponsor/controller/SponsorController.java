package com.kh.runningdog.sponsor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SponsorController {
	
//	@Autowired
//	private SponsorService sponsorService
	
	@RequestMapping("slist.do")
	public String moveSponsorList() {
		return "sponsor/sponsorList";
	}
	
    @RequestMapping("sdetail.do")
	public String moveSponsorView() {
		return "sponsor/sponsorView";
	}
    
    @RequestMapping("spay.do")
	public String moveSponsoredPayment() {
		return "sponsor/sponsoredPayment";
	}
    
    
    
}
