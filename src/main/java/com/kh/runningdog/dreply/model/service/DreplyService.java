package com.kh.runningdog.dreply.model.service;

import java.util.List;
import java.util.Map;

import com.kh.runningdog.dreply.model.vo.Dreply;

public interface DreplyService {

	int insertDreply(Map<String, Object> dreply);

	int deleteDreply(Map<String, Object> dreply);

	int updateReply(Map<String, Object> dreply);

	int selectDreCount(Map<String, Object> dreply);

	List<Dreply> selectDreplyList(Map<String, Object> dreply);

}
