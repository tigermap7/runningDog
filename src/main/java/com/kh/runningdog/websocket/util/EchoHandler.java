package com.kh.runningdog.websocket.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.runningdog.chatting.model.vo.Chatroom;
import com.kh.runningdog.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private JSONParser parser = new JSONParser();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.put(Integer.toString(getHttpSessionMember(session).getUniqueNum()), session);
//		sessionList.add(session);
		logger.info("{} 연결됨", getHttpSessionMember(session).getNickname());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", getHttpSessionMember(session).getNickname(), message.getPayload());
		JSONObject receivedMessageObj = (JSONObject) parser.parse(message.getPayload());

//		for (WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage(
//					getHttpSessionValue(session).getNickname()/* session.getPrincipal().getName() */ + "|" + message.getPayload()));
//		}
		Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId = "";
        
        String receivedMessageType = (String) receivedMessageObj.get("type");
        int roomno = ((Long) ((JSONObject) receivedMessageObj.get("data")).get("roomno")).intValue();
        logger.info(Integer.toString(roomno));
        logger.info(receivedMessageType);
        switch (receivedMessageType) {
		case "message":
	        JSONObject sendMessageObj = new JSONObject();
	        sendMessageObj.put("type", "message");
	        JSONObject sendMessageObjData = new JSONObject();
	        // TODO: sessionId, no 이름 변경, myChattingView.jsp에도 적용할 것
	        sendMessageObjData.put("nickname", getHttpSessionMember(session).getNickname());
	        sendMessageObjData.put("message", ((JSONObject) receivedMessageObj.get("data")).get("message"));
	        sendMessageObjData.put("roomno", ((JSONObject) receivedMessageObj.get("data")).get("roomno"));
	        sendMessageObj.put("data", sendMessageObjData);
	        String sendMessage = sendMessageObj.toJSONString();
	        while (sessionIds.hasNext()) {
	            sessionId = sessionIds.next();
	            // TODO: 채팅방에 있는 클라이언트에게만 전송
	            boolean userIsInChat = true;
	            for (Chatroom room : getHttpSessionList(session)) {
	            	if (room.getRoomNo() == roomno) {
	            		sessions.get(sessionId).sendMessage(new TextMessage(sendMessage));
	            	}
				}
	        }
			break;

		default:
			break;
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		sessionList.remove(session);
		sessions.remove(Integer.toString(getHttpSessionMember(session).getUniqueNum()));
		logger.info("{} 연결 끊김", getHttpSessionMember(session).getNickname());
	}

	public Member getHttpSessionMember(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		Member member = (Member)map.get("loginMember");
		return member;
	}
	
	public ArrayList<Chatroom> getHttpSessionList(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		@SuppressWarnings("unchecked")
		ArrayList<Chatroom> list = (ArrayList<Chatroom>) map.get("myChatList");
		return list;
	}
}
