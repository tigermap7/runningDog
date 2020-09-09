package com.kh.runningdog.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.notice.model.dao.NoticeDao;
import com.kh.runningdog.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public ArrayList<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public Notice selectNoticeOne(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Notice> selectNoticeStateList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
