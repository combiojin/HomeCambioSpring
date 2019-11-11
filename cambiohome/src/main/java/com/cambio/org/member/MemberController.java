package com.cambio.org.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/login.do")
	public String login(Model model) {
		
		
		
		return "login/login";
	}

}
