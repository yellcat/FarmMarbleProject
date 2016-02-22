package com.mycompany.myapp.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.mycompany.myapp.dao.MemberDao;


@Component
public class GameService {
	
	@Autowired
	MemberDao mdao;

	public int roll() {
		Random dice = new Random();
		return dice.nextInt(6)+1;
	}

	public int card() {
		Random card = new Random();
		return card.nextInt(4)+1;
	}
	
	public void result(String id, String result){
		mdao.updateRecord(id, result);
	}
}