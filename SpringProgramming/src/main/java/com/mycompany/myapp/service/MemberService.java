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

	public String idCheck(String id) {
		String result;
		System.out.println("idCheck");
		Member member = mdao.selectById(id);
		if(member!=null||id==""){
			result="unable";
		}else{
			result="able";
		}
		System.out.println(result);
		return result;
	}
	
	public String loginCheck(Member member, HttpSession session){
		String state;
		Member temp = mdao.selectById(member.getId());
		
		if(temp.getId()!=null){
			if(member.getPw().equals(temp.getPw())){
				session.setAttribute("memberId", member.getId());
				state="success";
			}else {
				state="wrong_pw";
			}
		}else {
			state="wrong_id";
		}
		return state;
	}

	public String FindID(Member member) {
		return mdao.findId(member);
		
	}

	public String FindPW(Member member) {
		return mdao.findPw(member);
	}

	public void update(Member member) {
		mdao.updateInfo(member);
	}	

}
