package com.cambio.org.member;

import java.util.List;

import com.cambio.common.Search;
import com.cambio.org.board.BoardDTO;
import com.cambio.org.member.MemberDTO;

public interface MemberDAO {

	//회원목록
//	public List<MemberDTO> memberList();
	public List<MemberDTO> memberList(Search search) throws Exception;
	
	public int memberListCnt(Search search) throws Exception;
	//회원가입
	public void insertMember(MemberDTO dto);
	//회원정보보기
	public MemberDTO viewMember(String member_id);
	//회원삭제
	public void deleteMember(MemberDTO dto);
	//회원정보수정
	public void updateMember(MemberDTO dto);
	//로그인
	public MemberDTO memberLogin(MemberDTO dto);
	//로그인체크
	public boolean checkpw(String member_id, String member_pw);
	//관리자계정 회원정보수정
	public MemberDTO updateAdmin(MemberDTO dto);
	//순번셀렉
	public MemberDTO memberSelect(int member_idx);
	//관리자삭제
	public void deleteMember(String idxs);
}