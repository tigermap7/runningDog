package com.kh.runningdog.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.runningdog.member.model.dao.MemberDao;
import com.kh.runningdog.member.model.vo.Member;
import com.kh.runningdog.member.model.vo.MemberPage;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	
	//사용자
	@Override
	public Member selectMember(String userId) {
		return memberDao.selectMember(userId);
	}
	
	@Override
	public Member selectLogin(Member member) {
		return memberDao.selectLogin(member);
	}
	
	@Override
	public Member selectUserIdCheck(Member member) {
		return memberDao.selectUserIdCheck(member);
	}
	
	@Override
	public Member selectNicknameCheck(Member member) {
		return memberDao.selectNicknameCheck(member);
	}
	
	@Override
	public Member selectPhoneCheck(Member member) {
		return memberDao.selectPhoneCheck(member);
	}

	@Override
	public Member selectUserIdPhoneCheck(Member member) {
		return memberDao.selectUserIdPhoneCheck(member);
	}

	@Override
	public Member selectUserPwdCheck(Member member) {
		return memberDao.selectUserPwdCheck(member);
	}
	
	@Override
	public int updateMemberPwd(Member member) {
		return memberDao.updateMemberPwd(member);
	}
	
	@Override
	public int updatemyinfo(Member member) {
		return memberDao.updatemyinfo(member);
	}
	
	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	
	
	
	//공용
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}
	
	@Override
	public int insertLeaveMember(Member member) {
		return memberDao.insertLeaveMember(member);
	}
	
	
	
	
	//관리자
	@Override
	public ArrayList<Member> selectMemberList(MemberPage memberPage) {
		return memberDao.selectMemberList(memberPage);
	}
	
	@Override
	public int selectMemberCount(MemberPage memberSerch) {
		return memberDao.selectMemberCount(memberSerch);
	}
	
	@Override
	public Member selectUserOne(int uniqueNum) {
		return memberDao.selectUserOne(uniqueNum);
	}
	
	@Override
	public int adminInsertMember(Member member) {
		return memberDao.adminInsertMember(member);
	}
	
	@Override
	public int adminUpdateMember(Member member) {
		return memberDao.adminUpdateMember(member);
	}
	
	@Override
	public int adminDeleteMember(Member selectUser) {
		return memberDao.adminDeleteMember(selectUser);
	}

	
	
	
	
	// 채팅에서 유저검색
	@Override
	public ArrayList<Member> selectNicknameCheckList(Member member) {
		return memberDao.selectNicknameCheckList(member);
	}

	@Override
	public int selectNicknameCount(Member member) {
		return memberDao.selectNicknameCount(member);
	}



}
