package com.mycompany.myapp.dto;

import java.util.List;

public class Game {
	private List<Gamer> gamer;//게이머
	private String rName;//방 이름
	private String state;//방 상태(game 가능 여부)
	private static final Integer price [] = {
			null, //0
			700,  //1
			800,  //2
			null, //3
			900,  //4
			500,  //5
			null, //6
			500,  //7
			1200,
			null,
			500,
			1400,
			null,
			900,
			1000,
			null,
			800,
			1300,
			null,
			1500,
			500,
			null,
			600,
			600
	};
	public List<Gamer> getGamer() {
		return gamer;
	}
	public void setGamer(List<Gamer> gamer) {
		this.gamer = gamer;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public static Integer[] getPrice() {
		return price;
	}
}
