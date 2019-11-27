package com.cambio.org.member;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambio.common.Search;
import com.cambio.org.api.NaverLoginBO;
import com.cambio.org.mail.MailSendService;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	private MailSendService mailsendService;

	@RequestMapping(value = "/member/login.do")
	public String login(Model model, HttpServletRequest request, HttpSession session) {

		return "login/login";
	}

	@RequestMapping(value = "/member/loginProc.do")
	public String loginProc(MemberDTO dto, HttpServletRequest request) {

		HttpSession session = request.getSession();

		MemberDTO login = memberService.memberLogin(dto);

		if (login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}
		
		return "login/loginSuccess";
		
	}

	// 로그아웃
	@RequestMapping(value = "/member/logout.do")
	public String logout(Model model, HttpSession session) {

		session.invalidate();

		return "home";
	}

	// 마이페이지
	@RequestMapping(value = "/member/mypage.do")
	public String mypage(Model model, @RequestParam String member_id, MemberDTO dto) {

		model.addAttribute("mypage", memberService.viewMember(member_id));

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

		MemberDTO member = (MemberDTO) session.getAttribute("member");

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
	public String signupProc(Model model, MemberDTO dto, HttpServletRequest request) throws Exception {

		memberService.insertMember(dto);
		System.out.println("여기오냐");
		mailsendService.mailSendWithUserKey(dto.getMember_mail(), dto.getMember_id(), request);
	
		return "home";
	}
	
	//e-mail 인증 
	@RequestMapping(value = "/member/key_alter.do", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("member_id") String member_id, @RequestParam("member_key") String member_key) throws Exception {

		mailsendService.alter_userKey_service(member_id, member_key); // mailsender의 경우 @Autowired

		return "signup/signupSuccess";
	}	
	
	//아이디체크
	@RequestMapping(value = "/member/memberCheck.do",method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("memberId") String member_id) throws Exception {
		return memberService.checkOverId(member_id);
	}

	// 회원목록
	@RequestMapping(value = "/member/memberlist.do")
	public String memberList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range

			, @RequestParam(required = false, defaultValue = "member_id") String searchType,
			@RequestParam(required = false) String keyword, HttpSession session) throws Exception {

		// 검색
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCnt = memberService.memberListCnt(search);

		search.pageInfo(page, range, listCnt);

//	List<MemberDTO> list = memberService.memberList();
//	model.addAttribute("list", list);

		model.addAttribute("pagination", search);
		model.addAttribute("memberlist", memberService.memberList(search));

		return "member/memberlist";
	}

	// 관리자계정 회원등록
	@RequestMapping(value = "/member/admininsert.do")
	public String admininsert() throws Exception {

		return "member/admininsert";
	}

	@RequestMapping(value = "/member/admininsertProc.do")
	public String admininsertPorc(Model model, MemberDTO dto) {

		memberService.insertMember(dto);

		return "redirect:memberlist.do";
	}

	// 관리자계정 회원수정
	@RequestMapping(value = "/member/adminupdate.do")
	public String adminupdate(Model model, @RequestParam int member_idx, MemberDTO dto) {

		model.addAttribute("memberselect", memberService.memberSelect(member_idx));

		return "member/adminupdate";
	}

	@RequestMapping(value = "/member/adminupdateProc.do")
	public String adminupdateProc(Model model, HttpServletRequest request, HttpSession session, MemberDTO dto) {

		HttpSession ssupdate = request.getSession();

		MemberDTO memberupdate = memberService.updateAdmin(dto);

		ssupdate.setAttribute("update", memberupdate);

		return "redirect:memberlist.do";
	}

	// 관리자계정 회원삭제
	@RequestMapping(value = "/member/admindelete.do")
	public String admindelete(String[] member_idx) {

		String idxs = "";

		for (int i = 0; i < member_idx.length; i++) {
			if (i == member_idx.length - 1) {
				idxs = idxs + member_idx[i];
			} else {
				idxs = idxs + member_idx[i] + ",";
			}
		}
		System.out.println("idxs = " + idxs);

		memberService.deleteMember(idxs);

		return "redirect:memberlist.do";

	}
}
