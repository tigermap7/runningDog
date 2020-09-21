package com.kh.runningdog.animalInfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.runningdog.dboard.controller.DboardController;

@Controller
public class AnimalInfoController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(DboardController.class);
	
	
	@RequestMapping("alistPage.do")
	public String moveAlistPage() {
		return "animal/animalList";
	}
	
}
