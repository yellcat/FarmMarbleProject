package com.mycompany.myapp.controller;

import java.io.IOException;
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
		list.clear();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("dice connect suceess: "+list.size());
		Gamer gamer = new Gamer();
		
		
		
		for(int i =1; i<gamerNum+1; i++){
			//list값을 가져온다
			//list에 있는 값 중 gamer의 pNO값이 i가 아닐 때. i값을 본인의 pNo으로 둔다
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
		
		if(command.equals("roll")){
			logger.info("roll");
			roll(key);
		}
	}
	
	private void roll(String key) throws IOException {
		JSONObject root = new JSONObject();
		root.put("command", "display");
		
		JSONObject d = new JSONObject();
		
		Gamer gamer = list.get(key);
		
		int pNo = gamer.getpNo();
		int dNo = gameService.roll()+1;
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
		
		String strJson = root.toString();
		
		TextMessage textMessage = new TextMessage(strJson);
		for(Gamer gamers:list.values()) {
			synchronized(gamer.getWss()) {
				gamers.getWss().sendMessage(textMessage);
			}
		}
	}
}