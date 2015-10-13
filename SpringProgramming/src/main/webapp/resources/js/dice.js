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
	$("#d"+dNo).show(); //주사위값 보여주기
	$("#"+bLoc).children(".P"+pNo).hide(); //이전 위치 지우기
	$("#"+nLoc).children(".P"+pNo).show(); //현재위치 보여주기
}