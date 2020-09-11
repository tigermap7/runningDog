package com.kh.runningdog.dboard.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.runningdog.dboard.model.vo.Dboard;

public interface DboardService {
	ArrayList<Dboard> selectNew4();

	int insertDboard(Dboard dboard);

	int selectListCount(Dboard dboard);

	ArrayList<Dboard> selectList(Dboard dboard);
	
}
