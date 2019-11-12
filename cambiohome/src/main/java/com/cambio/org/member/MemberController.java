package com.cambio.org.member;

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
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"member_id","member_pw","member_mail",})
//@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/member/login.do",method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		return "login/login";
	}
	
	@RequestMapping(value = "/member/loginProc.do",method = RequestMethod.POST)
	public String loginProc(Model model, String member_id, String member_pw, HttpSession ssSession) {
		boolean result = me
		
		MemberDTO md = new MemberDTO();
		md.setMember_id(member_id);
		md.setMember_pw(member_pw);
			
		session.selectOne("member.loginidcheck", md);
		
		model.addAttribute("member_id", "admin");
		
		return "home";
	}

	@RequestMapping(value = "/member/signup.do",method = RequestMethod.GET)
	public String signup(Model model) {

		return "signup/signup";
	}

	@RequestMapping(value = "/member/signupProc.do",method = RequestMethod.POST)
	public String signupProc(Model model, String member_id, 
			String member_pw, String member_cpw, String member_mail) {
		
		MemberDTO md = new MemberDTO();
		md.setMember_id(member_id);
		md.setMember_pw(member_pw);
		md.setMember_cpw(member_cpw);
		md.setMember_mail(member_mail);
		
		session.insert("member.singupinsert",md);
		return "home";
	}

	@RequestMapping(value = "/member/member_list.do")
	public String memberList(Model model) {
		List<MemberDTO> list = memberService.memberList();
		model.addAttribute("list", list);
		return "member/member_list";
	}

}
