package com.kh.runningdog.protect.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.runningdog.volunteer.model.vo.Volunteer;

@Controller
public class ProtectController {

	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		System.out.println("nlList"+nlList);
		Node nValue = (Node) nlList.item(0);
		System.out.println("nValue"+nValue);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	//리스트페이징처리
	@RequestMapping("movePlist.do")
	public ModelAndView movePlist(HttpServletRequest request, ModelAndView mv) {
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		// 한페이지당 출력할 목록 갯수 지정
		int limit = 10;
		// 전체 목록 갯수 조회
		int listCount = 100;
		int countPage = 5;

		// 뷰에 출력될 총 페이지 수 계산 : 게시글이 1개이면 1페이지임
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 그룹의 시작 페이지 수 지정
		// 예 : currentPage 가 35이면 페이지그룹이 10일 때 시작페이지는 31이 됨
		int startPage = (((int) ((double) currentPage / countPage + 0.9)) - 1) * countPage + 1;
		int endPage = startPage + countPage - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		// 뷰 지정해서 내보내기
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCount", listCount);

		mv.setViewName("protect/protectList");

		return mv;
	}

	//리스트출력
	@ResponseBody
	@RequestMapping(value = "plist.do")
	public String main(String[] args, HttpServletResponse response, HttpServletRequest request) throws IOException {
		//int page = 1; // 페이지 초기값

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println("currentPage" + currentPage);

		// 보낼 JSONObject 객체 생성
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();

		try {
			/* while (true) { */
			// parsing할 url 지정(API 키 포함해서)
			String url = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/shelterInfo?"
					+ "serviceKey=YgF%2FE21cBZu1OA4fg6TwWCjymj%2Fl%2Bku%2BnH8%2F0U7KpmsgWw%2B%2BY687zdy%2FxpbgbaNaLpxQMUIkmOodkAa1Q%2BRZgw%3D%3D&care_reg_no=&care_nm=&pageNo="
					+ currentPage;
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
					job.put("careAddr", URLEncoder.encode(getTagValue("careAddr", eElement), "utf-8")); // 도로명 주소 :
					job.put("careNm", URLEncoder.encode(getTagValue("careNm", eElement), "utf-8")); // 센터이름 :
					job.put("careTel", getTagValue("careTel", eElement)); // 전화번호 :
					job.put("divisionNm", URLEncoder.encode(getTagValue("divisionNm", eElement), "utf-8")); // 동물보호센터유형
					job.put("jibunAddr", URLEncoder.encode(getTagValue("jibunAddr", eElement), "utf-8")); // 소재지번주소 :
					job.put("orgNm", URLEncoder.encode(getTagValue("orgNm", eElement), "utf-8")); // 관리기관명 :
					// JSONArray에 JSONObject 담기
					jarr.add(job);

					/* System.out.println("소재지번주소  : " + getTagValue("jibunAddr", eElement));
					 * System.out.println("위도 :" + getTagValue("lat", eElement));
					 * System.out.println("경도 :" + getTagValue("lng", eElement));
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

		sendJSON.put("list", jarr);

		return sendJSON.toJSONString();
	} // main end
	
	//뷰페이지로 이동 처리용 메소드 ------------
	@RequestMapping("movePdetail.do")
	public String movePdetail(HttpServletRequest request) {
		String careNm =  request.getParameter("careNm");

		System.out.println("careNm" + careNm);
		request.setAttribute("careNm", careNm);

		return "protect/protectView";
	}

	private static String getTagValueDetail(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag);
		System.out.println("nlList1"+nlList.getLength());
		Node nValue =(Node) nlList.item(0);
		System.out.println("nValue"+nValue.getNodeValue());
//		if (nValue == null)
//			return null;
		return nValue.getNodeValue();
	}

	// 상세보기
	@ResponseBody
	@RequestMapping(value = "pdetail.do")
	public String SelectProtect(String[] args, HttpServletResponse response, HttpServletRequest request) throws IOException {

		String careNm = request.getParameter("careNm");
		System.out.println("careNm"+careNm);
		
		// 보낼 JSONObject 객체 생성
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();

		try {
			String url = "http://openapi.animal.go.kr/openapi/service/rest/animalShelterSrvc/shelterInfo?"
					+ "serviceKey=YgF%2FE21cBZu1OA4fg6TwWCjymj%2Fl%2Bku%2BnH8%2F0U7KpmsgWw%2B%2BY687zdy%2FxpbgbaNaLpxQMUIkmOodkAa1Q%2BRZgw%3D%3D&care_reg_no=&care_nm="+careNm;
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			System.out.println("doc" +doc);

			// root tag
			doc.getDocumentElement().normalize();
			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			Node nNode = doc.getElementsByTagName("items").item(0);
			System.out.println("파싱할 리스트 수 : "+nNode);

				//Node nNode = nList.item(0);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					// JSONArray에 담을 JSONOBject 객체 생성
					JSONObject job = new JSONObject();
					// JSONObject에 값 담기
					// job.put("값이름", 값); ==> 값은 무조건 스트링이어야함
					job.put("careAddr", URLEncoder.encode(getTagValueDetail("careAddr", eElement), "utf-8")); // 도로명 주소 :
					job.put("careNm", URLEncoder.encode(getTagValueDetail("careNm", eElement), "utf-8")); // 보호센터이름 :
					job.put("careTel", getTagValueDetail("careTel", eElement)); // 전화번호 :
					job.put("divisionNm", URLEncoder.encode(getTagValueDetail("divisionNm", eElement), "utf-8")); // 동물보호센터유형
																											// :
					job.put("jibunAddr", URLEncoder.encode(getTagValueDetail("jibunAddr", eElement), "utf-8")); // 소재지번주소 :
					job.put("orgNm", URLEncoder.encode(getTagValueDetail("orgNm", eElement), "utf-8")); // 관할구역 :
					//job.put("weekOprStime", getTagValue("weekOprStime", eElement)); // 주중운영시작시간 :
					//job.put("weekOprEtime", getTagValue("weekOprEtime", eElement)); // 주중운영종료시간 :
					// JSONArray에 JSONObject 담기
					jarr.add(job);

					/*
					 * System.out.println("######################");
					 * System.out.println(eElement.getTextContent());
					 * 
					 * System.out.println("소재지번주소  : " + getTagValue("jibunAddr", eElement));
					 * System.out.println("위도 :" + getTagValue("lat", eElement));
					 * System.out.println("경도 :" + getTagValue("lng", eElement));
					 * System.out.println("관리기관명  : " + getTagValue("orgNm", eElement));
					 */

				//} // for end
			} // if end

		} catch (Exception e) {
			e.printStackTrace();
		} // try~catch end

		sendJSON.put("list", jarr);

		return sendJSON.toJSONString();
		
	} // main end
	
}// class end
