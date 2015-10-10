package com.mycompany.myapp.controller;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mycompany.myapp.dto.Gamer;
import com.mycompany.myapp.service.GameService;

@Component
public class DiceHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private GameService gameService;
	Map<String, Gamer> list = new HashMap<String, Gamer>();
	final static int gamerNum = 4;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("dice connect close");
		list.remove(session.getId());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("dice connect suceess");
		Gamer gamer = new Gamer();
		
		for(int i =0; i<gamerNum; i++){
			if(!list.keySet().contains(i)){
				gamer.setpNo(i);
				break;
			}
		}
		gamer.setWss(session);
		list.put(session.getId(), gamer);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("dice roll!");
		
		String key = session.getId();
		String strJson = message.getPayload();
		
		JSONObject jsonObject = new JSONObject(strJson);
		String command = jsonObject.getString("command");
		if(command.equals("display")){
			display(key);
		}
	}
	
	private void display(String key) {
		JSONObject root = new JSONObject();
		root.put("command", "display");
		
		JSONObject d = new JSONObject();
		
		Gamer gamer = list.get(key);
		
		int pNo = gamer.getpNo();
		int dNo = gameService.roll();
		int bLoc = gamer.getLocation();
		int nLoc = bLoc+dNo;
		if((nLoc)>23){
			nLoc -= 24; 
		}
		gamer.setLocation(nLoc);
		
		d.put("pNo", pNo);
		d.put("dNo", dNo);
		d.put("bLoc", bLoc);
		d.put("nLoc", nLoc);
		root.put("data", d);
	}
}