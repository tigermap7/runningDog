package com.kh.runningdog.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.chatting.model.dao.MessageDao;
import com.kh.runningdog.chatting.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public int insertChatLog(Message saveMessage) {
		return messageDao.insertChatLog(saveMessage);
	}

}
