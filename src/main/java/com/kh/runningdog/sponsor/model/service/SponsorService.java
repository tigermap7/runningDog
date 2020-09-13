package com.kh.runningdog.sponsor.model.service;

import java.util.ArrayList;

import com.kh.runningdog.sponsor.model.vo.Sponsor;

public interface SponsorService {
	public abstract int insertSponsor(Sponsor sponsor);
	int selectListCount();
	ArrayList<Sponsor> selectList(int currentPage, int countList);
	public abstract Sponsor selectOne(int sNum);
	public abstract int selectSNum();
	void insertSContentImage(ArrayList<String> clist, int sNum);
	public abstract ArrayList<String> selectImageList();
	public abstract ArrayList<String> selectThumb(String[] checkRow);
	public abstract ArrayList<String> selectImageList(String[] checkRow);
	public abstract int deleteSponsor(String[] checkRow);
}
