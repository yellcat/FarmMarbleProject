package com.mycompany.myapp.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.MemberDao;
import com.mycompany.myapp.dto.Member;
@Component
public class MemberService {
	@Autowired
	MemberDao mdao = new MemberDao();
	
	public void join(Member member) {
		mdao.join(member);
	}
	
	public Member getMember(String memberId){
		Member member = mdao.selectById(memberId);
		return member;
	}
	
	public String loginCheck(String memberId, String memberPw, HttpSession session){
		String state;
		Member member = getMember(memberId);
		if(member!=null){
			if(memberPw.equals(member.getPw())){
				session.setAttribute("memberId", memberId);
				state="success";
			}else {
				state="wrong_mpass";
			}
		}else {
			state="wrong_mid";
		}
		return state;
	}

	public String idCheck(String id) {
		String result;
		Member member = getMember(id);
		if(member!=null||id==""){
			result="unable";
		}else{
			result="able";
		}
		return result;
	}	

}
