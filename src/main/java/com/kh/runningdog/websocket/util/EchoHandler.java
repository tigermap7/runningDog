package com.kh.runningdog.websocket.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.runningdog.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.put(Integer.toString(getHttpSessionValue(session).getUniqueNum()), session);
//		sessionList.add(session);
		logger.info("{} 연결됨", getHttpSessionValue(session).getNickname());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", getHttpSessionValue(session).getNickname(), message.getPayload());

//		for (WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage(
//					getHttpSessionValue(session).getNickname()/* session.getPrincipal().getName() */ + "|" + message.getPayload()));
//		}
		Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage(getHttpSessionValue(session).getNickname() + "|" + message.getPayload()));
            
        }
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		sessionList.remove(session);
		sessions.remove(Integer.toString(getHttpSessionValue(session).getUniqueNum()));
		logger.info("{} 연결 끊김", getHttpSessionValue(session).getNickname());
	}

	public Member getHttpSessionValue(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		Member value = (Member)map.get("loginMember");
		return value;
	}
}
