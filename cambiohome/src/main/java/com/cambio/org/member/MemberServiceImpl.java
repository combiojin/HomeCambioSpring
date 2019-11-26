package com.cambio.org.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cambio.common.Search;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
//	@Override
//	public List<MemberDTO> memberList(){
//		return memberDao.memberList();
//	}
	@Override
	public List<MemberDTO> memberList(Search search) throws Exception{
		return memberDao.memberList(search);
	}
	@Override
	public int memberListCnt(Search search) throws Exception{
		return memberDao.memberListCnt(search);
	}
	
	public int checkOverId(String member_id) throws Exception {
		return memberDao.checkOverId(member_id);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
	}
	@Override
	public MemberDTO viewMember(String member_id) {
		return memberDao.viewMember(member_id);
	}
	@Override
	public void deleteMember(MemberDTO dto) {
		memberDao.deleteMember(dto);
	}
	@Override
	public void updateMember(MemberDTO dto){
		memberDao.updateMember(dto);
	}
	@Override
	public MemberDTO memberLogin(MemberDTO dto) {
		 return memberDao.memberLogin(dto);
	}
	@Override
	public boolean checkpw(String member_id, String member_pw) {
		return memberDao.checkpw(member_id, member_pw);
	}
	@Override
	public MemberDTO updateAdmin(MemberDTO dto) {
		return memberDao.updateAdmin(dto);
	}
	@Override
	public MemberDTO memberSelect(int member_idx) {
		return memberDao.memberSelect(member_idx);
	}
	@Override
	public void deleteMember(String idxs) {
		memberDao.deleteMember(idxs);
	}
	
	
}
