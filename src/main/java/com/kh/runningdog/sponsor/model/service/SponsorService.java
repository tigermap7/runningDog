package com.kh.runningdog.sponsor.model.service;

import java.util.ArrayList;

import com.kh.runningdog.sponsor.model.vo.Sponsor;

public interface SponsorService {
	public abstract int insertSponsor(Sponsor sponsor);
	int selectListCount();
	ArrayList<Sponsor> selectList(int currentPage, int countList);
	public abstract Sponsor selectOne(int sNum);
	public abstract int selectSNum();
}
