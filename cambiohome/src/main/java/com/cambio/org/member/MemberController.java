package com.cambio.org.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	SqlSession session;

	@RequestMapping(value = "/member/login.do")
	public String login(Model model) {

		return "login/login";
	}

	@RequestMapping(value = "/member/signup.do")
	public String signup(Model model) {

		return "signup/signup";
	}

	@RequestMapping(value = "/member/signupProc.do")
	public String signupProc(Model model, String member_id, 
			String member_pw, String member_cpw, String member_mail) {
		
		MemberDTO md = new MemberDTO();
		md.setMember_id(member_id);
		md.setMember_pw(member_pw);
		md.setMember_cpw(member_cpw);
		md.setMember_mail(member_mail);
		
		System.out.println(md);
						
		session.insert("member.singupinsert",md);
		System.out.println("일로오나?");
		return "home";
	}

	@RequestMapping(value = "/member/index.do")
	public String index(Model model) {

		model.addAttribute("list", session.selectList("member.selectlist"));
		System.out.println("일로오나?");

		return "member/index";
	}

}
