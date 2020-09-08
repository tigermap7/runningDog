package com.kh.runningdog.contents.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	//상식 목록페이지 이동, 출력
	@RequestMapping(value="cknowlist.do")
	public ModelAndView contentsKnowledgeList(ModelAndView mv) {
		logger.info("cknowlist.do run...");
		mv.setViewName("issue/knowledgeList");
		return mv;
	}
	
	//상식 상세페이지 이동, 출력
	@RequestMapping(value="cknowdetail.do")
	public ModelAndView contentsKnowledgeDetail(ModelAndView mv) {
		logger.info("cknowdetail.do run...");
		mv.setViewName("issue/knowledgeView");
		return mv;
	}
	
	//이슈 목록페이지 이동, 출력
	@RequestMapping(value="cissuelist.do")
	public ModelAndView contentsIssueList(ModelAndView mv) {
		logger.info("cissuelist.do run...");
		mv.setViewName("issue/issueList");
		return mv;
	}
	
	//이슈 상세페이지 이동, 출력
	@RequestMapping(value="cissuedetail.do")
	public ModelAndView contentsIssueDetail(ModelAndView mv) {
		logger.info("cissuedetail.do run...");
		mv.setViewName("issue/issueView");
		return mv;
	}


}
