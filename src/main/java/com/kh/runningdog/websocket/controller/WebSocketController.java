package com.kh.runningdog.websocket.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebSocketController {
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("mypage/myChattingView");
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mv.addObject("userid", user.getUsername());
		return mv;
	}
}
