package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.service.GameService;

@Controller
public class GameController {
	
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
	@RequestMapping("/game/game")
	public String game() {
		logger.info("Game()");
		return "game/game";
	}
	
}

