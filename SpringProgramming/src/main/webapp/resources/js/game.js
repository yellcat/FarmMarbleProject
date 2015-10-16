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

function buyDialgoue(data) {
	var nLoc = data.nLoc;
	
	$(function() {
	    $( "#" + nLoc ).dialog({
	      autoOpen: true,
	      height:200,
	      width: 300,
	     
	      modal: true,
	      buttons: {
	        "네": function() {
	          $( this ).dialog( "close" );
	        },
	        "아니오": function() {
	          $( this ).dialog( "close" );
	        }
	      },	      
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	    
	    $("#"+ nLoc ).dialogue.html("구입하시겠습니까?");
	  });	
}

function pay(data) {
	var nLoc = data.nLoc;
	
	$(function() {
	    $( "#" + nLoc ).dialog({
	      autoOpen: true,
	      height:200,
	      width: 300,
	     
	      modal: true,
	      buttons: {
	        "확인": function() {
	          $( this ).dialog( "close" );
	        }	        
	      },	      
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	    
	    $("#"+ nLoc ).dialogue.html("이용료를 지불하십시오");
	  });	
}

function upgradeSeed(data) {
	var nLoc = data.nLoc;
	
	$(function() {
	    $( "#" + nLoc ).dialog({
	      autoOpen: true,
	      height:200,
	      width: 300,
	     
	      modal: true,
	      buttons: {
	        "네": function() {
	          $( this ).dialog( "close" );
	        },
	        "아니오": function() {
	          $( this ).dialog( "close" );
	        }
	      },	      
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	    
	    $("#"+ nLoc ).dialogue.html("업그레이드하시겠습니까?");
	  });	
}



