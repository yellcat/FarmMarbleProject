package com.mycompany.myapp.dto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Game {
	//동일 방에 소속한 게이머 정보
	private List<Gamer> gamer;
	//방 이름 //미사용
	private String rName;
	//방 상태//미사용
	private String state;
	//토지 소유 정보<id/지역 넘버 리스트>
	private Map<String, List<Integer>> owner = new HashMap<String, List<Integer>>();
	//토지별 가격 정보
	private static final Integer price [] = {
			null, //0
			700,  //1
			800,  //2
			null, //3
			900,  //4
			500,  //5
			400, //6
			500,  //7
			1200, //8
			null, //9
			500,  //10
			1400, //11
			null, //12
			900,  //13
			1000, //14
			null, //15
			800,  //16
			1300, //17
			null, //18
			1500, //19
			500,  //20
			null, //21
			600,  //22
			600   //23
	};
	//도시명-번호
	private static final String cName [] = {
			"start", //0
			"이천",  //1
			"서귀포",  //2
			"gold", //3
			"오키나와",  //4
			"방콕",  //5
			"타이완", //6
			"발리",  //7
			"두바이", //8
			"gold", //9
			"카이로",  //10
			"파리", //11
			"festival", //12
			"로마",  //13
			"마드리드", //14
			"gold", //15
			"리스본",  //16
			"몬트리올", //17
			"desert", //18
			"하와이", //19
			"상파울로",  //20
			"gold", //21
			"칠레",  //22
			"멕시코시티"   //23
	};
	
	/*===========================================================================*/
	
	public List<Gamer> getGamer() {
		return gamer;
	}
	public static String[] getCname() {
		return cName;
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
	public Integer[] getPrice() {
		return price;
	}
	public Map<String, List<Integer>> getOwner() {
		return owner;
	}
	public void setOwner(Map<String, List<Integer>> owner) {
		this.owner = owner;
	}
}
