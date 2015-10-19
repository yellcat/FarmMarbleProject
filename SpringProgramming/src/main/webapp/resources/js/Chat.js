		var wschat=null;
		chatconnect();
		function chatconnect() {
			wschat = new WebSocket("ws://"+window.location.host+"/SpringProgramming/chat-wschat");
 			
 			wschat.onopen = function(){
 				console.log("접속O");
 				
 			};
 			
 			wschat.onclose = function(){
 				console.log("접속X");
 				
 			};
 		
 			wschat.onmessage = function(event){//메세지가 오면 실행
 				var strJson = event.data;
 				var json = JSON.parse(strJson);
 				var command = json.command;
 				var data=json.data;
 				if(command == "cdisplay"){
					cdisplay(data);
 				}
 			}
		}
	    
		function echo(){
			var userName=$("#userName").val();
			var fontColor=$("#fontColor").val();
			var message = $("#message").val();
			console.log(userName);
			console.log(fontColor);
			console.log(message);
			if(userName==""){
				userName=="noName";
			}
			if(message==""){
				alert("no message");
				return;
			}
			var json={
					"command":"broadcast",
					"data":{
						"userName":userName,
						"fontColor":fontColor,
						"message":message
					}
			};
			
			var strJson = JSON.stringify(json);
			wschat.send(strJson);
		}
		
		function cdisplay(data){
			var fontColor = data.fontColor;
			var message = data.message;
			clog(fontColor, message);
		}
		
 			
		function clog(color,message){
            $("#console").append("<span style='display:block; color:'"+color+";/>"+message+"</span><br/>");
            if($("#console span").length>20){
               $("#console span").first().remove();
            }
            $("#chatcontent").scrollTop($("#chatcontent").height());
        }
 
