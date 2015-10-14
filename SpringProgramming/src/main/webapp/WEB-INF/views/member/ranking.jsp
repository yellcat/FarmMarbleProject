<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			width: 550px; height: 300px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -180px;
			margin-top: -100px;
			font-size: 30px;
			color: rgb(136,101,57);
		}
		
		.title {
			width: 200px;
			font-size: 25px;
			font-weight: bold;
			color: rgba(106,71,27,0.6);
			margin-top: 7.5px;
			margin-bottom: 7.5px;
			margin-left: 60px;
			margin-right: 70px;
		}
		
		.content {
			width: 300px;
			height: 25px;
			float: right;
			color: rgba(106,71,27,0.9);
			font-size: 30px;
			margin-bottom: 7.5px;
			margin-left: 20px;
		}
		
		.border {
			color: rgba(106,71,27,0.5);
		}
		
		.rateTitle {
			width: 200px;
			text-align: left;
			font-size: 30px;
			font-weight: bold;
			color: rgba(106,71,27,0.6);
			margin-top: 7.5px;
			margin-bottom: 7.5px;
			margin-left: 10px;
			margin-right: 30px;
		}
		
		.rateContent {
			width: 200px;
			text-align: left;
			font-size: 30px;
			font-weight: bold;
			margin-top: 7.5px;
			margin-bottom: 7.5px;
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
      				<h2>Ranking</h2>
    			</div>
    			<a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
    		</div>
    	</div>
    	
      	<div id="container">
	        <span class="title">WIN</span>
	        <span class="content">${member.win}</span><br/>
			<span class="title">LOSE</span>
	        <span class="content">${member.lose}</span><br/>
	        <span class="border">--------------------</span></br>
	        <span class="rateTitle">Winning RATE</span>
	        <span class="rateContent">${member.rate}</span><br/>
      </div>
      
      <div id="btnGroup">
      	<div id="button">
      		<a href="../menu" id="btnCancle">GO TO MENU</a>
      	</div>
      </div>
	</body>
</html>