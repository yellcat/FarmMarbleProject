var ws = null;
var id = null;
//자기 턴이 왔을 때 접속 활성화
function  connect(){
	ws = new WebSocket("ws://"+window.location.host+"/myapp/dice-ws");
	
	ws.onopen = function(){
		console.log("connect");
		setInfo();
		setConnected(true);
	};
	
	ws.onclose = function(){
		console.log("close");
		setConnected(false);
	}
	//메세지가 오면 실행
	ws.onmessage = function(event){
		console.log("onmessage");
		var strJson = event.data;
		var json = JSON.parse(strJson);
		var command = json.command;
		var data = json.data;
		if(command=="display"){
			console.log("display");
			display(data);
		}
	}
}

function setInfo(){
	$.ajax({
		url:"../member/getId",
		success:function(data){
			id = data.trim();
			
			console.log(id);
			var json={
					"command":"setInfo",
					"id":id
			};
			var strJson = JSON.stringify(json);
			ws.send(strJson);
		}
	});
}

function sendmessage(commend){
	var json={
				"command":commend,
				"id":id
		};
	var strJson = JSON.stringify(json);
	ws.send(strJson);
}

function roll(){
	sendmessage("roll");
}

//주사위를 굴리면 주사위/플레이어 값 변경
function display(json){
	var pNo=json.pNo; //플레이어 넘버
	var dNo=json.dNo; //주사위값
	var bLoc=json.bLoc; //이전 위치
	var nLoc=json.nLoc; //현재위치
	
	console.log(json);
	
	$(".dice").hide();
	$("#d"+dNo).show(); //주사위값 보여주기
	$("#"+bLoc).children(".P"+pNo).hide(); //이전 위치 지우기
	$("#"+nLoc).children(".P"+pNo).show(); //현재위치 보여주기
}

//턴이종료되면 비활성화
function disconnect(){
	sendmessage("deleteInfo");
	if(ws!=null){
		ws.close();
		ws=null;
	}
}

function setConnected(connect){
	if(connect){
		$("#connect").attr("disabled",'disabled');
		$("#disconnect").removeAttr("disabled");
	}else{
		$("#connect").removeAttr("disabled");
		$("#disconnect").attr("disabled",'disabled');
	}
}