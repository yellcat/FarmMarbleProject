window.onload=function() {
	        var wid=document.querySelector("#board_writer");               
	        var mid=document.querySelector("#memberId");
	        
	        if(wid.value!=mid.value){
	               document.querySelector("#sameiduse").style.display = "none";
	        }
	        
	        
		       
	        
	                 
	      }     		
	      function sendcomment() {      
	        	document.comment.submit();
	     }
	      function deleteShow(){
	            var mid=document.querySelector("#memberId");
	            var x = document.querySelectorAll(".samewtuse"+mid.value);
	            for(var i=0; i<x.length; i++){
	               x[i].style.display = "inline";
	            }
	         }
	      
	      