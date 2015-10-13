package com.mycompany.myapp.dto;

import java.util.List;
import java.util.Map;

public class Game {
	private List<Gamer> gamer;//게이머
	private String rName;//방 이름
	private String state;//방 상태(game 가능 여부)
	private String character;
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Map getTree() {
		return tree;
	}
	public void setTree(Map tree) {
		this.tree = tree;
	}
	private String location;
	private int money;
	private String city;
	private Map tree;
}
