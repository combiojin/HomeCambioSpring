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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambio.common.Search;
import com.cambio.org.api.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {

//	// NaverLoginBO
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;
//
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//		this.naverLoginBO = naverLoginBO;
//	}

	@Autowired
	MemberService memberService;

	// 로그인, NAVER
	@RequestMapping(value = "/member/login.do")
	public String login(Model model, HttpServletRequest request, HttpSession session) {

//		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
//		// 네이버
//		model.addAttribute("url", naverAuthUrl);

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

		return "home";

	}

//	// NAVER CALLBACK
//	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
//			throws IOException, ParseException {
//		
////네이버:https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=KhEANtvjgFowIgM3Fu8Z&redirect_uri=http%3A%2F%2Flocalhost%3A9000%2Forg%2F&state=45822e3b-50c5-4d52-a5d8-d24e6f25aa78
//
//		System.out.println("여기는 callback");
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		// 1. 로그인 사용자 정보를 읽어온다.
//		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
//		/**
//		 * apiResult json 구조 {"resultcode":"00", "message":"success",
//		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
//		 **/
//		// 2. String형식인 apiResult를 json형태로 바꿈
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		// 3. 데이터 파싱
//		// Top레벨 단계 _response 파싱
//		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//		// response의 nickname값 파싱
//		String nickname = (String) response_obj.get("nickname");
//		System.out.println(nickname);
//		// 4.파싱 닉네임 세션으로 저장
//		session.setAttribute("member", nickname); // 세션 생성
//		model.addAttribute("result", apiResult);
//		return "login/login";
//	}

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
	public String signupProc(Model model, MemberDTO dto) {

		memberService.insertMember(dto);

		return "home";
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
