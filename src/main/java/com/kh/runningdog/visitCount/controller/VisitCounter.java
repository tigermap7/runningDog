package com.kh.runningdog.visitCount.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.runningdog.visitCount.model.dao.VisitCountDao;
import com.kh.runningdog.visitCount.model.vo.VisitCount;

public class VisitCounter implements HttpSessionListener {
	@Override
    public void sessionCreated(HttpSessionEvent arg0){
        HttpSession session = arg0.getSession();
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        //등록되어있는 빈을 사용할수 있도록 설정해준다
        HttpServletRequest req = ((SerevletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        VisitCountDao visitCountDao = (VisitCountDao)wac.getBean("visitCountDao");
        VisitCount visitCountVo = new VisitCount();
        visitCountVo.setVisitIp(req.getRemoteAddr());
        visitCountVo.setVisitAgent(req.getHeader("User-Agent"));//브라우저 정보
        visitCountVo.setVisitRefer(req.getHeader("referer"));//접속 전 사이트 정보
        visitCountDao.insertVisitor(visitCountVo);
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent arg0){
        //TODO Auto-generated method stub
    }
}