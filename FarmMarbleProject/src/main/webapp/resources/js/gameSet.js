var ws = null; //web socket
var id = null; //본인 id
var npNo = null; //본인 player No
var gamerNum = null;
var color = "black";
var mycolor = "black";
//자기 턴이 왔을 때 접속 활성화
connect();
function  connect(){
	ws = new WebSocket("ws://"+window.location.host+"/FarmMarbleProject/dice-ws");
	
	ws.onopen = function(){
		console.log("connect");
		setInfo();
		/*setConnected(true);*/
	};
	
	ws.onclose = function(){
		console.log("close");
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
		}
		if(command=="setnpNo"){
			npNo=json.npNo;
			
			if(npNo==1){
				mycolor="blue";
			}else if(npNo==2){
				mycolor="red";
			}else if(npNo==3){
				mycolor="orange";
			}else if(npNo==4){
				mycolor="green";
			}
			console.log("setnpNo: "+npNo+", "+mycolor);
		}		
		if(command=="buy") {
			console.log("buy");
			buy(data);
			nextTurn(data);
		}
		if(command=="notbuy"){
			console.log("notbuy");
			var pNo = data.pNo;
			if(npNo==pNo){
				alramEvent("소지금이 부족합니다.");
			}
			nextTurn(data);
		}
		if(command=="pay"){
			pay(data);
			nextTurn(data);
		}
		if(command=="change"){
			//도시 색 변경
			nextTurn(data);	
		}
		if(command=="festival"){
			festival(data);
			nextTurn(data);
		}
		if(command=="not"){		//이벤트 없이 다음 턴으로
			nextTurn(data);
		}
		if(command=="errorId"){
			alert("id 입력에 오류가 있습니다. 다시 접속해주세요");
		}
		if(command=="bankrupt"){
			console.log("bankrupt");
			bankrupt(data);
			nextTurn(data);
		}
	}
}

function nextTurn(data){
	console.log("nextTurn()");
	var pNo = data.pNo;
	var next = data.next;
	console.log(next);
	if(next>gamerNum){
		next-=gamerNum;
	}
	if(next==1){
		color="blue";
	}else if(next==2){
		color="red";
	}else if(next==3){
		color="orange";
	}else if(next==4){
		color="green";
	}
	$("#p"+pNo).children(".txt").children("h3").css("color","white");
	$("#p"+next).children(".txt").children("h3").css("color",color);
	var turn=data.turn;
	if(turn=="run"){
		$("#roll").removeAttr("disabled");
	}/*else if(turn=="wait"){
		$("#roll").attr("disabled",'disabled');
	}*/
	console.log("nextTurn: "+pNo+ ", "+ turn);
}

//턴이종료되면 비활성화
function disconnect(){
	sendmessage("disconnect");
	
	if(ws!=null){
		ws.close();
		ws=null;
	}
}