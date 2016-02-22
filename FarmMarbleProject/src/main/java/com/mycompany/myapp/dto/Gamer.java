package com.mycompany.myapp.dto;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

public class Gamer{
	//Player id//Key
	private String id;
	//Player No
	private int pNo;
	//소지금
	private int money = 5000;
	//상태(wait/playing/desert/travel/bankrupt)
	private String state = "wait";
	//소유하고있는 농장 정보
	private Map<Integer,Integer> tree = new HashMap<Integer, Integer>();
	//현재 위치
	private int location = 0;
	//소켓
	private WebSocketSession wss;	
	
	/*===========================================================================*/
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Map<Integer, Integer> getTree() {
		return tree;
	}
	public void setTree(Map<Integer, Integer> tree) {
		this.tree = tree;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public WebSocketSession getWss() {
		return wss;
	}
	public void setWss(WebSocketSession wss) {
		this.wss = wss;
	}
}
