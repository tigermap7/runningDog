package com.kh.runningdog.dboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runningdog.dboard.model.service.DboardService;

@Controller
public class DboardController {
	private static final Logger logger = LoggerFactory.getLogger(DboardController.class);
	
	@Autowired
	private DboardService dboardService;
	
	@RequestMapping("dlistPage.do")
	public String moveDlistPage() {
		return "animal/animalList";
	}
}
