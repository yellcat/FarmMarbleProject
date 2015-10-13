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
		if(command=="start"){
			console.log("start");
			start(json);
		}
		if(command=="display"){
			console.log("display");
			display(data);
			
			var turn=json.turn;
			if(turn=="run"){
				$("#roll").removeAttr("disabled");
			}
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