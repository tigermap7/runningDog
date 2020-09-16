package com.kh.runningdog.dreply.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.dreply.model.service.DreplyService;
import com.kh.runningdog.dreply.model.vo.Dreply;

@Controller
public class DreplyController {
		
private static final Logger logger = LoggerFactory.getLogger(DreplyController.class);
	
	@Autowired
	private DreplyService dreplyService;
	
	
	//댓글 저장 요청 처리
		@RequestMapping(value="insertDreplyCall.do",method=RequestMethod.POST)
		public ModelAndView authCommentInsert(HttpServletRequest request,
				@RequestParam int ref_group){
	    	dreplyService.saveComment(request);
			return new ModelAndView("redirect:/cafe/detail.do?num="+ref_group);
		}
	
	
	
	
	
	}
	
