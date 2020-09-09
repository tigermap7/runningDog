package com.kh.runningdog.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public NoticeDao() {
	}

	public ArrayList<Notice> selectNoticeList(){
		List<Notice> list = session.selectList("noticeMapper.selectList");
		return (ArrayList<Notice>)list;
	}

}
