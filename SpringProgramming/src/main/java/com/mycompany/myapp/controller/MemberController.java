package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.dto.JoinValidator;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberservice;

	//join
	@RequestMapping(value="member/join", method = RequestMethod.GET)
	public String joinForm(Member member){
		logger.info("joinForm()");
		return "member/joinForm";
	}
	
	@RequestMapping(value="member/join", method = RequestMethod.POST)
	public String join(Member member, BindingResult bindingResult){
		logger.info("join()");
		
		new JoinValidator().validate(member, bindingResult);
		if(bindingResult.hasErrors()){
			return "member/joinForm";
		}
		memberservice.join(member);
		return "redirect:login";
	}
	
	@RequestMapping("member/idCheck")
	public String idCheck(String id, Model model){
		logger.info("idCheck()");
		String result = memberservice.idCheck(id);
		model.addAttribute("result", result);
		return "member/result";
	}
	
	//login/logout
	@RequestMapping(value="member/login", method = RequestMethod.GET)
	public String loginForm(Member member){
		logger.info("loginForm()");
		return "member/loginForm";
	}
	
	@RequestMapping("member/loginCheck")
	public String loginCheck(Member member, HttpSession session, Model model){
		logger.info("loginCheck()");
		String result = memberservice.loginCheck(member, session);
		model.addAttribute("result", result);
		return "member/result";
	}
	
	@RequestMapping(value="member/login", method = RequestMethod.POST)
	public String login(){
		logger.info("login()");
		
		return "/menu";
	}

	@RequestMapping("member/logout")
	public String logout(String id, HttpSession session, Model model){
		logger.info("logout()");
		session.setAttribute("memberId", id);
		String result="success";
		model.addAttribute("result", result);
		
		return "member/result";
	}
	
	////find
	@RequestMapping("member/selectFind")
	public String selectFind(){
		logger.info("selectFind()");
		return "member/selectFind";
	}
	//id
	@RequestMapping(value="member/idFind", method = RequestMethod.GET)
	public String idFindForm(Member member){
		logger.info("idFindForm()");
		return "member/idFindForm";
	}
	
	@RequestMapping(value="member/idFind", method = RequestMethod.POST)
	public String idFind(Member member, Model model){
		logger.info("idFind()");
		String id = memberservice.FindID(member);
		
		model.addAttribute("id", id);
		
		return "member/id";
	}
	//pw
	@RequestMapping(value="member/pwFind", method = RequestMethod.GET)
	public String pwFindForm(Member member){
		logger.info("pwFindForm()");
		return "member/pwFindForm";
	}
	
	@RequestMapping(value="member/pwFind", method = RequestMethod.POST)
	public String pwFind(Member member, Model model){
		logger.info("pwFind()");
		String pw = memberservice.FindPW(member);
		
		model.addAttribute("pw", pw);
		
		return "member/pw";
	}
	
	//mypage
	@RequestMapping(value="member/mypage", method = RequestMethod.GET)
	public String mypageDetail(HttpSession session, Model model){
		logger.info("mypageDetail()");
		String id = (String)session.getAttribute("memberId");
		
		Member member = memberservice.getMember(id);
		
		model.addAttribute("member",member);
		
		return "member/mypageDetail";
	}
}
