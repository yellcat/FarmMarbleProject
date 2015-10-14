function buy(){
	sendmessage("buy");
}

function sendmessage(buy) {
	var json = {
			"command": buy,
			"id": id
	};
	var strJson = JSON.stringify(json);
	ws.send(strJson);
}