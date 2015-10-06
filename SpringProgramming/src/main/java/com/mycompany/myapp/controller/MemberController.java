package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberservice;

	@RequestMapping("member/joinForm")
	public String joininForm(){
		logger.info("joinForm()");
		return "member/joinForm";
	}
	
	@RequestMapping("member/join")
	public String join(Member member){
		logger.info("join()");
		memberservice.join(member);
		return "member/joinResult";
	}
	
	@RequestMapping("member/login")
	public String login(Member member, HttpSession session, Model model){
		logger.info("login()");
		String result = memberservice.loginCheck(member.getId(), member.getPw(), session);
		model.addAttribute("result", result);
		
		return "member/result";
	}
	
	@RequestMapping("member/idCheck")
	public String idCheck(String id, Model model){
		logger.info("idCheck()");
		String result = memberservice.idCheck(id);
		model.addAttribute("result", result);
		return "member/result";
	}
	
	@RequestMapping("member/logout")
	public String logout(String id, HttpSession session, Model model){
		logger.info("logout()");
		session.setAttribute("memberId", id);
		String result="success";
		model.addAttribute("result", result);
		
		return "member/result";
	}
	
}
