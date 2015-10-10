package com.mycompany.myapp.service;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class GameService {

	public int roll() {
		Random dice = new Random();
		return dice.nextInt(6);
	}
}