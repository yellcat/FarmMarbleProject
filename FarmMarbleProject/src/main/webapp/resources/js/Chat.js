		var wschat=null;
		chatconnect();
		function chatconnect() {
			wschat = new WebSocket("ws://"+window.location.host+"/FarmMarbleProject/chat-wschat");
 			
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
			var message = $("#message").val();
			
			console.log(userName);
			
			console.log(message);
			if(userName==""){
				userName=="noName";
			}
			if(message==""){
				alert("no message");
				return;
			}
			if(mycolor!="blue"&&mycolor!="red"&&mycolor!="orange"&&mycolor!="green"){
				mycolor="black";
			}
			var json={
					"command":"broadcast",
					"data":{
						"userName":userName,
						"fontColor":mycolor,
						"message":message
					}
			};
			
			var strJson = JSON.stringify(json);
			wschat.send(strJson);
		}
		
		function cdisplay(data){
			var fontColor = data.fontColor;
			var message = data.message;
			var userName=data.userName;
			scroll(fontColor, message,userName);
		}
		
 			
		function scroll(color,message,userName){
			console.log(color);
			$("#console").append("<span style='display:block;color:" + color + ";'>" + userName + "</span>"+"<span style='display:block;'>" + message + "</span>");
            $("#chatcontent").scrollTop(10000);
        }
 
		function EnterCheck(){
			if(event.keyCode==13){
				echo();
				$("#message").val("");
			}
		}
		
		function chatremove(){
			$("#message").val("");
		}
		function chatdisconnect(){
			
			if(wschat!=null){
				wschat.close();
				wschat=null;
			}
		}
		