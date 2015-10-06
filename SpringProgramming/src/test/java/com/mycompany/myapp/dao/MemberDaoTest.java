package com.mycompany.myapp.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.myapp.ApplicationContextLoader;
import com.mycompany.myapp.dto.Member;

import junit.framework.Assert;

public class MemberDaoTest extends ApplicationContextLoader{
	@Autowired
	MemberDao mdao;
	
	@Test
	public void testJoin(){
		Member member = new Member();
		
		member.setId("TestID");
		member.setPw("TestPw");
		member.setName("TestName");
		
		mdao.join(member);
	}
	
	@Test
	public void testUpdateInfo(){
		Member member = new Member();
		member.setId("TestID");
		member.setNickName("TestNickName");
		member.setEmail("Test@naver.com");
		member.setTel("010-1111-2222");
		
		int row = mdao.updateInfo(member);
		Assert.assertEquals(1,  row);
	}
	
	@Test
	public void testSelect(){
		String Id = "TestID";
		
		Member member = mdao.selectById(Id);
		Assert.assertEquals(member.getId(), Id);
	}
	
	@Test
	public void testFindId(){
		Member member = new Member();
		String name = "TestName";
		String email = "Test@naver.com";
		
		member.setName(name);
		member.setEmail(email);
		
		String id = mdao.findId(member);
		Assert.assertEquals(id, "TestID");
	}
	
	@Test
	public void testFindPw(){
		Member member = new Member();

		String id = "TestID";
		String email = "Test@naver.com";

		member.setId(id);
		member.setEmail(email);
		
		String pw = mdao.findPw(member);
		Assert.assertEquals(pw, "TestPw");
	}
	
	@Test
	public void testUpdateWin(){
		String Id = "TestID";
		String result = "win";
		mdao.updateRecord(Id, result);
	}
	
	@Test
	public void testUpdateLose(){
		String Id = "TestID";
		String result = "lose";
		mdao.updateRecord(Id, result);
	}
}
