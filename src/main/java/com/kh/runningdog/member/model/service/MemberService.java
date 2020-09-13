package com.kh.runningdog.member.model.service;

import java.util.ArrayList;

import com.kh.runningdog.member.model.vo.Member;

public interface MemberService {
	ArrayList<Member> selectList();
	Member selectMember(String Member);
	Member selectLogin(Member member);
	int insertMember(Member member);
	int updateMember(Member member);
	Member selectUserIdCheck(Member member);
	Member selectNicknameCheck(Member member);
	Member selectPhoneCheck(Member member);
	Member selectUserIdPhoneCheck(Member member);
	Member selectUserPwdCheck(Member member);
	int updateMemberPwd(Member member);
	int updatemyinfo(Member member);
	int insertLeaveMember(Member member);
	int deleteMember(String userId);


}
