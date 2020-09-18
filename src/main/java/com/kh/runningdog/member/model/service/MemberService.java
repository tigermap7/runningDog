package com.kh.runningdog.member.model.service;

import java.util.ArrayList;

import com.kh.runningdog.member.model.vo.Member;
import com.kh.runningdog.member.model.vo.MemberPage;

public interface MemberService {
	
	//사용자
	Member selectUserIdCheck(Member member);
	Member selectNicknameCheck(Member member);
	Member selectPhoneCheck(Member member);
	ArrayList<Member> selectNicknameCheckList(Member member);
	
	Member selectMember(String Member);
	Member selectLogin(Member member);

	Member selectUserIdPhoneCheck(Member member);
	Member selectUserPwdCheck(Member member);
	
	int selectNicknameCount(Member member);
	int updateMemberPwd(Member member);
	int updatemyinfo(Member member);
	int deleteMember(String userId);
	
	//공용
	int insertMember(Member member);
	int updateMember(Member member);
	int insertLeaveMember(Member member);
	
	
	//관리자
	ArrayList<Member> selectMemberList(MemberPage memberPage);
	int selectMemberCount(MemberPage memberSerch);
	Member selectUserOne(int uniqueNum);
	int adminInsertMember(Member member);
	int adminUpdateMember(Member member);
	int adminDeleteMember(Member selectUser);
	

}
