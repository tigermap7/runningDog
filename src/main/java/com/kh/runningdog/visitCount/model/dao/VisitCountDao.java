package com.kh.runningdog.visitCount.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.visitCount.model.vo.VisitCount;

@Repository("VisitCountDao")
public class VisitCountDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public VisitCountDao () {}
	
	public int insertVisitor(VisitCount visitCount) {
		return session.insert("visitCounterMapper.insertVisitor", visitCount);
	}

}
