function buy(data){
	var pNo = data.pNo;
	var location = data.location;
	var level = data.level;
	var money = data.money;
	
	if(pNo==1){
		color="blue";
	}else if(pNo==2){
		color="red";
	}else if(pNo==3){
		color="orange";
	}else if(pNo==4){
		color="green";
	}
	
	//바닥 색깔 바꾸기
	$("#" + location).css("background-color", color);
	//전에 구입한 그림 없애기
	$("#" + location).children(".S").hide();
	//씨앗, 새싹, 나무 보이기
	$("#" + location).children(".S" + level).show();
	//인포에 돈 정보 바꾸기
	$("#p"+pNo).children(".txt").children(".m").html("MONEY: "+ money);
	//턴 넘기기
	
}

function pay(data){
	var pNo = data.pNo;
	var opNo = data.opNo;
	var money = data.money;
	var omoney = data.omoney;
	
	$("#p"+pNo).children(".txt").children(".m").html("MONEY: "+ money);
	$("#p"+opNo).children(".txt").children(".m").html("MONEY: "+ omoney);
}

function bankrupt(data){
	var pNo = data.pNo;
	var olist = data.olist;	
	var location = data.location;
	var gameover = data.gameover;
	for(i=0; i<=olist.length; i++){
		console.log(olist[i]);
		
		$("#" + olist[i]).css("background-color", "yellowgreen");
		$("#" + olist[i]).children(".S").hide();
	}
	
	$("#" + location).children(".P" + pNo).hide();
	$("#p"+pNo).children(".txt").children(".m").html("MONEY: 파산");
	$("#p"+pNo).children(".txt").children(".m").css("color", "red");
	
	if(gameover=="over"){
		var winner = data.winner;
		if(winner==id){
			var result = "win";
		}else{
			var result = "lose";
		}
		var json={
				"command":"result",
				"id":id,
				"result": result
	};
	var strJson = JSON.stringify(json);
	ws.send(strJson);
		alramEvent("게임이 종료되었습니다.");
	}else{
		alramEvent("Player"+pNo+"님이 파산하셨습니다.");
	}
}

function buydialog(sentence) {	
	    $( "#gameEvent" ).dialog({	     
	      modal: true,
	      buttons: {
	        "YES": function() {	        	
	        		var json={
	        					"command":"buy",
	        					"id":id
	        		};
	        		var strJson = JSON.stringify(json);
	        		ws.send(strJson);
	        		$( this ).dialog( "close" );
	        },
	        "NO": function() {
	        		sendmessage("not");
	          $( this ).dialog( "close" );
	        }
	      }
	    });
	    $("#gameEvent").html(sentence);
	    $("#gameEvent").dialog("open");
}

function paydialog(sentence) {
	    $( "#gameEvent" ).dialog({	     
	      modal: true,
	      buttons: {
	        "OK": function() {
	        		sendmessage("pay");
	          $( this ).dialog( "close" );
	        }	        
	      }
	    });
	    $("#gameEvent").html(sentence);
	    $("#gameEvent").dialog("open");	  
}


