package com.kh.runningdog.chatting.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.chatting.model.vo.Chatroom;

@Repository("chatroomDao")
public class ChatroomDao {
	@Autowired
	private SqlSessionTemplate session;
	public ChatroomDao() {}
	public ArrayList<Chatroom> selectMyChatMember(Chatroom room) {
		List<Chatroom> list = session.selectList("chatroomMapper.selectMyChatMember", room);
		return (ArrayList<Chatroom>)list;
	}
	public int selectMyChatCount(Chatroom room) {
		return session.selectOne("chatroomMapper.selectMyChatCount", room);
	}
}
