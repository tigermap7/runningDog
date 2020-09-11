package com.kh.runningdog.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.chatting.model.dao.ChatroomDao;

@Service("chatroomService")
public class ChatroomServiceImpl implements ChatroomService{
	@Autowired
	private ChatroomDao chatroomDao;

}
