package com.kh.runningdog.dreply.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.dreply.model.vo.Dreply;

@Repository("dreplyDao")
public class DreplyDao {
	public DreplyDao() {}

	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertDreply(Map<String, Object> dreply) {
		return session.insert("dreplyMapper.insertDreply",dreply);
	}

	public int deleteDreply(Map<String, Object> dreply) {
		return session.delete("dreplyMapper.deleteDreply",dreply);
	}

	public int updateReply(Map<String, Object> dreply) {
		return session.update("dreplyMapper.updateDreply",dreply);
	}

	public List<Dreply> selectDreplyList(Map<String, Object> dreply) {
		return session.selectList("dreplyMapper.selectDreplyList",dreply);
	}

	public int selectDreCount(Map<String, Object> dreply) {
		return session.selectOne("dreplyMapper.selectDreCount",dreply);
	}
	
	
}
