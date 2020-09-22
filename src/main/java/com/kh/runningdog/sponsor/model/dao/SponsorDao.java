package com.kh.runningdog.sponsor.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.sponsor.model.vo.Sponsor;
import com.kh.runningdog.sponsor.model.vo.SponsorImage;
import com.kh.runningdog.sponsor.model.vo.SponsorList;
import com.kh.runningdog.sponsor.model.vo.SponsorPage;

@Repository("sponsorDao")
public class SponsorDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public SponsorDao() {}
	
	public int insertSponsor(Sponsor sponsor) {
		return session.insert("sponsorMapper.insertSponsor", sponsor);
	}

	public int selectListCount() {
		return session.selectOne("sponsorMapper.selectListCount");
	}

	public ArrayList<Sponsor> selectList(int currentPage, int countList) {
		int startRow = (currentPage - 1) * countList + 1;
		int endRow = startRow + countList - 1;
		
		SponsorPage sPage = new SponsorPage(startRow, endRow);
		
		List<Sponsor> list = session.selectList("sponsorMapper.selectList", sPage);
		return (ArrayList<Sponsor>)list;
	}

	public Sponsor selectOne(int sNum) {
		return session.selectOne("sponsorMapper.selectOne", sNum);
	}

	public int selectSNum() {
		return session.selectOne("sponsorMapper.selectSNum");
	}

	public int insertSContentImage(ArrayList<String> clist, int sNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("clist", clist);
		map.put("sNum", sNum);
		return session.insert("sponsorImageMapper.insertSCImage", map);
	}

	public ArrayList<SponsorImage> selectImageList() {
		List<SponsorImage> list = session.selectList("sponsorImageMapper.selectImageList");
		return (ArrayList<SponsorImage>)list;
	}

	public ArrayList<Sponsor> selectThumb(String[] checkRow) {
		List<Sponsor> list = session.selectList("sponsorMapper.selectThumb", checkRow);
		return (ArrayList<Sponsor>)list;
	}

	public ArrayList<SponsorImage> selectImageList(String[] checkRow) {
		List<SponsorImage> list = session.selectList("sponsorImageMapper.selectImageListNum", checkRow);
		return (ArrayList<SponsorImage>)list;
	}

	public int deleteSponsor(String[] checkRow) {
		return session.delete("sponsorMapper.deleteSponsor", checkRow);
	}

	public ArrayList<Sponsor> selectSearch(HashMap<String, String> key) {
		List<Sponsor> list = session.selectList("sponsorMapper.selectSearch", key);
		return (ArrayList<Sponsor>) list;
	}

	public int updateSponsor(Sponsor sponsor) {
		return session.update("sponsorMapper.updateSponsor", sponsor);
	}

	public int deleteSponsorImage(ArrayList<String> mlist, int sNum) {
		HashMap<String, Object> key = new HashMap<>();
		key.put("mlist", mlist);
		key.put("snum", sNum);
		return session.delete("sponsorImageMapper.deleteSponsorImage", key);
	}

	public int insertSponsorList(SponsorList slist) {
		return session.insert("sponsorMapper.insertSponsorList", slist);
	}

	public int updateSponsorCash(Sponsor sponsor) {
		return session.update("sponsorMapper.updateSponsorCash", sponsor);
	}

	public SponsorList selectSponsorListOne(String date) {
		return session.selectOne("sponsorMapper.selectSponsorListOne", date);
	}
	
	
	
	
}
