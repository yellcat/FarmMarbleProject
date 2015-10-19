function levent(data){
	
	var check = data.check;
	var level = data.level;
	console.log(check);
	if(check == "buy"){
		//구입 or 취소
	}else if(check=="upgrade"){
		//구입 or 취소
	}else if(check=="pay"){
		//금액 and 확인
	}else if(check=="gold"){
		var sentence = "황금카드 발견!<br/> ";
		if(level==1){
			sentence+="고비사막에 도착했습니다.<br/>3턴간 구조를 기다리세요!";
		}else if(level==2){
			sentence+="도시를 변경합니다.";
		}else if(level==3){
			sentence+="시작지점으로 이동합니다.";
		}else if(level==4){
			sentence+="황금을 발견했습니다.<br/>소지금이 500 추가됩니다.";
		}else if(level==5){
			sentence+="비행기로 이동합니다.<br/>원하는 도시로 이동할 수 있습니다.";
		}
		gameEvent(sentence);
	}else if(check=="spot"){
		var sentence=null;
		if(level==6){
			sentence="세계여행!<br/>다음 턴에 원하는 도시를 선택할 수 있습니다.";
		}else if(level==12){
			sentence="수확제가 개최됩니다!<br/>원하는 도시를 선택하세요!";
		}else if(level==18){
			sentence="고비사막에 도착했습니다.<br/>3턴간 구조를 기다리세요!";
		}
		gameEvent(sentence);
	}
}

function gameEvent(sentence) {
	$( "#gameEvent" ).dialog({
	      modal: true,
	      buttons: {
	    	OK: function() {
	          $( this ).dialog( "close" );
	        }
	      }
	    });
	$("#gameEvent").html(sentence);
    $( "#gameEvent" ).dialog( "open" );
}