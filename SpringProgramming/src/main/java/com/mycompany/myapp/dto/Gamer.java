package com.mycompany.myapp.dto;

import java.util.Map;

import org.springframework.web.socket.WebSocketSession;

public class Gamer{
	private int pNo;
	private int money = 10000;
	private String state = "playing";
	private Map<Integer,Integer> tree; //소유하고있는 농장 정보
	private int location = 0;
	private WebSocketSession wss;	
	
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
