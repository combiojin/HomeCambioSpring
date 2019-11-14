package com.cambio.org.member;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
//@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	// 로그인
	@RequestMapping(value = "/member/login.do")
	public String login(Model model, HttpServletRequest request) {

		return "login/login";
	}

	@RequestMapping(value = "/member/loginProc.do")
	public String loginProc(MemberDTO dto, HttpServletRequest request, RedirectAttributes ra) {

		HttpSession session = request.getSession();

		MemberDTO login = memberService.memberLogin(dto);

		if (login == null) {
			session.setAttribute("member", null);
			ra.addAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}

		return "home";

	}
	
	//로그아웃
	@RequestMapping(value = "/member/logout.do")
	public String logout(Model model, HttpSession session) {

		session.invalidate();

		return "home";
	}

	// 마이페이지
	@RequestMapping(value = "/member/mypage.do")
	public String mypage(Model model, @RequestParam String member_id, MemberDTO dto) {
		
		model.addAttribute("mypage",memberService.viewMember(member_id));

		return "member/mypage";
	}

	@RequestMapping(value = "/member/mypageProc.do")
	public String mypageProc(Model model, HttpServletRequest request, HttpSession session, MemberDTO dto) {

		memberService.updateMember(dto);

		return "home";
	}

	// 회원탈퇴
	@RequestMapping(value = "/member/delete.do")
	public String delete(Model model, MemberDTO dto, HttpSession session) {

		MemberDTO member = (MemberDTO)session.getAttribute("member");

		memberService.deleteMember(member);
		
		session.invalidate();

		return "home";
	}

	// 회원 가입
	@RequestMapping(value = "/member/signup.do")
	public String signup() {

		return "signup/signup";
	}

	@RequestMapping(value = "/member/signupProc.do")
	public String signupProc(Model model, MemberDTO dto) {

		memberService.insertMember(dto);

		return "home";
	}

	// 회원목록
	@RequestMapping(value = "/member/member_list.do")
	public String memberList(Model model, HttpSession session) {

		List<MemberDTO> list = memberService.memberList();

		model.addAttribute("list", list);

		return "member/member_list";
	}

	//관리자계정 회원등록
	@RequestMapping(value = "/member/admininsert.do")
	public String admininsert() throws Exception {

		return "member/admininsert";
	}
	
	@RequestMapping(value = "/member/admininsertProc.do")
	public String admininsertPorc(Model model, MemberDTO dto) {

		memberService.insertMember(dto);
		
		return "redirect:member_list.do";
	}
	
	//관리자계정 회원수정
	@RequestMapping(value = "/member/adminupdate.do")
	public String adminupdate(Model model, @RequestParam int member_idx, MemberDTO dto) {
		
		model.addAttribute("memberselect",memberService.memberSelect(member_idx));

		return "member/adminupdate";
	}
	
	@RequestMapping(value = "/member/adminupdateProc.do")
	public String adminupdateProc(Model model, HttpServletRequest request, HttpSession session, MemberDTO dto) {
		
		HttpSession ssupdate = request.getSession();
		
		MemberDTO memberupdate = memberService.updateAdmin(dto);
		
		ssupdate.setAttribute("update", memberupdate);

		return "redirect:member_list.do";
	}
	
	//관리자계정 회원삭제
	@RequestMapping(value = "/member/admindelete.do")
	public String admindelete(String[] member_idx) {
		
		String idxs = "";
		
		for (int i = 0 ; i < member_idx.length ; i++ ) {
			if ( i == member_idx.length-1) {
				idxs = idxs + member_idx[i];
			} else {
				idxs = idxs + member_idx[i]+",";
			}
		}
		System.out.println("idxs = "+ idxs);
		
		memberService.deleteMember(idxs);
		
		return "redirect:member_list.do";
		
	}
}
