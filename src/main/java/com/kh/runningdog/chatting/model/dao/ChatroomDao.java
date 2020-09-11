package com.kh.runningdog.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatroomDao")
public class ChatroomDao {
	@Autowired
	private SqlSessionTemplate session;
	public ChatroomDao() {}
}
