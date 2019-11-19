package com.cambio.org.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestBoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/restboard/ReplyList.do")
	public List<ReplyDTO> getReplyList(@RequestParam("bid") int bid) throws Exception {
		return boardService.getReplyList(bid);
	}
	
	@RequestMapping(value = "/restboard/saveReply.do", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyDTO replyDTO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		try {
			boardService.saveReply(replyDTO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value = "/restboard/updateReply.do", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyDTO replyDTO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		try {
			boardService.updateRelpy(replyDTO);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
//	@RequestMapping(value = "/restboard/deleteReply.do", method = RequestMethod.POST)
//	public Map<String, Object> deleteReply(@RequestBody ReplyDTO replyDTO, int rid) throws Exception {
//		Map<String, Object> result = new HashMap<>();
//		
//		try {
//			boardService.deleteReply(rid);
//			result.put("status", "OK");
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.put("status", "False");
//		}
//		return result;
//	}
	
	@RequestMapping(value = "/restboard/deleteReply.do")
	public int deleteReply(@RequestParam("rid") int rid) throws Exception {
		return boardService.deleteReply(rid);
	}

}
