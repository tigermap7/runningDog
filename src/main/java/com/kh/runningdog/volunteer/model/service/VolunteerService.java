package com.kh.runningdog.volunteer.model.service;

import java.util.ArrayList;

import com.kh.runningdog.volunteer.model.vo.Volunteer;

public interface VolunteerService {
	int getListCount();
	ArrayList<Volunteer> selectList(int currentPage, int limit);
	Volunteer selectVolunteer(int volno);
	int insertVolunteer(Volunteer volunteer);
	int updateVolunteer(Volunteer volunteer);
	int deleteVolunteer(Volunteer volunteer);
}
