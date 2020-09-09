package com.kh.runningdog.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.notice.model.vo.Notice;
import com.kh.runningdog.notice.model.vo.NoticePage;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public NoticeDao() {
	}

	public ArrayList<Notice> selectNoticeList(NoticePage noticePage){
		List<Notice> list = session.selectList("noticeMapper.selectList", noticePage);
		return (ArrayList<Notice>)list;
	}
	
	public int selectNoticeListCount() {
		return session.selectOne("noticeMapper.getListCount");
	}

}
