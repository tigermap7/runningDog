package com.kh.runningdog.dreply.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.dreply.model.dao.DreplyDao;
import com.kh.runningdog.dreply.model.vo.Dreply;

@Service("dreplyService")
public class DreplyServiceImpl implements DreplyService {

	@Autowired
	private DreplyDao dreplyDao;
	
	@Override
	public int insertDreply(Map<String, Object> dreply) {
		return dreplyDao.insertDreply(dreply);
	}

	@Override
	public int deleteDreply(Map<String, Object> dreply) {
		return dreplyDao.deleteDreply(dreply);
	}

	@Override
	public int updateReply(Map<String, Object> dreply) {
		return dreplyDao.updateReply(dreply);
	}


	@Override
	public List<Dreply> selectDreplyList(Map<String, Object> dreply) {
		return dreplyDao.selectDreplyList(dreply);
	}

	@Override
	public int selectDreCount(Map<String, Object> dreply) {
		return dreplyDao.selectDreCount(dreply);
	}

}
