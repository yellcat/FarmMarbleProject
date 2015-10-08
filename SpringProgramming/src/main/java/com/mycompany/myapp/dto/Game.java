package com.mycompany.myapp.dto;

import java.util.Map;

public class Game {
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
