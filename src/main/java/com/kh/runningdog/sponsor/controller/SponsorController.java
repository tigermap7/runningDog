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
////////////// 지우기 혹은 주석처리 ///////////////////////////////////////////////////////////////////////////
    @RequestMapping("ad.do")
	public String movead() {
		return "admin/member/allMember";
	}
////////////// 어드민컨트롤러로 나중에 이동 혹은 그냥 여기 머물기 ///////////////////////////////////////////////////////////////////////////
    @RequestMapping("aslist.ad")
	public String moveAdminSponsorList() {
		return "admin/userBoard/sponsorList";
	}
    
    @RequestMapping("aswrite.ad")
	public String moveSponsorWrite() {
		return "admin/userBoard/sponsorWrite";
	}
    
    @RequestMapping("asdetial.ad")
	public String moveAdminSponsorDetail() {
		return "admin/userBoard/sponsorView";
	}
    
    
    
    
    
}
