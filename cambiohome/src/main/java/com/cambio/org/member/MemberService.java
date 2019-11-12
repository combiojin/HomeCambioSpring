package com.cambio.org.member;

import java.util.List;

import com.cambio.org.member.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO dto);
	public MemberDTO vieMember(String member_id);
	public void deleteMember(String member_id);
	public void updateMember(MemberDTO dto);
	public boolean checklogin(String member_id, String member_pw);
}
