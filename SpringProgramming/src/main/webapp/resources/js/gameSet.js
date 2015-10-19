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