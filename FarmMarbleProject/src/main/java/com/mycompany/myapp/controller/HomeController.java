package com.mycompany.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String home() {
		logger.info("HomeController-Home()");
		return "home";
	}
	
	@RequestMapping("/menu")
	public String menu() {
		logger.info("HomeController-Menu()");	
		return "menu";
	}
	
	@RequestMapping("/information")
	public String info() {
		logger.info("HomeController-Info()");	
		return "information";
	}
}
