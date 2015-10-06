package com.mycompany.myapp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MemberService;

@Component
public class MemberController {
	@Autowired
	MemberService mservice;
	
	@RequestMapping(value = "/member/join", method=RequestMethod.GET)
	public String joinForm(Member member){
		
		return "member/joinForm";
	}
	@RequestMapping(value = "/member/join", method=RequestMethod.POST)
	public String join(Member member){
		
		return "member/join";
	}

}
