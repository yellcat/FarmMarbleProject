<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript">
	var result = "unable";
	function idCheck(){
		var id = $("#id").val();
		console.log(id);
		$.ajax({
			url:"idCheck",
			method:"POST",
			data:{"id":id},
			success:function(data){
				console.log(data);
				result = data.trim();
				if(result == "able"){
					al("사용 가능한 ID입니다");
				}else if(result=="unable"){
					al("사용 불가능한 ID입니다");
					$("#join")[0].reset();
				}
			}
		});
	};
	function sendData(){
		if(result=="unable"){
			al("id 사용 가능 여부를 체크해주십시오");
			return;
		}
		if($("#pw").val()!=$("#pwCheck").val()){
			al("Password is not the same as above.");
			return;
		}
		$("#join").submit();
	}
	function al(sentence) {
		$( "#errordialog" ).dialog({
		      modal: true,
		      buttons: {
		    	  OK: function(){
		    		  $( this ).dialog("close");
		    	  }
		      }}
		    );
		$("#errordialog").html(sentence);
	    $( "#errordialog" ).dialog("open");
	}
	</script>
	
	<style>
		#errordialog{
			font-family: 'Jeju Gothic';
		}
		#pagewrapper{
			text-align: center;
			font-family: 'Righteous', cursive;
		}
		
		#bar{
			display:flex;
			margin: 40px;
			border: none;
			border-radius: 15px;
			background-color: rgb(136,101,57);
			text: bold;
			text-align: center;
			font-size: 30px;
		}
		
		#part{
			display:inline-block;
			flex:1;
			color: white;
		}
		
		#container {
			width: 400px; 
			height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -180px;
			margin-top: -80px;
		}
		
		.title {
			width: 100px;
			font-weight: bold;
			text-align: left;
			color: rgba(166,131,87,0.9);
			margin-right: 5px;
			margin-bottom: 5px;
			float: left;
		}
		
		.content {
			width: 290px;
			height: 20px;
			margim-bottom: 5px;
			color: rgba(255,0,0,0.5);
			font-family: 'Jeju Gothic';
			font-weight: bold;
			text-align: left;
		}
		
		#boxContent {
			width: 290px;
			height: 20px;
			margin-left: 65px;
			margin-bottom: 5px;
			color: rgba(255,0,0,0.5);
			font-family: 'Jeju Gothic';
			font-weight: bold;
			text-align: left;
		}
		
		#checkButton {
			width: 50px;
			border: none;
			border-radius: 3px;
			background-color: rgba(166,131,87,0.5);
		}
		
		#checkButton:hover { background-color: rgb(186,151,107);}
		#checkButton > a:active { color: rgb(136,101,57);}
		#checkButton > a {
			line-height: 100%;
			font-size: 12px;
			text-decoration: none;
			font-family: 'Jeju Gothic';
			color: rgb(255,221,177);
			text-align: center;
		}
		
		#btnGroup{
			margin: 50px;
			width: 500px; height: 30px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -410px;
			margin-top: 100px;
		}
			
		#button{
			display:inline-block;
			margin: 2px;
			width: 100px;
			height: 40px;
			border: none;
			border-radius: 15px;
			background-color: rgb(136,101,57);
			float: right;
			text-align: center;
		}
		
		#button:hover { background-color: rgb(186,151,107);}
		#button > a:active { color: rgb(136,101,57);}
		#button > a {
			line-height: 40px;
			font-size: 20px;
			text-decoration: none;
			color: rgb(255,221,177);
		}
	</style>
	
	<body>
		<div id="pagewrapper">
			<div id="bar">
				<div id="part">
					<h4>New Account</h4>
				</div>
			</div>
			
			<div id="errordialog" title="error">
			</div>
			
			<div id="container">
				<form:form id="join" commandName="member">
					
					<span class="title">ID</span>
					<span id="boxContent">
						<form:input path="id" id="id" size="20"/>
							<span id="checkButton">
								<a href="javascript:idCheck()">ID중복체크</a>
							</span><br/>
						<form:errors path="id"/>
					</span><br/>
					
					<span class="title">NAME</span>
					<span class="content">
						<form:input path="name" size="20"/><br/>
						<form:errors path="name"/>
					</span><br/>
					
					<span class="title">PW(4~12)</span>
					<span class="content">
						<form:password id = "pw" path="pw" size="20"/><br/>
						<form:errors path="pw"/>
					</span><br/>
					
					<span class="title">Reenter PW</span>
					<span class="content">
						<input type="password" id = "pwCheck" path="pw" size="20"/><br/>
					</span><br/>
					
				</form:form>
			</div>
			
				<div id="btnGroup">
					<div id="button">
						<a id="btnCancle" href="login">cancel</a>
					</div>
					<div id="button">
						<a href="javascript:sendData()">Sign up</a>
					</div>
				</div>
				
			</div>
		</body>
</html>
