$(function() {
		    $( "#dialog" ).dialog({
		      autoOpen: false,
		      height:350,
		      width: 450,
		     
		      show: {
		        effect: "blind",
		        duration: 1000
		      },
		      hide: {
		        effect: "explode",
		        duration: 1000
		      }
		    });
		 
		    $( "#q" ).click(function() {
		      $( "#dialog" ).dialog( "open" );
		    });
		  });	
	