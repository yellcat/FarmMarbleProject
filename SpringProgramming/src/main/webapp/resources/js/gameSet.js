var ws = null; //web socket
var id = null; //본인 id
var npNo = null; //본인 player No
var color = null; //본인 color(yellow/red/orange/green)

//자기 턴이 왔을 때 접속 활성화
connect();
function  connect(){
	ws = new WebSocket("ws://"+window.location.host+"/myapp/dice-ws");
	
	ws.onopen = function(){
		console.log("connect");
		setInfo();
		/*setConnected(true);*/
	};
	
	ws.onclose = function(){
		console.log("close");
		/*setConnected(false);*/
	}
	//메세지가 오면 실행
	ws.onmessage = function(event){
		console.log("onmessage");
		var strJson = event.data;
		var json = JSON.parse(strJson);
		var command = json.command;
		var data = json.data;
		if(command=="setPlayer"){
			console.log("setPlayer");
			setPlayer(data);
		}
		if(command=="clearInfo"){
			console.log("clearInfo");
			console.log(data);
			clearInfo(data);
		}
		if(command=="start"){
			console.log("start");
			start(json);
		}
		if(command=="display"){
			console.log("display");
			display(data);
			levent(data);
			
			var turn=json.turn;
			if(turn=="run"){
				$("#p"+npNo).children(".txt").children("h3").css("color",color);
				$("#roll").removeAttr("disabled");
			}
		}
		if(command=="buy") {
			console.log("buy");
			buy(data);
		}
	}
}

function levent(data){
	
	var check = data.check;
	var level = data.level;
	console.log(check);
	if(check == "buy"){
		//구입 or 취소
	}else if(check=="upgrade"){
		//구입 or 취소
	}else if(check=="pay"){
		//금액 and 확인
	}else if(check=="gold"){
		var sentence = "황금카드 발견! ";
		if(level==1){
			sentence+="고비사막에 도착했습니다. 3턴간 구조를 기다리세요!";
		}else if(level==2){
			sentence+="도시를 변경합니다.";
		}else if(level==3){
			sentence+="시작지점으로 이동합니다.";
		}else if(level==4){
			sentence+="황금을 발견했습니다. 소지금이 500 추가됩니다.";
		}else if(level==5){
			sentence+="비행기로 이동합니다. 원하는 도시로 이동할 수 있습니다.";
		}
		alert(sentence);
	}else if(check=="spot"){
		var sentence=null;
		if(level==6){
			sentence="세계여행! 다음 턴에 원하는 도시를 선택할 수 있습니다.";
		}else if(level==12){
			sentence="수확제가 개최됩니다! 원하는 도시를 선택하세요!";
		}else if(level==18){
			sentence="고비사막에 도착했습니다. 3턴간 구조를 기다리세요!";
		}
		alert(sentence);
	}
}

$(".cancle").click(function(){
	disconnect();
})

//턴이종료되면 비활성화
function disconnect(){
	sendmessage("disconnect");
	
	if(ws!=null){
		ws.close();
		ws=null;
	}
}