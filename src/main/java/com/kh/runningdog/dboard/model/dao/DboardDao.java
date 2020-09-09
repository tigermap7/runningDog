package com.kh.runningdog.dboard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.dboard.model.vo.Dboard;

@Repository("dboardDao")
public class DboardDao {
	public DboardDao (){}
	
	@Autowired
	private SqlSessionTemplate session;
	

	public ArrayList<Dboard> selectNew4() {
		List<Dboard> list = session.selectList("dboardMapper.selectNew4");
		return (ArrayList<Dboard>)list;
	}


	public int insertDboard(Dboard dboard) {
		return session.insert("dboardMapper.insertDboard", dboard);
	}
}
