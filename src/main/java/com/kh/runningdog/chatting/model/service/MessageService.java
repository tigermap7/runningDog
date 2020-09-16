package com.kh.runningdog.chatting.model.service;

import com.kh.runningdog.chatting.model.vo.Message;

public interface MessageService {
	int insertChatLog(Message saveMessage);
}
