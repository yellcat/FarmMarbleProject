<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Change Password</title>
	</head>
	
	<script src="${pageContext.request.contextPath}/resources/js/submit.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	
	<style>
		#pagewrapper{
			text-align: center;
			font-family: 'Righteous', cursive;
		}
		
		#bar{
			display: flex;
			margin: 40px;
			border: none;
			border-radius: 15px;
			background-color: rgb(136,101,57);
			color: white;
			text: bold;
			text-align: center;
			font-size: 20px;
		}
		
		#part{
			display:inline-block;
			flex: 1;
			color:white;
		}
		
		#cancle{
			height:30px;
			width:30px;
			float: right;
		}
		
		#container {
			width: 600px; height: 300px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -250px;
			margin-top: -80px;
			font-size: 30px;
			color: rgb(136,101,57);
		}
		
		.title {
			width: 350px;
			text-align: left;
			font-weight: bold;
		}
		
		.content {
			width: 250px;
			height: 30px;
			float: right;
			color: red;
			font-size: 15px;
		}
		
		#pw.errors {
			
		}
		
		#btnGroup{
			margin: 50px;
			width: 700px; height: 50px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -385px;
			margin-top: 140px;
		}
			
		#button{
			display:inline-block;
			margin: 5px;
			width: 200px;
			height: 50px;
			border: none;
			border-radius: 10px;
			background-color: rgb(136,101,57);
			float: right;
			text-align: center;
		}
		
		#button:hover { background-color: rgb(186,151,107);}
		#button > a:active { color: rgb(136,101,57);}
		#button > a {
			width: 200px;
			line-height: 50px;
			font-size: 25px;
			text-decoration: none;
			color: rgb(255,221,177);
		}
		
	</style>
	
	<body>
		<div id="pagewrapper">
			<div id="bar">
				<div id="part">
					<h2>Change Password</h2>
				</div>
				<a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
		</div>
		
		<form:form name="form" commandName="member">
	      <div id="container">
				<span class="title">Current Password</span>
				<span class="content">
					<form:password id="pw" path="pw" size="20"/></br>
					<form:errors path="pw"/></br>
				</span></br>
				<span class="title">Change Password to</span>
				<span class="content">
					<form:password id="pwChanage" path="pwChange" size="20"/></br>
					<form:errors path="pwChange"/>
				</span></br>
				<span class="title">Repeat Password above</span>
				<span class="content">
					<form:password id="pwCheck" path="pwCheck" size="20"/></br>
					<form:errors path="pwCheck"/>
				</span></br>
	      </div>
      </form:form>
      <div id="btnGroup">
      	<div id="button" >
      		<a href="javascript:sendData()">Change PW</a>
      	</div>
      </div>
	</body>
</html>