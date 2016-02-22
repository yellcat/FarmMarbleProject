<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	
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
			color: white;
			text: bold;
			text-align: center;
			font-size: 20px;
		}
		
		#part{
			display:inline-block;
			flex:1;
			color:white;
		}
		
		#cancle{
			height:30px;
			width:30px;
		}
		
		#container {
			width: 600px; 
			height: 300px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -250px;
			margin-top: -130px;
			font-size: 30px;
			padding: 10px;
		}
		
		.title {
			width: 150px;
			float: left;
			text-align: left;
			font-weight: bold;
			color: rgba(136,101,57,0.8);
			margin-right: 10px;
		}
		
		.content {
			width: 300px;
			color: rgba(106,71,27,0.8);
			font-size: 25px;
			font-family: 'Jeju Gothic';
			font-weight: bold;
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
     				<h2>My Page</h2>
     			</div>
     			<a href="../menu" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
     		</div>
        <div id="container">
			<span class="title">ID</span>
			<span class="content">${member.id}</span><br/>
			<span class="title">NAME</span>
			<span class="content">${member.name}</span><br/>
			<span class="title">NICKNAME</span>
			<span class="content">${member.nickName}</span><br/>
			<span class="title">TEL</span>
			<span class="content">${member.tel}</span><br/>
			<span class="title">EMAIL</span>
			<span class="content">${member.email}</span><br/>
		</div>
        <div id="btnGroup">
	        <div id="button">
	     	<a href="ranking">RANKING</a>
	     </div>
	     <div id="button">
     	 	<a href="mypageUpdate">UPDATE</a>
     	 </div>
     	 <div id="button">
     	 	<a href="pwChange">CHANGE PW</a>
     	 </div>
      	</div>
      </div>
	</body>
</html>