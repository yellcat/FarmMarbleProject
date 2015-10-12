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
			width: 300px; height: 200px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -250px;
			margin-top: -125px;
			overflow: hidden;
		}
		
		#title {
			float: left; width: 150px;
		}
		#content {
			float: left; width: 150px;
		}
		
/* 		#content {
			text-align: center;
			color: white;
			margin: 100px 200px;
			padding: 50px;
			text: bold;
			font: 50px;
			float: center;
		} */
		
		#btnGroup{
			margin: 50px;
			width: 700px; height: 50px;
			position: absolute;
			left: 50%;
			top: 50%;
			margin-left: -380px;
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
			text-align: center;
			float: right;
			color: white;
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
			<div id="title">ID</div>
			<div id="content">${member.id}</div>
			<div id="title">NAME</div>
			<div id="content">${member.name}</div>
			<div id="title">NICKNAME</div>
			<div id="content">${member.nickName}</div>
			<div id="title">TEL</div>
			<div id="content">${member.tel}</div>
			<div id="title">EMAIL</div>
			<div id="content">${member.email}</div>
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