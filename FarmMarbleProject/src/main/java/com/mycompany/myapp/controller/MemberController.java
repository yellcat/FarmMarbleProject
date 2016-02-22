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
import com.mycompany.myapp.dto.PwValidator;
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
	public String logout(HttpSession session, Model model){
		logger.info("logout()");
		session.setAttribute("memberId", "");
		
		return "redirect:login";
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
	public String idFind(Member member, Model model, BindingResult bindingResult){
		logger.info("idFind()");
		String id = memberservice.FindID(member);
		
		if(id==null){
			bindingResult.rejectValue("email", "NotFoundId", "not exist");
			return "member/idFindForm";
		}
		
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
	public String pwFind(Member member, Model model, BindingResult bindingResult){
		logger.info("pwFind()");
		String pw = memberservice.FindPW(member);
		
		if(pw==null){
			bindingResult.rejectValue("email", "NotFoundPw", "not exist");
			return "member/pwFindForm";
		}
		
		model.addAttribute("pw", pw);
		
		return "member/pw";
	}
	
	//mypage
	@RequestMapping("member/mypage")
	public String mypageDetail(HttpSession session, Model model){
		logger.info("mypageDetail()");
		String id = (String)session.getAttribute("memberId");
		Member member = memberservice.getMember(id);
		
		model.addAttribute("member",member);
		
		return "member/mypageDetail";
	}

	@RequestMapping(value="member/mypageUpdate", method=RequestMethod.GET)
	public String mypageUpdateForm(HttpSession session, Model model){
		logger.info("mypageUpdateForm()");
		String id = (String)session.getAttribute("memberId");
		Member member = memberservice.getMember(id);
		model.addAttribute("member",member);
		return "member/mypageUpdate";
	}
	
	@RequestMapping(value="member/mypageUpdate", method=RequestMethod.POST)
	public String mypageUpdate(Member member, BindingResult bindingResult){
		logger.info("mypageUpdate()");
		Member temp = new Member();
		temp = memberservice.getMember(member.getId());
		
		if(!member.getPw().equals(temp.getPw())){
			bindingResult.rejectValue("pw", "non_pass", "incorrect");
		}
		
		if(bindingResult.hasErrors()){
			return "member/mypageUpdate";
		}
		memberservice.update(member);
		return "redirect:mypage";		
	}

	@RequestMapping(value="member/pwChange", method=RequestMethod.GET)
	public String pwChangeForm(Member member){
		logger.info("pwChangeForm()");
		return "member/pwChange";
	}
	
	@RequestMapping(value="member/pwChange", method=RequestMethod.POST)
	public String pwChange(Member member, HttpSession session, BindingResult bindingResult){
		logger.info("pwChange()");
		String id = (String)session.getAttribute("memberId");
		Member temp = new Member();
		temp = memberservice.getMember(id);
		
		if(!member.getPw().equals(temp.getPw())){
			bindingResult.rejectValue("pw", "non_pass", "not the same as above");
		}else {
			new PwValidator().validate(member, bindingResult);
		}
		
		if(bindingResult.hasErrors()){
			return "member/pwChange";
		}
		member.setId(id);
		memberservice.updatePw(member);
		return "redirect:mypage";
	}

	@RequestMapping("member/ranking")
	public String mypageRanking(HttpSession session, Model model){
		logger.info("mypageRanking()");
		String id = (String)session.getAttribute("memberId");
		Member member = memberservice.getMember(id);
		
		double rate = (double)member.getWin()/(member.getWin()+member.getLose());
		
		if(Double.isNaN(rate)) rate = 0;
		member.setRate(rate);
		
		model.addAttribute("member",member);
		
		return "member/ranking";
	}
	
	@RequestMapping("member/getId")
	public String getId(HttpSession session, Model model){
		logger.info("mypageRanking()");
		String id = (String)session.getAttribute("memberId");
		model.addAttribute("result",id);
		
		return "member/result";
	}
}
