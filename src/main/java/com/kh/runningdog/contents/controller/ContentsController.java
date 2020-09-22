package com.kh.runningdog.contents.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.runningdog.contents.IssueCrawling;
import com.kh.runningdog.contents.KnowledgeCrawling;
import com.kh.runningdog.contents.model.vo.Issue;
import com.kh.runningdog.contents.model.vo.Knowledge;
import com.kh.runningdog.notice.model.vo.NoticePage;

@Controller
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	

	//상식 목록페이지 이동, 출력
	@RequestMapping(value="cknowlist.do")
	public ModelAndView contentsKnowledgeList(ModelAndView mv, HttpServletRequest request) {
		logger.info("cknowlist.do run...");
		
		int currentPage = 1; //기본 페이지
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		
		String animal = "dog";
		if(request.getParameter("animal") != null) {
			animal = request.getParameter("animal");
		}
		JSONObject jobj = KnowledgeCrawling.knowledgeList(animal);
		
		ArrayList<Knowledge> list = new ArrayList<Knowledge>();
		
		int listCount = Integer.parseInt(jobj.get("totalCount").toString());
		
		NoticePage page = new NoticePage(currentPage, listCount, limit); //현재 페이지와 총 갯수 보내서, startPage, endpage등.. 값 만들기
		
		String url = jobj.get("url").toString();
		
		JSONArray jarr = new JSONArray();
		jarr = (JSONArray)jobj.get("list");
		
		int start = page.getStartRow();
		int end = page.getEndRow();
		
		//마지막 페이징일 경우 for문 end값 수정
		if(page.getEndPage() == page.getCurrentPage()) {
			double a = (double)page.getListCount() / (double)page.getLimit() * page.getLimit();
			int b = page.getListCount() / page.getLimit() * page.getLimit();
			int c =  (int)a - b -1;
			end = page.getStartRow() + c;
		}
		
		//jsonArray => ArrayList<Knowledge>로 변환 (컨트롤 더 쉽게하려고)
		for(int i = start - 1; i < end; i++) {
			
			JSONObject job = (JSONObject)jarr.get(i);
			
			Knowledge knowledge = new Knowledge();
			
			knowledge.setAnimal(animal);
			knowledge.setNo(job.get("no").toString());
			knowledge.setReadcount(job.get("readcount").toString());
			knowledge.setTitle(job.get("title").toString());
			knowledge.setLink(job.get("link").toString());
			
			list.add(knowledge);
		}
		
		mv.addObject("animal", animal);
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("issue/knowledgeList");
		return mv;
	}
	
	//상식 상세페이지 이동, 출력
	@RequestMapping(value="cknowdetail.do")
	public ModelAndView contentsKnowledgeDetail(ModelAndView mv, HttpServletRequest request) {
		logger.info("cknowdetail.do run...");
		
		String link = request.getParameter("link");
		String title = request.getParameter("title");
		String readcount = request.getParameter("readcount");
		
		String content = KnowledgeCrawling.knowledgeDetal(link);
		
		mv.addObject("title", title);
		mv.addObject("content", content);
		mv.addObject("readcount", readcount);
		mv.setViewName("issue/knowledgeView");
		return mv;
	}
	
	
	//이슈 목록페이지 이동, 출력
	@RequestMapping(value="cissuelist.do")
	public ModelAndView contentsIssueList(ModelAndView mv, HttpServletRequest request) {
		logger.info("cissuelist.do run...");
		
		int currentPage = 1; //기본 페이지
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 15;
		
		//정렬 기본 발행순
		String order = "order";
		
		if(request.getParameter("order") != null) { //정렬 값이 전달왔을 때
			order = request.getParameter("order");
		}
		
		JSONObject jobj = new JSONObject();
		if( order.equals("order")) { // 정렬 발행순 일때
			jobj = IssueCrawling.issueListLatest();
		} else { // 정렬 인기순 일때
			jobj = IssueCrawling.issueListPopular();
		}
		
		ArrayList<Issue> list = new ArrayList<Issue>();
		
		int listCount = Integer.parseInt(jobj.get("totalCount").toString());
		
		NoticePage page = new NoticePage(currentPage, listCount, limit); //현재 페이지와 총 갯수 보내서, startPage, endpage등.. 값 만들기
		
		JSONArray jarr = new JSONArray();
		jarr = (JSONArray)jobj.get("list");
		
		int start = page.getStartRow();
		int end = page.getEndRow();
		
		//마지막 페이징일 경우 for문 end값 수정
		if(page.getEndPage() == page.getCurrentPage()) {
			double a = (double)page.getListCount() / (double)page.getLimit() * page.getLimit();
			int b = page.getListCount() / page.getLimit() * page.getLimit();
			int c =  (int)a - b -1;
			end = page.getStartRow() + c;
		}
		
		//jsonArray => ArrayList<Knowledge>로 변환 (컨트롤 더 쉽게하려고)
		for(int i = start - 1; i < end; i++) {
			
			JSONObject job = (JSONObject)jarr.get(i);
			
			Issue issue = new Issue();
			
			issue.setPartnerName(job.get("partnerName").toString());
			issue.setPartnerImg(job.get("partnerImg").toString());
			issue.setTitle(job.get("title").toString());
			issue.setThumbnail(job.get("thumbnail").toString());
			issue.setLink(job.get("link").toString());
			
			if( order.equals("order")) { // 정렬 발행순 일때, 작성일 등록
				issue.setDate(job.get("date").toString());
			} else { // 정렬 인기순 일때, 조회수 등록
				issue.setReadcount(Integer.parseInt(job.get("readcount").toString()));
			}
			
			list.add(issue);
		}
		
		mv.addObject("page", page);
		mv.addObject("order", order);
		mv.addObject("list", list);
		mv.setViewName("issue/issueList");
		return mv;
	}
	
	//이슈 상세페이지 이동, 출력
	@RequestMapping(value="cissuedetail.do")
	public ModelAndView contentsIssueDetail(ModelAndView mv, Issue issue) {
		logger.info("cissuedetail.do run...");

		String link = issue.getLink();
		JSONObject jobj = IssueCrawling.issueDetail(link);

		issue.setDate(jobj.get("date").toString());
		issue.setReadcount(Integer.parseInt(jobj.get("readcount").toString()));
		issue.setTitle(jobj.get("title").toString());
		issue.setLink(jobj.get("url").toString());
		issue.setContent(jobj.get("content").toString());
		
		mv.addObject("issue", issue);
		mv.setViewName("issue/issueView");
		return mv;
	}
	
	
	//메인페이지에 필수, new 공지사항 출력하기
	@RequestMapping(value="mainIssueList.do", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String selectNoticeState() {
		logger.info("mainIssueList.do run...");
		JSONObject jobj = IssueCrawling.mainIssueList();
		return jobj.toJSONString();
	}
}
