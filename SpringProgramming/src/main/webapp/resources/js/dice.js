var ws = null;

//자기 턴이 왔을 때 접속 활성화
function  connect(){
	ws = new WebSocket("ws://"+window.location.host+"/myapp/dice-ws");
	
	ws.onopen = function(){
		console.log("dice-connect");
		//session 넘버 저장(비동기 통신)
		//setConnected(true);
	};
	
	ws.onclose = function(){
		console.log("dice-close");
		//session 넘버 삭제(비동기 통신)
		//setConnected(false);
	}
	//메세지가 오면 실행
	ws.onmessage = function(event){
			var strJson = event.data;
			var json = JSON.parse(strJson);
			var command = json.command;
			
			if(command=="display"){
				display(data);
			}
		}
}

function roll(){
	connect();
	
	var json={"command":"roll"};
	var strJson = JSON.stringify(json);
	ws.send(strJson);
}

//주사위를 굴리면 주사위/플레이어 값 변경
function display(data){
	var pNo=json.pNo; //플레이어 넘버
	var dNo=json.dNo; //주사위값
	var bLoc=json.bLoc; //이전 위치
	var nLoc=json.nLoc; //현재위치
	
	$(".dice").hide();
	$("#d"+dNo).show(); //주사위값 보여주기
	$("#"+bLoc).children(".P"+pNo).hide(); //이전 위치 지우기
	$("#"+nLoc).children(".P"+pNo).show(); //현재위치 보여주기
}

//턴이종료되면 비활성화
function disconnect(){
	if(ws!=null){
		ws.close();
		ws=null;
	}
}

/*function setConnected(connect){
	if(connect){
		$("#roll").removeAttr("disabled");
	}else{
		$("#roll").attr("disabled",'disabled');
	}
}*/