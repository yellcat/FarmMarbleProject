function sendData(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			$.ajax({
				url:"loginCheck",
				method:"POST",
				data:{"id":id, "pw":pw},
				success:function(data){
					console.log(data);
					var result = data.trim();
					if(result == "success"){
						$("#login").submit();
					}else if(result=="wrong_id"){
						alert("Please check your id");
					}else if(result=="wrong_pw"){
						alert("Please check your password");
					}
				}
			});
		}