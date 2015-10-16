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
	<script type="text/javascript">
	function idCheck(){
		var id = $("#id").val();
		console.log(id);
		$.ajax({
			url:"idCheck",
			method:"POST",
			data:{"id":id},
			success:function(data){
				console.log(data);
				var result = data.trim();
				if(result == "able"){
					alert("사용 가능한 ID입니다");
				}else if(result=="unable"){
					alert("사용 불가능한 ID입니다");
					$("#join")[0].reset();
				}
			}
		});
	};
	function sendData(){
		if($("#pw").val()!=$("#pwCheck").val()){
			alert("Password is not correct.");
			return;
		}
		$("#join").submit();
	}
	</script>
	
	<style>
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
			width: 450px; 
			height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -220px;
			margin-top: -80px;
		}
		
		.title {
			width: 100px;
			font-weight: bold;
			text-align: left;
			color: rgba(166,131,87,0.9);
			margin-right: 5px;
			margin-bottom: 10px;
			float: left;
		}
		
		.content {
			width: 300px;
			color: rgba(106,71,27,0.8);
			font-family: 'Jeju Gothic';
			font-weight: bold;
			margin-bottom: 10px;
			float: left;
		}
		
		#checkButton {
			
		}
		
		#btnGroup{
			margin: 50px;
			width: 500px; height: 30px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -335px;
			margin-top: 60px;
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
					<h4>JOIN</h4>
				</div>
			</div>
			<div id="container">
				<form:form id="join" commandName="member">
					<span class="title">ID</span>
					<span class="content">
						<form:input path="id" id="id" size="20"/>
						<form:errors path="id"/>
					</span>
					<span id="checkButton">
						<a href="javascript:idCheck()">ID중복체크</a>
					</span><br/>
					
					<span class="title">NAME</span>
					<span class="content">
						<form:input path="name" size="20"/>
						<form:errors path="name"/>
					</span><br/>
					
					<span class="title">PW(4~12)</span>
					<span class="content">
						<form:password id = "pw" path="pw" size="20"/>
						<form:errors path="pw"/>
					</span><br/>
					
					<span class="title">Reenter PW</span>
					<span class="content">
						<input type="password" id = "pwCheck" path="pw" size="20"/>
					</span><br/>
					
					<div id="btnGroup">
						<div id="button">
							<a id="btnCancle" href="login">CANCEL</a>
						</div>
						<div id="button">
							<a href="javascript:sendData()">JOIN</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</body>
</html>