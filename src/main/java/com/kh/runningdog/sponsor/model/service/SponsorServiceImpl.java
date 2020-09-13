package com.kh.runningdog.sponsor.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.sponsor.model.dao.SponsorDao;
import com.kh.runningdog.sponsor.model.vo.Sponsor;

@Service("sponsorService")
public class SponsorServiceImpl implements SponsorService{
	
	@Autowired
	private SponsorDao sponsorDao;

	@Override
	public int insertSponsor(Sponsor sponsor) {
		return sponsorDao.insertSponsor(sponsor);
	}

	@Override
	public int selectListCount() {
		return sponsorDao.selectListCount();
	}

	@Override
	public ArrayList<Sponsor> selectList(int currentPage, int countList) {
		return sponsorDao.selectList(currentPage, countList);
	}

	@Override
	public Sponsor selectOne(int sNum) {
		return sponsorDao.selectOne(sNum);
	}

	@Override
	public int selectSNum() {
		return sponsorDao.selectSNum();
	}

	@Override
	public void insertSContentImage(ArrayList<String> clist, int sNum) {
		sponsorDao.insertSContentImage(clist, sNum);
		
	}

	@Override
	public ArrayList<String> selectImageList() {
		return sponsorDao.selectImageList();
	}

	@Override
	public ArrayList<String> selectThumb(String[] checkRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<String> selectImageList(String[] checkRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteSponsor(String[] checkRow) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
