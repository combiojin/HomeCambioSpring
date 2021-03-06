package com.cambio.org.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambio.common.Pagination;
import com.cambio.common.Search;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시판 리스트
	@RequestMapping(value = "/board/boardlist.do", method = RequestMethod.GET)
	public String getBoardList(Model model
			,@RequestParam(required = false,defaultValue = "1") int page
			,@RequestParam(required = false,defaultValue = "1") int range
			
			,@RequestParam(required = false,defaultValue = "title") String searchType
			,@RequestParam(required = false) String keyword
			,HttpSession session
			) throws Exception {
		
		//검색
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 게시글 개수
		int listCnt = boardService.getBoardListCnt(search);
		
		search.pageInfo(page,range,listCnt);
		
		//Pagination 객체생성
//		Pagination pagination = new Pagination();
//		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("boardList", boardService.getBoardList(search));
		
		return "board/boardlist";
	}
	
	// 게시물 작성
	@RequestMapping(value = "/board/boardForm.do")
	public String boardForm(Model model) {
		model.addAttribute("dto", new BoardDTO());

		return "board/boardForm";
	}

	//게시글 장성 및 수정 DB저장
	@RequestMapping(value = "/board/boardProc.do", method = RequestMethod.POST)
	public String boardProc(@ModelAttribute("dto") BoardDTO dto, @RequestParam("mode") String mode, RedirectAttributes rttr, Model model, HttpServletRequest request) throws Exception {

		if(mode.equals("update")) {
			boardService.updateBoard(dto);
		} else {
			boardService.insertBoard(dto);
		}

		return "redirect:/board/boardlist.do";
	}

	//게시글 상세조회
	@RequestMapping(value = "/board/boardContent.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardContent(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("replyDTO", new ReplyDTO());
		
		return "board/boardContent";
	}

	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model)
			throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("dto", new BoardDTO());
		
		return "board/boardForm";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("bid") int bid, RedirectAttributes rttr)
			throws Exception {
		boardService.deleteBoard(bid);
		
		return "redirect:/board/boardlist.do";
	}
	
//	//ExceptionHandler을 이용한 예외처리 방법
//	@ExceptionHandler(RuntimeException.class)
//	public String exceptionHandler(Model model,Exception e) {
//		model.addAttribute("exception", e);
//		return "error/exception";
//	}
	
	//관리자계정 글삭제
	@RequestMapping(value = "/board/admindelete.do")
	public String admindelete(String[] bid) {

		String idxs = "";

		for (int i = 0; i < bid.length; i++) {
			if (i == bid.length - 1) {
				idxs = idxs + bid[i];
			} else {
				idxs = idxs + bid[i] + ",";
			}
		}
		System.out.println("idxs = " + idxs);

		boardService.deleteSelectBoard(idxs);

		return "redirect:boardlist.do";

	}

}
