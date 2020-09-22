package com.kh.runningdog.animalInfo.controller;


import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.runningdog.dboard.model.vo.PageVO;


@Controller
public class AnimalController {
	
	private static final Logger logger = LoggerFactory.getLogger(AnimalController.class);
	
	
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		System.out.println("nlList" + nlList);
		Node nValue = (Node) nlList.item(0);
		System.out.println("nValue" + nValue);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	

	@RequestMapping("alistPage.do")
	public String moveAlistPage(HttpServletRequest request, Model model) {

		PageVO pageVo = new PageVO();
	    int pageNo = 1;
	      if (request.getParameter("pageNo") != null) {
	         pageNo = Integer.parseInt(request.getParameter("pageNo"));
	      }

		pageVo.setPageNo(pageNo);
		pageVo.setTotalCount(1000,12); // 페이징 처리를 위한 setter 호출
		
		logger.info("PageSize // 한 페이지에 보여줄 게시글 수 : " + pageVo.getPageSize());
		logger.info("PageNo // 페이지 번호 : " + pageVo.getPageNo());
		logger.info("StartRowNo //조회 시작 row 번호 : " + pageVo.getStartRowNo());
		logger.info("EndRowNo //조회 마지막 now 번호 : " + pageVo.getEndRowNo());
		logger.info("FirstPageNo // 첫 번째 페이지 번호 : " + pageVo.getFirstPageNo());
		logger.info("FinalPageNo // 마지막 페이지 번호 : " + pageVo.getFinalPageNo());
		logger.info("PrevPageNo // 이전 페이지 번호 : " + pageVo.getPrevPageNo());
		logger.info("NextPageNo // 다음 페이지 번호 : " + pageVo.getNextPageNo());
		logger.info("StartPageNo // 시작 페이지 (페이징 네비 기준) : " + pageVo.getStartPageNo());
		logger.info("EndPageNo // 끝 페이지 (페이징 네비 기준) : " + pageVo.getEndPageNo());
		logger.info("totalCount // 게시 글 전체 수 : " + pageVo.getTotalCount());
		
		
		model.addAttribute("pageVO", pageVo);
		
		return "animal/animalList";
	}
	
	@RequestMapping("aViewPage.do")
	public String moveAviewPage() {
		return "animal/animalView";
	}
	
	
	   //리스트출력
	   @ResponseBody
	   @RequestMapping(value = "animalList.do")
	   public String main(String[] args, HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
	      //int page = 1; // 페이지 초기값
		   
		   
		  PageVO pageVo = new PageVO();
		  pageVo.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
		  
		  int pageNo = pageVo.getPageNo();
		  
		  logger.info("현재페이지 : " + pageNo);
	      
	      
	      Date today = new Date();        
	      SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
	      String toDay = date.format(today);
	      
	      Calendar mon = Calendar.getInstance();
	      mon.add(Calendar.MONTH , -3);
	      String beforeMonth = new java.text.SimpleDateFormat("yyyyMMdd").format(mon.getTime());
	      
	      System.out.println(toDay + beforeMonth);
	      // 보낼 JSONObject 객체 생성
	      JSONObject sendJSON = new JSONObject();
	      JSONArray jarr = new JSONArray();

	      try {
	         /* while (true) { */
	         // parsing할 url 지정(API 키 포함해서)
	         String url = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/shelterInfo?"
	               + "serviceKey=O47ZzSBjhdMfvVC0tEcZdGSVGD6teeNcyNNtI0sbA4%2BwpXc%2BDy3Y"
	               + "0OYfDAT9S0gajYoe7yZJ%2Fnq4tcDXQxkksw%3D%3D&bgnde="+beforeMonth+"&endde="+toDay+"pageNo="
	               + pageNo+"&numOfRows=10";
	         DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	         Document doc = dBuilder.parse(url);
	         System.out.println("doc"+ doc);

	         // root tag
	         doc.getDocumentElement().normalize();
	         System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

	         // 파싱할 tag
	         NodeList nList = doc.getElementsByTagName("item");
	         
	         System.out.println("파싱할 리스트 수 : " + nList.getLength());
	         
	         pageVo.setTotalCount(nList.getLength(),12); // 페이징 처리를 위한 setter 호출
	         
	         for (int temp = 0; temp < nList.getLength(); temp++) {
	            Node nNode = nList.item(temp);
	            //System.out.println("temp"+temp);
	            //System.out.println("nNode"+nNode);
	            if (nNode.getNodeType() == Node.ELEMENT_NODE) {

	               Element eElement = (Element) nNode;

	               // JSONArray에 담을 JSONOBject 객체 생성
	               JSONObject job = new JSONObject();

	               // JSONObject에 값 담기
	               // job.put("값이름", 값); ==> 값은 무조건 스트링이어야함
	               job.put("age", URLEncoder.encode(getTagValue("careAddr", eElement),"utf-8")); // 나이
	               job.put("careAddr", URLEncoder.encode(getTagValue("careAddr", eElement),"utf-8"));// 접수일
	               job.put("careNm", URLEncoder.encode(getTagValue("careNm", eElement),"utf-8")); // 보호소 이름
	              // job.put("careTel", URLEncoder.encode(getTagValue("careTel", eElement),"utf-8")); // 보호소전화번호
	              // job.put("chargeNm", URLEncoder.encode(getTagValue("chargeNm", eElement),"utf-8")); //담당자
	              // job.put("colorCd", URLEncoder.encode(getTagValue("colorCd", eElement),"utf-8")); // 색상
	               job.put("desertionNo", getTagValue("desertionNo", eElement)); // 유기번호
	               job.put("filename", URLEncoder.encode(getTagValue("filename", eElement),"utf-8")); //썸네일이미지
	             //  job.put("happenDt", URLEncoder.encode(getTagValue("happenDt", eElement),"utf-8")); //발견일
	             //  job.put("happenPlace", URLEncoder.encode(getTagValue("happenPlace", eElement),"utf-8")); //발견장소
	               job.put("kindCd", URLEncoder.encode(getTagValue("kindCd", eElement),"utf-8")); //품종
	             //  job.put("neuterYn", URLEncoder.encode(getTagValue("neuterYn", eElement), "utf-8")); //중성화여부
	             //  job.put("noticeEdt", URLEncoder.encode(getTagValue("noticeEdt", eElement), "utf-8")); //공고종료일
	             //  job.put("noticeNo", URLEncoder.encode(getTagValue("noticeNo", eElement), "utf-8"));//공고번호
	             //  job.put("noticeSdt", URLEncoder.encode(getTagValue("noticeSdt", eElement), "utf-8")); //공고시작일
	             //  job.put("officetel", URLEncoder.encode(getTagValue("officetel", eElement), "utf-8")); //담당자연락처
	               job.put("orgNm", URLEncoder.encode(getTagValue("orgNm", eElement), "utf-8")); //관할기관
	              // job.put("popfile", URLEncoder.encode(getTagValue("popfile", eElement), "utf-8")); // view페이지 이미지
	              // job.put("processState", URLEncoder.encode(getTagValue("processState", eElement), "utf-8")); //상태
	              // job.put("sexCd", URLEncoder.encode(getTagValue("sexCd", eElement), "utf-8")); //성별
	             //  job.put("specialMark", URLEncoder.encode(getTagValue("specialMark", eElement), "utf-8")); //특징
	             //  job.put("weight", URLEncoder.encode(getTagValue("weight", eElement), "utf-8")); // 무게
	               // JSONArray에 JSONObject 담기
	               
	               logger.info("desertionNo : "+ getTagValue("desertionNo", eElement));
	               
	               jarr.add(job);

	               
	               /* System.out.println("소재지번주소  : " + getTagValue("jibunAddr", eElement));
	                * System.out.println("관리기관명  : " + getTagValue("orgNm", eElement));
	                */

	               /* System.out.println("평일운영종료시각  : " + getTagValue("weekOprEtime", eElement));
	                * System.out.println("평일운영시작시각 :" + getTagValue("weekOprStime", eElement));
	                */

	            } // for end
	         } // if end

	         /*
	          * page += 1; if (page > 10) { break; } } // while end
	          */
	      } catch (Exception e) {
	         e.printStackTrace();
	      } // try~catch end
	      
	      

	      model.addAttribute("pageVO", pageVo);
	      
	      
	      sendJSON.put("list", jarr);

	      return sendJSON.toJSONString();
	   } // main end

	private static String getTagValueDetail(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag);
		System.out.println("nlList1" + nlList.getLength());
		Node nValue = (Node) nlList.item(0);
		System.out.println("nValue" + nValue.getNodeValue());
//		      if (nValue == null)
//		         return null;
		return nValue.getNodeValue();
	}

	
}
