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
			width: 400px; 
			height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -150px;
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
			color: rgba(106,71,27,0.8);
			font-family: 'Jeju Gothic';
			font-weight: bold;
			text-align: left;
			float: left;
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
			margin-left: -470px;
			margin-top: 50px;
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
				<div id="part">Find ID</div>
			</div>
			
		<form:form name="form" commandName="member">
			<span class="title">NAME</span>
			<span class="content">
				<form:input path="name" size="20"/>
			</span><br/>
			
			<span class="title">E-mail</span>
			<span class="content">	
				<form:input path="email" size="20"/><br/>
			</span><br/>
			
			<div id="btnGroup">
				<div id="button">
					<a href="javascript:sendData()">FIND</a>
				</div>
				<div id="button">
					<a id="btnCancle" href="selectFind">cancel</a>
				</div>
			</div><br/>
			<form:errors path="email"/>
		</form:form>
		</div>
	</body>
</html>