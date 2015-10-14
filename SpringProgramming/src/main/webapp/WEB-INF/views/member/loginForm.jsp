<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	
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
			width: 500px; 
			height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -220px;
			margin-top: -80px;
			font-size: 30px;
			padding: 10px;
		}
		
		.title {
			width: 10px;
			font-weight: bold;
			color: rgba(166,131,87,0.7);
			margin-right: 10px;
		}
		
		.content {
			width: 300px;
			color: rgba(106,71,27,0.8);
			font-family: 'Jeju Gothic';
			font-weight: bold;
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
		<div id=pagewrapper>
			<div id="bar">
				<div id="part">
					Login
				</div>
			</div>
		
		<form:form id="login" commandName="member">
			<div id="container">
				<span class="title">ID</span>
				<span class="content">
					<form:input path="id" size="20"/><br/>
					<form:errors path="id"/>
				</span><br/>
				<span class="title">PW</span> 
				<span class="content">
					<form:password path="pw" size="20"/><br/>
					<form:errors path="pw"/>
				</span><br/>
			</div>
			
			<div id="btnGroup">
				<div id="button">
					<a href="join">Sign up</a>
				</div>
				<div id="button">
					<a href="selectFind">Forget</a>
				</div>
				<div id="button">
					<a href="javascript:sendData()">Login</a>
				</div>
		</form:form>
		
		</div>
	</body>
</html>