		var wschat=null;
		chatconnect();
		function chatconnect() {
			wschat = new WebSocket("ws://"+window.location.host+"/myapp/chat-wschat");
 			
 			wschat.onopen = function(){
 				clog("접속O");
 				
 			};
 			
 			wschat.onclose = function(){
 				clog("접속X");
 				
 			};
 			wschat.onmessage = function(event){//메세지가 오면 실행
 				var strJson = event.data;
 				var json = JSON.parse(strJson);
 				var command = json.command;
 				if(command == "display"){
					cdisplay(data);
 				}
 			}
		}
	    
		function echo(){
			var userName=$("#userName").val();
			var fontColor=$("#fontColor").val();
			var message = $("#message").val();
			
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
						"fontColor":"#ff0000",
						"message":message
					}
			};
			
			var strJson = JSON.stringify(json);
			wschat.send(strJson);
		}
		
		function cdisplay(data){
			var fontColor = json.fontColor;
			var data = json.data;
			clog(fontColor, data);
		}
		
 			
		function clog(color,message){
            $("#console").append("<span style='display:block; color:'"+color+";/>"+message+"</span><br/>");
            if($("#console span").length>20){
               $("#console span").first().remove();
            }
            $("#console").scrollTop($("#console").height());
        }
 
