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
		/*System.out.println("HomeController-Home()");//���α׷��� ����ٸ� �����־�� ��*/	
		logger.info("HomeController-Home()");
		/*logger.debug("HomeController-Home()");//log�� ������� �ʴ´ٰ� �Ѵٸ� �������� �ʾƵ� �ȴ�*/	
		return "home";
	}
	
	@RequestMapping("/menu")
	public String menu() {
		/*System.out.println("HomeController-Home()");//���α׷��� ����ٸ� �����־�� ��*/	
		logger.info("HomeController-Menu()");
		/*logger.debug("HomeController-Home()");//log�� ������� �ʴ´ٰ� �Ѵٸ� �������� �ʾƵ� �ȴ�*/	
		return "menu";
	}
	
}
