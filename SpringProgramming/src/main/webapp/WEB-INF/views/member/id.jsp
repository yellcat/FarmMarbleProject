<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Find ID</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/submit.js"></script>
	
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
			width: 300px; 
			height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -150px;
			margin-top: -80px;
		}
		
		.title {
			width: 200px;
			font-weight: bold;
			color: rgba(166,131,87,0.9);
			margin-right: 5px;

		}
		
		#btnGroup{
			margin: 50px;
			width: 500px; height: 30px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -395px;
			margin-top: 30px;
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
				<div id="part">ID</div>
			</div>
			
			<div id="container">
				<span class="title">ID : ${id}</span><br/>
				<div id="btnGroup">
					<div id="button">
						<a href="login">LOGIN</a>
					</div>
					<div id="button">
						<a href="pwFind">Find PW</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>