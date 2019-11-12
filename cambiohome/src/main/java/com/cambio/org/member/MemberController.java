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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
//@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	//로그인
	@RequestMapping(value = "/member/login.do",method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		
		return "login/login";
	}
	
	@RequestMapping(value = "/member/loginProc.do",method = RequestMethod.GET)
	public String loginProc(MemberDTO dto, HttpServletRequest request, RedirectAttributes ra) {
		
		HttpSession session = request.getSession();
		
		MemberDTO login = memberService.memberLogin(dto);
		
		if(login == null) {
			session.setAttribute("member", null);
			ra.addAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "home";
			
	}
	
	@RequestMapping(value = "/member/logout.do",method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
	
		session.invalidate();
		
		return "home";
	}
	
	//마이페이지
	@RequestMapping(value = "/member/mypage.do",method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request) {
		
		return "member/mypage";
	}

	//회원 가입
	@RequestMapping(value = "/member/signup.do")
	public String signup() throws Exception {

		return "signup/signup";
	}

	@RequestMapping(value = "/member/signupProc.do",method = RequestMethod.GET)
	public String signupProc(Model model, MemberDTO dto) {
		
		memberService.insertMember(dto);
		
		return "home";
	}

	@RequestMapping(value = "/member/member_list.do")
	public String memberList(Model model, HttpSession session) {
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
		}
		
		List<MemberDTO> list = memberService.memberList();
		
		model.addAttribute("list", list);
		
		return "member/member_list";
	}

}
