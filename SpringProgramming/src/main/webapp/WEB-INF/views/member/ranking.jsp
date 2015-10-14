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
			width: 400px; height: 300px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -180px;
			margin-top: -120px;
			font-size: 30px;
			color: rgb(136,101,57);
		}
		
		.title {
			width: 200px;
			text-align: left;
			font-weight: bold;
			margin-top: 7.5px;
			margin-bottom: 7.5px;
		}
		
		.content {
			width: 200px;
			height: 10px;
			float: right;
			color: rgba(106,71,27,0.8);
			font-size: 25px;
			margin-bottom: 7.5px;
		}
		
		#pw.errors {
			color: red;
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
	<div id="bar">
      <h4>ranking</h4><a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
    </div>
      <div id="part">
        <span class="title">WIN</span>
        <span class="content">${member.win}</span><br/>
		<span class="title">LOSE</span>
        <span class="content">${member.lose}</span><br/>
        <span class="title">winningRATE</span>
        <span class="content">${member.rate}</span><br/>
      </div>
	</body>
</html>