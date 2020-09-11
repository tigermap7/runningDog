package com.kh.runningdog.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.member.model.vo.Member;

@Repository("MemberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public MemberDao() {}


	public ArrayList<Member> selectList() {
		List<Member> list = session.selectList("memberMapper.selectList");
		return (ArrayList<Member>)list;
	}
	
	public Member selectMember(String userId) {
		return session.selectOne("memberMapper.selectMember", userId);
	}
	
	public Member selectLogin(Member member) {
		return session.selectOne("memberMapper.selectLogin", member);
	}
	
	public Member selectUserIdCheck(Member member) {
		return session.selectOne("memberMapper.selectUserIdCheck", member);
	}
	
	public Member selectNicknameCheck(Member member) {
		return session.selectOne("memberMapper.selectNicknameCheck", member);
	}
	
	public Member selectPhoneCheck(Member member) {
		return session.selectOne("memberMapper.selectPhoneCheck", member);
	}
	
	public int insertMember(Member member) {
		return session.insert("memberMapper.insertMember", member);
	}
	
	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	public int deleteMember(String userId) {
		return session.delete("memberMapper.deleteMember", userId);
	}


	public ArrayList<Member> selectNicknameCheckList(Member member) {
		List<Member> list = session.selectList("memberMapper.selectNicknameCheckList", member);
		return (ArrayList<Member>)list;
	}


	public int selectNicknameCount(Member member) {
		return session.selectOne("memberMapper.selectNicknameCount", member);
	}

}
