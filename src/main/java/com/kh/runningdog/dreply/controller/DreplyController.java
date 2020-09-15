package com.kh.runningdog.dreply.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.runningdog.dreply.model.service.DreplyService;

@Controller
public class DreplyController {
		
private static final Logger logger = LoggerFactory.getLogger(DreplyController.class);
	
	@Autowired
	private DreplyService dreplyService;
	
	
	@RequestMapping(value="drelist.do")
	public String selectDreplys(@RequestParam Map<String,Object> dreply,
								@RequestParam int dNum,Model model) {
		
		int dreplyCount = dreplyService.selectDreCount(dreply);
		dreply.put("d_num", dNum);
		model.addAttribute("dreplyList", dreplyService.selectDreplyList(dreply));
		model.addAttribute("dreplyCount",dreplyCount);
		
		return "dreplyList";
	}
	
	
	@RequestMapping(value="dreinsert.do", method= RequestMethod.POST)
	@ResponseBody
	public Object insertDreply (@RequestParam Map<String, Object> dreply) {
		Map<String , Object> reply = new HashMap<String, Object>();
		
		int result = dreplyService.insertDreply(dreply);
		
		if(result > 0 ) {
			reply.put("code", "OK");
			reply.put("dreWriter", dreply.get("dreWriter"));
			reply.put("message", "댓글을 등록하였습니다.");
		}else {
			reply.put("code", "FAIL");
			reply.put("message", "댓글등록에 실패했습니다.");
		}
		
		return reply;
	}
	
	@RequestMapping(value="dredelete.do", method=RequestMethod.POST)
	@ResponseBody
	public Object deleteDreply (@RequestParam Map<String, Object> dreply) {
		
		Map<String,Object> reply = new HashMap<String, Object>();
		
		int result = dreplyService.deleteDreply(dreply);
		
		if(result > 0) {
			reply.put("code", "OK");
		}else {
			reply.put("code", "FAIL");
			reply.put("message", "삭제에 실패했습니다.");
		}
		
		return reply;
		}
	
	@RequestMapping(value="dreupdate.do", method=RequestMethod.POST)
	@ResponseBody
	public Object updateDreply(@RequestParam Map<String, Object> dreply) {
		
		Map<String,Object> reply = new HashMap<String, Object>();
		
		int result = dreplyService.updateReply(dreply);
		
		if (result > 0) {
			reply.put("code", "OK");
			reply.put("dreWriter",dreply.get("dreWriter"));
			reply.put("message", "댓글을 수정 했습니다.");
		}else {
			reply.put("code", "FAIL");
			reply.put("message", "댓글 수정을 실패 했습니다.");
		}
		
		return reply;
		}
	}
	
