package com.mycompany.myapp.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.myapp.ApplicationContextLoader;
import com.mycompany.myapp.dto.Member;

public class MemberDaoTest extends ApplicationContextLoader{
	@Autowired
	MemberDao mdao;
	
	@Test
	public void testJoin(){
		Member member = new Member();
		
		member.setId("testID");
		member.setPw("TestPw");
		member.setName("TestName");
		
		mdao.join(member);
	}
	
	@Test
	public void testUpdateInfo(){
		Member member = new Member();
		
	}
	
	@Test
	public void testSelect(){
		
	}
	
	@Test
	public void testUpdateRecord(){
		Member member = new Member();
	}
	
}
