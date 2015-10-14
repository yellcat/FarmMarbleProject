	    var wsc = null;
	    cconnect();
	    function cconnect() {
 			wsc = new WebSocket("wsc://"+window.location.host+"/myapp/chatcolor-ws");
 			
 			wsc.onopen = function(){
 				log("접속O");
 				setConnected(true);
 			};
 			
 			wsc.onclose = function(){
 				log("접속X");
 				setConnected(false);
 			};
 			
 			wsc.onmessage = function(event){//메세지가 오면 실행
 				var strJson = event.data;
 				var json = JSON.parse(strJson);
 				var command = json.command;
 				if(command == "display"){
					display(data);
 				}
 			}
		}
	    
		function csetConnected(connected){
			if(connected){
				$("#connect").attr("disabled",'disabled');
				$("#disconnect").removeAttr("disabled");
				$("#echo").removeAttr("disabled");
			}else{
				$("#connect").removeAttr("disabled");
				$("#disconnect").attr("disabled",'disabled');
				$("#echo").attr("disabled",'disabled');
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
						"fontColor":fontColor,
						"message":message
					}
			};
			
			var strJson = JSON.stringify(json);
			ws.send(strJson);
		}
		
		function cdisplay(data){
			var fontColor = json.fontColor;
			var data = json.data;
			log(fontColor, data);
		}
		
 			
		function clog(color,message){
            $("#console").append("<span style='display:block; color:'"+color+";/>"+message+"</span><br/>");
            if($("#console span").length>20){
               $("#console span").first().remove();
            }
            $("#console").scrollTop($("#console").height());
        }
 
	    function cdisconnect(){
			if(wsc!=null){
				wsc.close();
				wsc=null;
			}
		}
