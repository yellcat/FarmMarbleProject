package com.mycompany.myapp.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.mycompany.myapp.dto.*;
import com.mycompany.myapp.service.*;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/board/writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write",method=RequestMethod.POST)	
	public String write(Board board, HttpSession session) {	
		logger.info("write()");
		
		//파일 정보 얻기
		ServletContext application = session.getServletContext();
		String dirPath = application.getRealPath("/resources/uploadfiles");
		if(board.getAttach() != null) {
			String originalFilename = board.getAttach().getOriginalFilename();
			String filesystemName = System.currentTimeMillis() + "-" + originalFilename;
			String contentType = board.getAttach().getContentType();
			if(!board.getAttach().isEmpty()) {	
				//파일에 저장하기
				try {
					board.getAttach().transferTo(new File(dirPath + "/" + filesystemName));
				} catch (Exception e) { e.printStackTrace(); }
			}
			board.setBoard_original_file_name(originalFilename);
			board.setBoard_file_system_name(filesystemName);
			board.setBoard_content_type(contentType);
		}
		
		//데이터 베이스에 게시물 정보 저장
		boardService.add(board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/board/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
			Model model, 
			HttpSession session) {
		logger.info("pageNo: " + pageNo);
		
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
				
		//전체 게시물 수
		int totalBoardNo = boardService.getTotalBoardNo();
		
		//전체 페이지 수
		int totalPageNo = totalBoardNo/rowsPerPage;
		if(totalBoardNo%rowsPerPage != 0) { totalPageNo++; }
		
		//전체 그룹 수
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo%pagesPerGroup != 0) { totalGroupNo++; }
		
		//현재 그룹번호, 시작페이지번호, 끝페이지번호
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo==totalGroupNo) { endPageNo = totalPageNo; }
		
		//현재 페이지 게시물 리스트
		List<Board> list = boardService.getPage(pageNo, rowsPerPage);
		String board_membernickname=null;
		
		if(!list.isEmpty()){
			board_membernickname=list.get(0).getBoard_membernickname();
		}
		
		
		//View로 넘길 데이터
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", list);
	
		
		return "board/list";
	}

	@RequestMapping("/board/detail")
	public String detail(int boardNo, Model model) {
		boardService.addHitcount(boardNo);
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		return "board/detail";
	}
	
	@RequestMapping("/board/updateForm")
	public String updateForm(@RequestParam("bno") int boardNo, Model model) {
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		return "board/updateForm";
	}
	
	@RequestMapping("/board/update")
	public String update(Board board) {
		boardService.modify(board);
		return "redirect:/board/detail?boardNo="+board.getBoard_no();
	}
	
	@RequestMapping("/board/delete/{boardNo}")
	public String delete(@PathVariable int boardNo) {
		boardService.remove(boardNo);
		return "redirect:/board/list";
	}

}










