package com.mycompany.myapp.service;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class GameService {

	public int roll() {
		Random dice = new Random();
		return dice.nextInt(6)+1;
	}

	public int card() {
		Random card = new Random();
		return card.nextInt(5)+1;
	}
}