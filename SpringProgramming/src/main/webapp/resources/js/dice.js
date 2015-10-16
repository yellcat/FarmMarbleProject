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

function setPlayer(data){
	var pNo = data.pNo;
	var oid = data.oid;
	var money = data.money;
	
	npNo = pNo;
	
	if(pNo==1){
		color="yellow";
	}else if(pNo==2){
		color="red";
	}else if(pNo==3){
		color="orange";
	}else if(pNo==4){
		color="green";
	}
	
	$("#p"+pNo).children(".txt").children(".u").html("USER: "+ oid);
	$("#p"+pNo).children(".txt").children(".m").html("MONEY: "+ money);
}

function clearInfo(data){
	var pNo = data.pNo;
	$(".P"+pNo).hide();
	$("#p"+pNo).children(".txt").children(".u").html("USER: ");
	$("#p"+pNo).children(".txt").children(".m").html("MONEY: ");
	$("#p"+pNo).children(".txt").children("h3").css("color","white");
}

function sendmessage(command){
	var json={
				"command":command,
				"id":id
		};
	var strJson = JSON.stringify(json);
	ws.send(strJson);
}

function ready(){
	sendmessage("ready");
	$("#connect").attr("disabled",'disabled');
	$("#disconnect").removeAttr("disabled");
}

function wait(){
	sendmessage("deleteInfo");
	$("#connect").removeAttr("disabled");
	$("#disconnect").attr("disabled",'disabled');
}

function roll(){
	$("#roll").attr("disabled",'disabled');
	sendmessage("roll");
}

function start(json){	
	console.log("start");
	console.log(json);
	
	var gamerNum=json.gamerNum;
	var turn=json.turn;
	
	for(var i=0; i<gamerNum;i++){
		$("#0").children(".P"+(i+1)).show();
		if(turn=="run"){
			console.log(npNo);
			$("#p"+(i+1)).children(".txt").children("h3").css("color",color);
			$("#roll").removeAttr("disabled");
		}
	}
}

//주사위를 굴리면 주사위/플레이어 값 변경
function display(json){
	var pNo=json.pNo; //플레이어 넘버
	var dNo=json.dNo; //주사위값
	var bLoc=json.bLoc; //이전 위치
	var nLoc=json.nLoc; //현재위치
	
	console.log(json);
	
	$(".dice").hide();
	$("#p"+pNo).children(".txt").children("h3").css("color","white");
	$("#d"+dNo).show(); //주사위값 보여주기
	$("#"+bLoc).children(".P"+pNo).hide(); //이전 위치 지우기
	$("#"+nLoc).children(".P"+pNo).show(); //현재위치 보여주기
}