package com.kh.runningdog.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.chatting.model.vo.Message;

@Repository("messageDao")
public class MessageDao {
	@Autowired
	private SqlSessionTemplate session;
	public MessageDao() {}
	
	public int insertChatLog(Message saveMessage) {
		return session.insert("messageMapper.insertChatLog", saveMessage);
	}

}
