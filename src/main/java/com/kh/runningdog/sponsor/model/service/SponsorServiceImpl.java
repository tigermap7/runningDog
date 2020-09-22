package com.kh.runningdog.sponsor.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.sponsor.model.dao.SponsorDao;
import com.kh.runningdog.sponsor.model.vo.Sponsor;
import com.kh.runningdog.sponsor.model.vo.SponsorImage;
import com.kh.runningdog.sponsor.model.vo.SponsorList;

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
	public int insertSContentImage(ArrayList<String> clist, int sNum) {
		return sponsorDao.insertSContentImage(clist, sNum);
	}

	@Override
	public ArrayList<SponsorImage> selectImageList() {
		return sponsorDao.selectImageList();
	}

	@Override
	public ArrayList<Sponsor> selectThumb(String[] checkRow) {
		return sponsorDao.selectThumb(checkRow);
	}

	@Override
	public ArrayList<SponsorImage> selectImageList(String[] checkRow) {
		return sponsorDao.selectImageList(checkRow);
	}

	@Override
	public int deleteSponsor(String[] checkRow) {
		return sponsorDao.deleteSponsor(checkRow);
	}

	@Override
	public ArrayList<Sponsor> selectSearch(HashMap<String, String> key) {
		return sponsorDao.selectSearch(key);
	}

	@Override
	public int updateSponsor(Sponsor sponsor) {
		return sponsorDao.updateSponsor(sponsor);
	}

	@Override
	public int deleteSponsorImage(ArrayList<String> mlist, int sNum) {
		return sponsorDao.deleteSponsorImage(mlist, sNum);
	}

	@Override
	public int insertSponsorList(SponsorList slist) {
		return sponsorDao.insertSponsorList(slist);
	}

	@Override
	public int updateSponsorCash(Sponsor sponsor) {
		return sponsorDao.updateSponsorCash(sponsor);
	}

	@Override
	public SponsorList selectSponsorListOne(String date) {
		return sponsorDao.selectSponsorListOne(date);
	}
	
	
}
