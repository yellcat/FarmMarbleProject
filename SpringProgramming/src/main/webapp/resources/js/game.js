function buy(){
	sendmessage("buy");
}

function setSeed(data) {
	var bLoc = data.bLoc;
	var nLoc = data.nLoc;
	var level = data.level;	
	
	$("#"+bLoc).children(".S"+level).hide();
	$("#"+nLoc).children(".S"+level).show();
	
}

