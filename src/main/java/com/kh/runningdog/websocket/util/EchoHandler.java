package com.kh.runningdog.websocket.util;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	// private Map<String, WebSocketSession> sessions = new HashMap<String,
	// WebSocketSession>();
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// sessions.put(session.getId(), session);
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());

		logger.info("인터셉터 : " + getHttpSessionValue(session));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", getHttpSessionValue(session), message.getPayload());

		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(
					getHttpSessionValue(session)/* session.getPrincipal().getName() */ + "|" + message.getPayload()));
			String txt = "[" + getHttpSessionValue(session) + "]" + message.getPayload();
			logger.info(txt);
			String path1 = System.getProperty("user.home") + "/Desktop/chatlog/";
			String path2 = System.getProperty("user.home") + "/Desktop/chatlog/tigermap/";
			String fileName = "text11.txt";
			File folder1 = new File(path1);
			File folder2 = new File(path2);
			if (!folder1.exists()) {
				folder1.mkdir();
			}
			if (!folder2.exists()) {
				folder2.mkdir();
			}
				try {
					// 파일 객체 생성
					// true 지정시 파일의 기존 내용에 이어서 작성
					File file = new File(path2 + fileName);
					FileWriter fw = new FileWriter(file, true);
					// 파일안에 문자열 쓰기
					fw.write(txt);
					fw.flush();
					// 객체 닫기
					fw.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", getHttpSessionValue(session));
	}

	public Object getHttpSessionValue(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		Object value = map.get("userid");
		return value;
	}
}
