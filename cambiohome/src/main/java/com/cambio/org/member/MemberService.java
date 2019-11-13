package com.cambio.org.member;

import java.util.List;

import com.cambio.org.member.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO dto);
	public MemberDTO viewMember(String member_id);
	public void deleteMember(MemberDTO dto);
	public void updateMember(MemberDTO dto);
	public MemberDTO memberLogin(MemberDTO dto);
	public boolean checkpw(String member_id, String member_pw);
	public MemberDTO updateAdmin(MemberDTO dto);
	public MemberDTO memberSelect(int member_idx);
}
