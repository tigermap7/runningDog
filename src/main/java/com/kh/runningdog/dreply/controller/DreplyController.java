package com.kh.runningdog.dreply.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.kh.runningdog.dreply.model.vo.Dreply;

@Controller
public class DreplyController {
		
private static final Logger logger = LoggerFactory.getLogger(DreplyController.class);
	
	@Autowired
	private DreplyService dreplyService;
	

	
	@RequestMapping(value="insertDreply.do", method= RequestMethod.POST)
	public String insertDreply (Dreply dreply, @RequestParam(value="dNum") int dNum, Model model) {
		logger.info("리플 insert 값 : ", dreply + "게시글 번호 : " + dNum);
		logger.info("댓글 insert dreply 값 :"+dreply);
		
		dreply.setdNum(dNum);
		
		String url = "";
		if (dreplyService.insertDreply(dreply) > 0) {
			model.addAttribute("msg", "댓글을 등록 했습니다.");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}else {
			model.addAttribute("msg", "댓글 등록에 실패 했습니다.");
			model.addAttribute("url", "dboardList.do)");
			url = "common/errorDboard";
		}
		return url;
	}
	
	@RequestMapping("updateDreply.do")
	public String updateDreply (Dreply dreply, @RequestParam(value="dreNum") int dreNum,Model model,
							@RequestParam(value="dreParents") int dreParents) {
		logger.info("댓글 update 값 : "+ dreply + "게시글 번호 : " + dreNum);
		
		
		dreply.setDreNum(dreNum);
		dreply.setDreParents(dreParents);
		
		String url = "";
		if (dreplyService.updateDreply(dreply) > 0) {
			model.addAttribute("msg", "댓글수정 완료.");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}else {
			model.addAttribute("msg", "댓글 수정 실패.");
			model.addAttribute("url", "dboardList.do)");
			url = "common/errorDboard";
		}
		return url;
	}
	
	
	@RequestMapping(value="updateDreplyDel.do", method=RequestMethod.POST)
	public String updateDreplyDel (Dreply dreply, Model model,@RequestParam(value="dreNum") int dreNum,
									@RequestParam(value="dNum") int dNum)  {
		logger.info("삭제할 댓글 번호 : " + dreNum);
		
		dreply.setDreNum(dreNum);
		dreply.setdNum(dNum);
		
		String url = "";
		if (dreplyService.updateDreplyDel(dreply) > 0) {
			model.addAttribute("msg", "댓글을 삭제 했습니다.");
			model.addAttribute("url", "dboardList.do");
			url = "common/errorDboard";
		}else {
			model.addAttribute("msg", "댓글 삭제 실패.");
			model.addAttribute("url", "dboardList.do)");
			url = "common/errorDboard";
		}
		return url;
	}
	
	
	@RequestMapping(value="insertDreplyLevel.do", method=RequestMethod.POST)
	public void insertDreplyLevel (Dreply dreply, @RequestParam(value="dNum") int dNum, HttpServletResponse response) throws IOException {
		
		logger.info("대댓글 번호 : " + dNum);
		logger.info("대댓글 uniqueNum : " + dreply.getUniqueNum());
		logger.info("대댓글 dreContent : " + dreply.getDreContent());
		logger.info("대댓글 dreNum : " + dreply.getDreNum());
		logger.info("대댓글 dreWriter : " + dreply.getDreWriter());
		
		
		response.setContentType("text/html; charset=utf-8");
		dreply.setdNum(dNum);
		
		int result = dreplyService.insertDreplyLevel(dreply);
		
		PrintWriter out = response.getWriter();
		out.append(Integer.toString(result));	//result = 0  입력 X, 1 = 입력 O
		out.flush();
		out.close();
		
	}
}
	
