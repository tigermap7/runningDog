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
	
	
	@RequestMapping(value="dreplyList.do", method =RequestMethod.POST)
	@ResponseBody
	public String selectDreplyList (HttpServletResponse response, @RequestParam(name ="dNum") int dNum,Dreply dreply) throws IOException {
		
		logger.info("댓글 리스트 : "+dreply + "게시물번호 : " +dNum);
		dreply.setdNum(dNum);
		ArrayList<Dreply> list = dreplyService.selectList(dNum);
		
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for (Dreply dre : list) {
			JSONObject job = new JSONObject();
			
			job.put("dreNum", dre.getDreNum());
			job.put("dNum", dre.getdNum());
			job.put("dreWriter", URLEncoder.encode(dre.getDreWriter(),"utf-8"));
			job.put("dreContent", URLEncoder.encode(dre.getDreContent(),"utf-8"));
			job.put("dreDate", dre.getDreDate());
			job.put("dreMdate", dre.getDreMdate());
			job.put("dreParents", dre.getDreParents());
			job.put("uniqueNum", dre.getUniqueNum());
			job.put("dreDelete", dre.getDreDelete());
			
			jarr.add(job);
		}
		response.setContentType("text/html; charset=utf-8");
		sendJSON.put("list", jarr);
		
		return sendJSON.toJSONString();
		
	}
	
	@RequestMapping(value="insertDreply.do", method= RequestMethod.POST)
	public void insertDreply (Dreply dreply, @RequestParam(value="dNum") int dNum, HttpServletResponse response,HttpServletRequest request) throws IOException {
		logger.info("리플 insert 값 : ", dreply + "게시글 번호 : " + dNum);
		
		response.setContentType("text/html; charset=utf-8");
		
		logger.info("댓글 insert dreply 값 :"+dreply);
		dreply.setdNum(dNum);
		dreply.setDreParents(dNum);
		int result = dreplyService.insertDreply(dreply);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.append(Integer.toString(result));	//result = 0  입력 X, 1 = 입력 O
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="updateDreply.do", method=RequestMethod.POST)
	public void updateDreply (Dreply dreply, @RequestParam(value="dreNum") int dreNum, HttpServletResponse response,
							@RequestParam(value="dreParents") int dreParents) throws IOException {
		logger.info("댓글 update 값 : "+ dreply + "게시글 번호 : " + dreNum);
		
		response.setContentType("text/html; charset=utf-8");

		
		dreply.setdNum(dreNum);
		int result = dreplyService.updateDreply(dreply);
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.append(Integer.toString(result));	//result = 0  입력 X, 1 = 입력 O
		out.flush();
		out.close();
	}
	
	
	@RequestMapping(value="updateDreplyDel.do", method=RequestMethod.POST)
	public void  updateDreplyDel (Dreply dreply, HttpServletRequest reqeust,HttpServletResponse response,
							@RequestParam(value="dreNum") int dreNum,@RequestParam(value="dNum") int dNum) throws IOException {
		logger.info("삭제할 댓글 번호 : " + dreNum);
		dreply.setDreNum(dreNum);
		int result =dreplyService.updateDreplyDel(dreply);
		
		
		PrintWriter out = response.getWriter();
		out.append(Integer.toString(result));	//result = 0  입력 X, 1 = 입력 O
		out.flush();
		out.close();
	}
	
	
	@RequestMapping(value="insertDreplyLevel.do", method=RequestMethod.POST)
	public void insertDreplyLevel (Dreply dreply, @RequestParam(value="dNum") int dNum, HttpServletResponse response) throws IOException {
		logger.info("대댓글 insert 값 : ", dreply + "게시글 번호 : " + dNum);
		
		response.setContentType("text/html; charset=utf-8");
		dreply.setdNum(dNum);
		
		int result = dreplyService.insertDreplyLevel(dreply);
		
		PrintWriter out = response.getWriter();
		out.append(Integer.toString(result));	//result = 0  입력 X, 1 = 입력 O
		out.flush();
		out.close();
		
	}
}
	
