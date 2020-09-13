package com.kh.runningdog.dboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.dboard.model.dao.DboardDao;
import com.kh.runningdog.dboard.model.vo.Dboard;

@Service("dboardService")
public class DboardServiceImpl implements DboardService{
	
	@Autowired
	private DboardDao dboardDao;
	
	@Override
	public ArrayList<Dboard> selectNew4(){
		return dboardDao.selectNew4();
	}
	
	@Override
	public int insertDboard(Dboard dboard) {
	    return dboardDao.insertDboard(dboard);
	}
	@Override
	public int selectListCount(Dboard dboard) {
		return dboardDao.selectListCount(dboard);
	}

	@Override
	public ArrayList<Dboard> selectList(Dboard dboard) {
		return dboardDao.selectList(dboard);
	}

	@Override
	public Dboard selectOne(int dNum) {
		return dboardDao.selectOne(dNum);
	}

	@Override
	public int updateDboard(Dboard dboard) {
		return dboardDao.updateDboard(dboard);
	}

	@Override
	public int updateDboardHide(Dboard dboard) {
		return dboardDao.updateDboardHide(dboard);
	}
}
