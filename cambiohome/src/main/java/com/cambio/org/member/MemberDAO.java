package com.cambio.org.member;

import java.util.List;

import com.cambio.org.member.MemberDTO;

public interface MemberDAO {

	//회원목록
	public List<MemberDTO> memberList();
	//회원가입
	public void insertMember(MemberDTO dto);
	//회원정보보기
	public MemberDTO vieMember(String member_id);
	//회원삭제
	public void deleteMember(String member_id);
	//회원정보수정
	public void updateMember(MemberDTO dto);
	//로그인
	public boolean checklogin(String member_id, String member_pw);
}
