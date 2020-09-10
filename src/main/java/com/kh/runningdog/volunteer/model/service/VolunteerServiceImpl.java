package com.kh.runningdog.volunteer.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.volunteer.model.dao.VolunteerDao;
import com.kh.runningdog.volunteer.model.vo.Volunteer;

@Service("volunteerService")
public class VolunteerServiceImpl implements VolunteerService{
	@Autowired
	private VolunteerDao volunteerDao;

	@Override
	public int getListCount() {
		return volunteerDao.getListCount();
	}

	@Override
	public ArrayList<Volunteer> selectList(int currentPage, int limit) {
		return volunteerDao.selectList(currentPage, limit);
	}

	@Override
	public Volunteer selectVolunteer(int volno) {
		return volunteerDao.selectVolunteer(volno);
	}

	@Override
	public int insertVolunteer(Volunteer volunteer) {
		return volunteerDao.insertVolunteer(volunteer);
	}

	@Override
	public int updateVolunteer(Volunteer volunteer) {
		return volunteerDao.updateVolunteer(volunteer);
	}

	@Override
	public int deleteVolunteer(Volunteer volunteer) {
		return volunteerDao.deleteVolunteer(volunteer);
	}
	
	

}
