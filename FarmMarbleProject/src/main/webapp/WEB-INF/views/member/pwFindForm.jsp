<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
	
	.content {
		width: 300px;
		height: 20px;
		margim-bottom: 5px;
		color: rgba(255,0,0,0.5);
		font-family: 'Jeju Gothic';
		font-weight: bold;
		float: right;
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
				<div id="part">Find PW</div>	
			</div>
		
		<form:form name="form" commandName="member">
			<div id="container">
				<span class="title">ID</span>
				<span class="content">
					<form:input path="id" size="20"/>
				</span><br/>
				
				<span class="title">E-mail</span>
				<span class="content">
					<form:input path="email" size="20"/><br/>
					<form:errors path="email"/>
				</span><br/>
					
				<div id="btnGroup">
					<div id="button">
						<a id="btnCancle" href="login">cancel</a>
					</div>
					<div id="button">
						<a href="javascript:sendData()">FIND</a>
					</div>
				</div>
			</div>
		</form:form>
		</div>
	</body>
</html>