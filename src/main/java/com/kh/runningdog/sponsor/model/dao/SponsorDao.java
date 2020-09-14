package com.kh.runningdog.sponsor.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.sponsor.model.vo.ContentImage;
import com.kh.runningdog.sponsor.model.vo.Sponsor;
import com.kh.runningdog.sponsor.model.vo.SponsorImage;
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

	public void insertSContentImage(ArrayList<String> clist, int sNum) {
		ContentImage ct = new ContentImage();
		ct.setsNum(sNum);
		for(String s : clist) {
			ct.setFileName(s);
			session.insert("sponsorImageMapper.insertSCImage", ct);
		}
	}

	public ArrayList<String> selectImageList() {
		List<String> list = session.selectList("sponsorImageMapper.selectImageList");
		return (ArrayList<String>)list;
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
	
	
	
	
}
