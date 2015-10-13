package com.mycompany.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.dto.Comment;
import com.mycompany.myapp.service.CommentService;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/comment/list")
	public String list(@RequestParam(defaultValue="1") int pageNo, Model model, HttpSession session) {
		logger.info("list()");
		
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage = 5;
		int pagesPerGroup = 5;
		
		int totalCommentNo = commentService.getTotalCommentNo();
		
		int totalPageNo = totalCommentNo / rowsPerPage;
		if(totalCommentNo % rowsPerPage != 0) { totalPageNo++; }
		
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo % pagesPerGroup != 0) { totalGroupNo++; }
		
		int groupNo = (pageNo-1)*pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNo) { endPageNo = totalPageNo; }
		
		List<Comment> list = commentService.getPage(pageNo, rowsPerPage);
		
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);		
		model.addAttribute("list", list);
		
		return "comment/list";
		
	}
}
