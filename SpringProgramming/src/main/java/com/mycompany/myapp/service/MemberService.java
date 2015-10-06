package com.mycompany.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.myapp.dao.MemberDao;

public class MemberService {
	@Autowired
	MemberDao mdao;

}
