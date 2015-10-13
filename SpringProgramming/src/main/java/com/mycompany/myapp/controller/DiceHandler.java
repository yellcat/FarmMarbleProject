package com.mycompany.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	private static final Logger logger = LoggerFactory.getLogger(DiceHandler.class);
	
	@Autowired
	private GameService gameService;
	Map<String, Gamer> map = new HashMap<String, Gamer>();
	final static int gamerNum = 2;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("dice connect suceess: ");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("dice connect close");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("get textMessage!");
		
		String strJson = message.getPayload();
		
		JSONObject jsonObject = new JSONObject(strJson);
		String command = jsonObject.getString("command");
		String key = jsonObject.getString("id");
		
		if(command.equals("setInfo")){
			logger.info("setInfo");
			setInfo(key, session);
			}
		
		if(command.equals("roll")){
			logger.info("roll");
			roll(key);
		}
		if(command.equals("deleteInfo")){
			logger.info("deleteInfo");
			deleteInfo(key);
		}
	}
	
	private void setInfo(String id, WebSocketSession session) throws IOException {
		Gamer gamer = new Gamer();
		gamer.setWss(session);
		
		if(map.size()==0){
			gamer.setpNo(1);
		}else{
			List<Integer> l = new ArrayList<Integer>();
			for(Gamer gamers: map.values()){
				l.add(gamers.getpNo());
			}
			for(int i =1; i<gamerNum+1; i++){
				if(!l.contains(i)){
					gamer.setpNo(i); break;
				}
			}
		}
		
		logger.info(Integer.toString(map.size()));
		logger.info(Integer.toString(gamer.getpNo()));
		map.put(id, gamer);
		
		if(map.size()==gamerNum){
			start(id);
		}
	}
	
	private void start(String key) throws IOException{
		logger.info("start()");
		
		JSONObject root = new JSONObject();
		root.put("command", "start");
		root.put("gamerNum", gamerNum);
		
		for(Gamer gamers: map.values()) {
			synchronized(map.get(key).getWss()){
				if(gamers.getpNo()==1){
					root.put("turn", "run");
				}else{
					root.put("turn", "wait");
				}
				String strJson = root.toString();
				TextMessage textMessage = new TextMessage(strJson);
				gamers.getWss().sendMessage(textMessage);
			}
		}
	}

	private void deleteInfo(String id){
		map.remove(id);
	}

	private void roll(String key) throws IOException {
		JSONObject root = new JSONObject();
		root.put("command", "display");
		
		JSONObject d = new JSONObject();
		
		Gamer gamer = map.get(key);
		
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
		
		for(Gamer gamers:map.values()) {
			synchronized(gamer.getWss()) {
				if(gamer.getpNo()==gamerNum){
					if(gamers.getpNo()==1){
						root.put("turn", "run");
					}else{
						root.put("turn", "wait");
					}
				}else{
					if(gamers.getpNo()==(gamer.getpNo()+1)){
						root.put("turn", "run");
					}else{
						root.put("turn", "wait");
					}
				}
				
				String strJson = root.toString();
				TextMessage textMessage = new TextMessage(strJson);
				gamers.getWss().sendMessage(textMessage);
			}
		}
	}
}