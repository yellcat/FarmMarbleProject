package com.mycompany.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mycompany.myapp.dto.Game;
import com.mycompany.myapp.dto.Gamer;
import com.mycompany.myapp.service.GameService;

@Component
public class DiceHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(DiceHandler.class);
	
	@Autowired
	private GameService gameService;
	//String은 id, Gamer 객체	
	Game game = new Game();
	Map<String, Gamer> map = new HashMap<String, Gamer>(); //ID, Gamer
	Map<Integer, String> seq = new HashMap<Integer, String>(); //playerNo, ID
	final static int gamerNum = 4; //전체 플레이어 수
	final static int salary = 500; //추가금(황금/시작점)
	//도시정보
	final static List<Integer> country = Arrays.asList(1, 2, 4, 5, 6, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23);
	//황금카드 정보
	final static List<Integer> gold = Arrays.asList(3, 9, 15, 21);
	//이벤트 지점 정보
	final static List<Integer> spot = Arrays.asList(12, 18);
	int festival = 0;

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
		
		if(command.equals("setInfo")){//멤버 정보 저장
			logger.info("setInfo");
			setInfo(key, session);
			}
		if(command.equals("ready")){//사용자 정보 출력
			logger.info("setInfo");
			ready(key);
		}
		if(command.equals("roll")){//주사위 굴림
			logger.info("roll");
			roll(key);
		}
		if(command.equals("deleteInfo")){//정보 지우기
			logger.info("deleteInfo");
			deleteInfo(key);
		}
		if(command.equals("disconnect")){//연결 끊기(map에서 삭제)
			logger.info("disconnect");
			disconnect(key);
		}
		if(command.equals("buy")){//건물구입
			logger.info("buy");
			buy(key);
		}
		if(command.equals("desert")){//고비사막
			logger.info("desert");
			desert(key);
		}
		if(command.equals("change")){//도시변경
			logger.info("change");
			change(key, jsonObject.getString("country"));
		}
		if(command.equals("not")){//이벤트 없음//다음 턴으로
			logger.info("not");
			JSONObject d = new JSONObject();
			nextTurn(key, "not", d);
		}
		if(command.equals("pay")){//이용료 지불
			logger.info("pay");
			pay(key);
		}
		if(command.equals("festival")){//수확제
			logger.info("festival");
			festival(key, jsonObject.getString("country"));
		}
		if(command.equals("bankrupt")){//파산
			logger.info("bankrupt");
			bankrupt(key);
		}
		if(command.equals("result")){
			gameService.result(key, jsonObject.getString("result"));
		}
	}
	private void bankrupt(String key) throws IOException {
		logger.info("bankrupt event1");
		Gamer gamer = map.get(key);
		
		if(gamer.getState() == "bankrupt") {
		JSONObject root = new JSONObject();
		root.put("command", "bankrupt");
		
		logger.info("bankrupt event2");
		JSONObject d = new JSONObject();
		d.put("pNo", gamer.getpNo());
		d.put("money", gamer.getMoney());
		d.put("olist", game.getOwner().get(key));
		d.put("location", gamer.getLocation());
		
		logger.info("olist: " + game.getOwner().get(key));
		logger.info("bankrupt event3");
		
		nextTurn(key, "bankrupt", d);
		}
	}

	private void pay(String key) throws IOException {
		logger.info("pay event1");		
		Gamer gamer = map.get(key);
		String owner = null; //땅주인
		int l = gamer.getLocation();		
		Set<String> owners = game.getOwner().keySet();
		for(String id: owners) {
			List<Integer> list = game.getOwner().get(id);
			for(int l2 : list) {				
				if(l == l2) {
					owner = id;
				}
			}
			logger.info("list.size(): " + list.size());
		}
		logger.info("pay event2");
		
		Gamer ogamer = map.get(owner); //지불 대상
		Integer level = ogamer.getTree().get(l);
		logger.info("level: " + level);
				
		logger.info("pay event3");
		
		int pay = 0;
		if(level == 1) {					
			pay = (int)(game.getPrice()[l]*0.5);
		} else if(level == 2) {			
			pay = (int)(game.getPrice()[l]*1.5);
		} else if (level == 3) {			
			pay = (int)(game.getPrice()[l]*2.0);
		} 
		if (l == festival) {
			pay = (int)(pay*1.5);
		}
		
		logger.info(Integer.toString(pay));

		//만약 지불이 불가능하다면(소유 금액이 마이너스라면) 파산
		//1. 파산 알람 메세지 전달
		//2. 플레이어 리스트(seq)에서 remove
		//3. seq 크기가 1이라면 게임 종료(승자 전달/승점, 패점 입력)		
		//4. 만약 더 게임이 진행된다면 파산 플레이어 표기
		//그 외의 경우(지불이 가능하다면) else 이후 실행
		if(gamer.getMoney() < pay) {
			gamer.setState("bankrupt");			
			logger.info("State: " + gamer.getState());	
			String winner = null;			
			int count = 0;
			for(Gamer gamers: map.values()) {
				if(gamers.getState() != "bankrupt" ) {
					count ++;
					winner=gamers.getId();
				}				
			}
			String over = "notover";
			JSONObject d = new JSONObject();
			if(count == 1) {	
				logger.info("게임 오버!!!!!!");
				over="over";
				d.put("winner", winner);
			}
			d.put("olist", game.getOwner().get(key).toArray());
			for(int i=0; i<game.getOwner().get(key).size(); i++) {
				logger.info(""+game.getOwner().get(key).toArray()[i]);
			}
			d.put("location", gamer.getLocation());
			d.put("gameover", over);
			gamer.getTree().clear();
			game.getOwner().remove(key);
			nextTurn(key, "bankrupt", d);
			logger.info("파산한 사람: " + gamer.getpNo());
		} else {
			gamer.setMoney(gamer.getMoney()-pay);
			ogamer.setMoney(ogamer.getMoney()+pay);
			logger.info(Integer.toString(gamer.getMoney()));
			logger.info(Integer.toString(ogamer.getMoney()));
			
			JSONObject d = new JSONObject();
			d.put("pNo", gamer.getpNo());		
			d.put("opNo", ogamer.getpNo());
			d.put("money", gamer.getMoney());
			d.put("omoney", ogamer.getMoney());
			
			nextTurn(key, "pay", d);
		}
	}

	private void buy(String key) throws IOException {
		Gamer gamer = map.get(key);
		int l = gamer.getLocation();		
		Integer level = gamer.getTree().get(l);
		logger.info(Integer.toString(level));
		
		if(level == 0) {
			level = 1;		
			gamer.getTree().put(l, level);
		} else if(level == 1) {
			level = 2;
			gamer.getTree().replace(l, level);
		} else if (level == 2) {
			level = 3;
			gamer.getTree().replace(l, level);
		}
		
		if(gamer.getMoney() >= game.getPrice()[l]) {
			gamer.setMoney(gamer.getMoney()-game.getPrice()[l]);
			logger.info(Integer.toString(gamer.getMoney()));
		
			JSONObject d = new JSONObject();
			d.put("pNo", gamer.getpNo());
			d.put("level", level);
			d.put("location", l);
			d.put("money", gamer.getMoney());
			
			//구입하면 game에 구입 정보를 입력해야 함!
			//구입 정보가 없으면
			//list를 생성해서 구입 정보를 입력함
			//지역정보 입력
			//id를 key로 game에 저장
			//구입 정보가 있다면
			//list에 새로운 구입 정보를 추가함
			if(!game.getOwner().keySet().contains(key)){			
				List<Integer> buyinfo = new ArrayList<Integer>();			
				buyinfo.add(l);
				game.getOwner().put(key, buyinfo);			
			}else{			
				game.getOwner().get(key).add(l);	
			}
			logger.info("game.getOwner().size(): "+game.getOwner().size());
			nextTurn(key, "buy", d);
		} else {
			gamer.getTree().replace(l, 0);
			JSONObject d = new JSONObject();
			d.remove(key);
			/*d.put("pNo", gamer.getpNo());
			d.put("level", level);
			d.put("location", l);
			d.put("money", gamer.getMoney());*/
			
			nextTurn(key, "notbuy", d);
		}
	}

	private void setInfo(String id, WebSocketSession session) throws IOException {
		JSONObject root = new JSONObject();
		Gamer gamer = new Gamer();
		gamer.setWss(session);
		if(id==""||id==null) root.put("command", "errorId");
		else{
			gamer.setId(id);
			if(map.size()==0){
				gamer.setpNo(1);
			}else{
				Map<Integer, String> m = new HashMap<Integer, String>();
				for(Gamer gamers: map.values()){
					m.put(gamers.getpNo(), gamers.getId());
				}
				for(int i =1; i<gamerNum+1; i++){
					if(!m.containsKey(i)){
						gamer.setpNo(i); break;
					}
				}
			}
			
			seq.put(gamer.getpNo(), id);
			
			for(int i=1; i<24; i++) {
				Integer level = 0;
				gamer.getTree().put(i, level);
			}
			
			logger.info("전체 플레이어 수: "+ Integer.toString(map.size()));
			logger.info("내 플레이어 넘버: "+ Integer.toString(gamer.getpNo()));

			root.put("command", "setnpNo");
			root.put("npNo", gamer.getpNo());
			
			/*JSONObject data[] = new JSONObject[map.size()];
			
			int n = 1;
			for(Gamer ogamer : map.values()){
				if(ogamer.getState()=="playing"){
					data[n].put("oid",ogamer.getId());
					logger.info(ogamer.getId());
					data[n].put("pNo",ogamer.getpNo());
					logger.info(Integer.toString(ogamer.getpNo()));
					data[n].put("money",ogamer.getMoney());
					logger.info(Integer.toString(ogamer.getMoney()));
					n++;
				}
			}
			root.put("data", data);*/
			map.put(id, gamer);
			
		}
		
		String strJson = root.toString();
		TextMessage textMessage = new TextMessage(strJson);
		gamer.getWss().sendMessage(textMessage);
	}
	
	private void ready(String id) throws IOException{
		Gamer gamer = map.get(id);
		gamer.setState("playing");
		
		int count=0;
		
		JSONObject root = new JSONObject();
		root.put("command", "setPlayer");
		
		JSONObject d = new JSONObject();
		d.put("oid", id);
		d.put("pNo", gamer.getpNo());
		d.put("money", gamer.getMoney());
		
		root.put("data", d);
		
		String strJson = root.toString();
		TextMessage textMessage = new TextMessage(strJson);
		
		for(Gamer gamers: map.values()) {
			synchronized(gamers.getWss()){
				gamers.getWss().sendMessage(textMessage);			
			}
			if(gamers.getState()=="playing") count++;
		}
		
		if(count==gamerNum) start(id);
	}
	
	private void start(String key) throws IOException{
		logger.info("start()");
		
		JSONObject root = new JSONObject();
		root.put("command", "start");
		root.put("gamerNum", gamerNum);
		
		for(Gamer gamers: map.values()) {
			synchronized(gamers.getWss()){
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
	
	private void deleteInfo(String id) throws IOException{
		logger.info("deleteInfo()");
		
		JSONObject root = new JSONObject();
		root.put("command", "clearInfo");
		Gamer gamer = map.get(id);
		int pNo = gamer.getpNo();
		int nLoc = gamer.getLocation();
		
		JSONObject d = new JSONObject();
		d.put("pNo", pNo);
		d.put("nLoc", nLoc);
		
		root.put("data", d);
		
		String strJson = root.toString();
		TextMessage textMessage = new TextMessage(strJson);
		
		gamer.setState("wait");
		
		for(Gamer gamers: map.values()) {
			synchronized(gamers.getWss()){
				gamers.getWss().sendMessage(textMessage);				
			}
		}
	}

	private void disconnect(String id){
		map.remove(id);
	}

	private void roll(String key) throws IOException {
		JSONObject root = new JSONObject();
		root.put("command", "display");
		
		JSONObject d = new JSONObject();
		
		Gamer gamer = map.get(key);
		
		int pNo = gamer.getpNo();
		int dNo = gameService.roll();
		int bLoc = gamer.getLocation();
		int nLoc = bLoc+dNo;
		String check = "buy";
		int level = 0;
		
		if((nLoc)>23){
			nLoc -= 24; 
			gamer.setMoney(gamer.getMoney()+salary);
		}
		gamer.setLocation(nLoc);
		
		if(nLoc==0){
			check="start";
		}else if(country.contains(nLoc)){
			for(Gamer gamers: map.values()){
				if(gamers.getTree().get(nLoc)!=0&&gamers.getpNo()!=gamer.getpNo()){
					check = "pay";
					logger.info("땅주인: " + gamers.getpNo());
					logger.info("게이머: " + gamer.getpNo());
				}
			}
		}else if(gold.contains(nLoc)){
			check = "gold";
			level = gameService.card();
			if(level==1){//desert
				gamer.setLocation(18);
			}else if(level==2){//change
				level=4;
			}else if(level==3){//start
				gamer.setLocation(0);
				gamer.setMoney(gamer.getMoney()+salary);
			}else if(level==4){//황금발견
				gamer.setMoney(gamer.getMoney()+salary);
			}
		}else if(spot.contains(nLoc)){
			check = "spot";
			level = nLoc;
		}
		
		d.put("pNo", pNo);
		d.put("dNo", dNo);
		d.put("bLoc", bLoc);
		d.put("nLoc", nLoc);
		d.put("money", gamer.getMoney());
		d.put("check", check);
		d.put("level", level);
		d.put("price", game.getPrice()[nLoc]);
		
		root.put("data", d);
		String strJson = root.toString();
		TextMessage textMessage = new TextMessage(strJson);
		
		for(Gamer gamers: map.values()) {
			synchronized(gamers.getWss()){
				gamers.getWss().sendMessage(textMessage);				
			}
		}
	}

	private void change(String key, String country) throws IOException {		
		JSONObject d = new JSONObject();
		nextTurn(key, "change", d);
	}

	private void desert(String key) throws IOException {
	      map.get(key).setState("desert");
	      JSONObject d = new JSONObject();
	      nextTurn(key, "not", d);      
	}
	
	private void festival(String key, String country) throws IOException{      
	      JSONObject d = new JSONObject();
	      d.put("bfestival", festival);
	      ////도시명으로 위치정보를 찾을 수 있어야 함
	      for(int i =1; i<Game.getCname().length;i++){
	         if(Game.getCname()[i].equals(country)){
	            //전역변수에 축제 위치 저장(디폴트 0)
	            festival=i;
	            break;
	         }
	      }
	      d.put("festival", festival);
	      nextTurn(key, "festival", d);
	 }
	
	 private void nextTurn(String key, String command, JSONObject d) throws IOException{
	      logger.info("nextTurn()");
	      JSONObject root = new JSONObject();
	      root.put("command", command);
	      Gamer gamer = map.get(key);
	      d.put("pNo", gamer.getpNo());
	      
	      int c = 1;
	      int i = gamer.getpNo()+1;

	      do{
		         if(i>gamerNum) i=1;
		         synchronized(map.get(seq.get(i)).getWss()) {
		            if(c==1&&map.get(seq.get(i)).getState()=="playing"){
		            	d.put("next", i);
		            	c=0;
		            }else if(c==1&&map.get(seq.get(i)).getState()=="desert"){
		               map.get(seq.get(i)).setState("playing");       
		            }		            
		            i++;
		         }
		   }while(i!=gamer.getpNo()+1);

	      for(Gamer gamers: map.values()){
	    	  synchronized(gamers.getWss()){
	    		  
	    		  if(gamers.getpNo()==(int)d.get("next")){
	    			  logger.info("nextTurn()6");
	    			  d.put("turn", "run");
	    		  }else{
	    			  logger.info("nextTurn()7");
	    			  d.put("turn", "wait");
	    		  }
	    		  logger.info("nextTurn()8");
	    		  root.put("data", d);
		          String strJson = root.toString();
		          TextMessage textMessage = new TextMessage(strJson);
		          gamers.getWss().sendMessage(textMessage);
		          logger.info("nextTurn()9");
	    	  }
	    	  
	      }
	   }
}