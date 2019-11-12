package com.cambio.org.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public List<MemberDTO> memberList(){
		return memberDao.memberList();
	}
	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}
	@Override
	public MemberDTO vieMember(String member_id) {
		return memberDao.vieMember(member_id);
	}
	@Override
	public void deleteMember(String member_id) {
		memberDao.deleteMember(member_id);
	}
	@Override
	public void updateMember(MemberDTO dto){
		memberDao.updateMember(dto);
	}
	@Override
	public boolean checklogin(String member_id, String member_pw) {
		return memberDao.checklogin(member_id, member_pw);
	}
}
