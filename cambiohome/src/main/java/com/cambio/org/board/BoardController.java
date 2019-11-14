package com.cambio.org.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시판 리스트
	@RequestMapping(value = "/board/board_list.do")
	public String getBoardList(Model model) throws Exception {
		model.addAttribute("boardList", boardService.getBoardList());
		
		return "board/board_list";
	}

	// 게시물 작성
	@RequestMapping(value = "/board/boardForm.do")
	public String boardForm() {
		
		return "board/boardForm";
	}

	//게시글 장성 및 수정 DB저장
	@RequestMapping(value = "/board/boardProc.do", method = RequestMethod.POST)
	public String boardProc(@ModelAttribute("BoardDTO") BoardDTO dto, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if(mode.equals("update")) {
			boardService.updateBoard(dto);
		} else {
			boardService.insertBoard(dto);
		}

		return "redirect:/board/board_list.do";
	}

	//게시글 상세조회
	@RequestMapping(value = "/board/boardContent.do", method = RequestMethod.GET)
	public String boardContent(Model model, @RequestParam("bid") int bid) throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		
		return "board/boardContent";
	}

	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model)
			throws Exception {
		model.addAttribute("boardContent", boardService.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("boardDTO", new BoardDTO());
		
		return "board/boardForm";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("bid") int bid, RedirectAttributes rttr)
			throws Exception {
		boardService.deleteBoard(bid);
		
		return "redirect:/board/board_list.do";
	}

}
