package com.kh.runningdog.chatting.model.service;

import java.util.ArrayList;

import com.kh.runningdog.chatting.model.vo.Chatroom;

public interface ChatroomService {

	ArrayList<Chatroom> selectMyChatMember(Chatroom room);
	int selectMyChatCount(Chatroom room);
	ArrayList<Chatroom> selectMyChatList(Chatroom room);
}
