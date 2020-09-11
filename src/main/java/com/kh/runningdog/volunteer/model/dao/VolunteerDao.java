package com.kh.runningdog.volunteer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.volunteer.model.vo.Volunteer;
import com.kh.runningdog.volunteer.model.vo.VolunteerPage;
import com.kh.runningdog.volunteer.model.vo.Vreply;

@Repository("volunteerDao")
public class VolunteerDao {
	@Autowired
	private SqlSessionTemplate session;
	public VolunteerDao() {}
	
	public int getListCount() {
		return session.selectOne("volunteerMapper.getListCount");
	}
	
	public ArrayList<Volunteer> selectList (int currentPage, int limit){
		int startRow = (currentPage -1)* limit +1;
		int endRow = startRow + limit -1;
		
		VolunteerPage vpage = new VolunteerPage(startRow, endRow);
		
		List<Volunteer> list = session.selectList("volunteerMapper.selectList", vpage);
		return (ArrayList<Volunteer>)list;
	}
	
	public Volunteer selectVolunteer(int volno) {
		return session.selectOne("volunteerMapper.selectVolunteer", volno);
	}
	
	public int insertVolunteer( Volunteer volunteer) {
		return session.insert("volunteerMapper.insertVolunteer", volunteer);
	}
	
	public int updateVolunteer( Volunteer volunteer) {
		return session.update("volunteerMapper.updateVolunteer", volunteer);
	}
	
	public int deleteVolunteer( Volunteer volunteer) {
		return session.delete("volunteerMapper.deleteVolunteer", volunteer);
	}
	public ArrayList<Vreply> selectVreplyList(int volno){
		return session.selectOne("vreplyMapper.selectVreply", volno );
	}
	public int insertVreply(Vreply vreply) {
		return session.insert("vreplyMapper.insertVreply", vreply);
	}
	public int updateVreply(Vreply vreply) {
		return session.update("vreplyMapper.updateVreply", vreply);
	}
	public int deleteVreply(Vreply vreply) {
		return session.delete("vreplyMapper.deleteVreply", vreply);
	}

}
