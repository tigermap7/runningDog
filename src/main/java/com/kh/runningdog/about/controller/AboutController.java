package com.kh.runningdog.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {

	//사이트소개 페이지로 이동
	@RequestMapping(value="aboutView.do")
	public String moveAboutView() {
		System.out.println("사이트소개 페이지 이동 컨트롤러");
		return "about/aboutView";
	}
}
