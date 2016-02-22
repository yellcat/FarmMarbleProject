function levent(data){
	var check = data.check;
	var level = data.level;
	var nLoc = data.nLoc;
	var pNo = data.pNo;
	console.log(check+"game Event");
	if(check == "start"){
		if(pNo==npNo){
			sendmessage("not");
		}
		alramEvent("Player"+pNo+"시작점에 도착했습니다.<br/>소지금이 500 추가됩니다.");
	}else if(check == "buy"){
		if(pNo==npNo) {
			var price = data.price;
			var sentence = "구입하시겠습니까?<br/>$"+price+"가 차감됩니다.";
			buydialog(sentence);
		}
	}else if(check=="pay"){
		if(pNo==npNo) {
			var sentence = "이용료를 지불해주세요";
			paydialog(sentence);
		}
	}else if(check=="gold"){
		$("#c"+level).show();
		var sentence="황금열쇠 발견!<br/>";
		if(level==1){
			if(pNo==npNo){
				sentence+="Player"+pNo+"님이 고비사막에 도착했습니다.<br/>1턴간 휴식합니다";
				moveEvent(sentence, "desert", nLoc, pNo, 18);
			}else{
				sentence+="Player"+pNo+"님이 고비사막에 도착했습니다.<br/>1턴간 휴식합니다";
				moveEvent(sentence, "", nLoc, pNo, 18);
			}
		}else if(level==2){
			if(pNo==npNo){
				sentence+="도시를 변경합니다.<br/>원하는 도시를 입력하세요" +
				"<input id='dialogIn' type='text'>";
				stateEvent(sentence, "change");
			}else{
				sentence+="Player"+pNo+"님이 도시를 교환합니다.";
				alramEvent(sentence);
			}
		}else if(level==3){
			sentence+="Player"+pNo+"님이 시작지점으로 이동합니다.";
			if(pNo==npNo){
				moveEvent(sentence, "not", nLoc, pNo, 0);
			}else{
				moveEvent(sentence, "", nLoc, pNo, 0);
			}			
		}else if(level==4){
			sentence+="Player"+pNo+"이 황금을 발견했습니다.<br/>소지금이 500 추가됩니다.";
			if(pNo==npNo){
				stateEvent(sentence, "not");
			}else{
				alramEvent(sentence);
			}
			
		}
	}else if(check=="spot"){
		var sentence="Player"+pNo+"이";
		var command = null;
		
		if(level==12){
			sentence="수확제가 개최됩니다!<br/>";
			if(pNo==npNo){
				sentence+="원하는 도시를 선택하세요!" +
					"<input id='dialogIn' type='text'>";
				stateEvent(sentence,"festival");
			}else{
				sentence+="Player"+pNo+"님이 수확제를 개최합니다.";
				alramEvent(sentence);
			}
		}else if(level==18){
			sentence="고비사막에 도착했습니다.";
			if(pNo==npNo){
				sentence+="<br/>1턴간 구조를 기다리세요!";
				stateEvent(sentence,"desert");
			}else{
				sentence+="Player"+pNo+"님은 1턴간 휴식합니다.";
				alramEvent(sentence)
			}
		}
	}
}

function stateEvent(sentence, command) {
	$("#gameEvent").dialog({
	      modal: true,
	      buttons: {
	    	  OK: function() {
	    		  $(".ocard").hide();
	    		var json={
	    					"command":command,
	    					"id":id,
	    					"country":$("#dialogIn").val()
	    			};
	    		var strJson = JSON.stringify(json);
	    		ws.send(strJson);
	    		  $( this ).dialog("close");
	        }
	      }
	    });
	$("#gameEvent").html(sentence);
    $( "#gameEvent" ).dialog( "open" );
}

function moveEvent(sentence, command, nLoc, pNo, loc) {
	$("#gameEvent").dialog({
	      modal: true,
	      buttons: {
	    	  OK: function() {
	    		  if(command!=""){
	    			  console.log("moveEvent: "+command);
		    		  sendmessage(command);
	    		  }
	    		$(".ocard").hide();
	    		$(".P"+pNo).hide();
				$("#"+loc).children(".P"+pNo).show();
	        	$( this ).dialog("close");
	        }
	      }
	    });
	$("#gameEvent").html(sentence);
    $( "#gameEvent" ).dialog( "open" );
}

function alramEvent(sentence) {
	$( "#gameEvent" ).dialog({
	      modal: true,
	      buttons: {
	    	  OK: function(){
	    		  $(".ocard").hide();
	    		  $( this ).dialog("close");
	    	  }
	      }}
	    );
	$("#gameEvent").html(sentence);
    $( "#gameEvent" ).dialog("open");
}